# Family Tree - Data Model Specification

## Overview

This document defines the data models, relationships, and database schema for the Family Tree application.

## Entity Relationship Diagram

```
┌──────────────┐         ┌──────────────┐         ┌──────────────┐
│    User      │1      * │  TreeMember  │*      1 │    Tree      │
│              │─────────│              │─────────│              │
│  - id        │         │  - userId    │         │  - id        │
│  - email     │         │  - treeId    │         │  - name      │
│  - name      │         │  - role      │         │  - ownerId   │
└──────────────┘         └──────────────┘         └──────────────┘
                                                          │
                                                          │1
                                                          │
                                                          │*
                         ┌──────────────┐         ┌──────────────┐
                         │ Relationship │         │    Person    │
                         │              │*      2 │              │
                         │  - id        │─────────│  - id        │
                         │  - type      │         │  - treeId    │
                         │  - person1Id │         │  - firstName │
                         │  - person2Id │         │  - lastName  │
                         └──────────────┘         └──────────────┘
                                                          │
                                                          │1
                                                          │
                                                          │*
                                                   ┌──────────────┐
                                                   │    Media     │
                                                   │              │
                                                   │  - id        │
                                                   │  - personId  │
                                                   │  - url       │
                                                   │  - type      │
                                                   └──────────────┘
```

## Core Entities

### 1. User

Represents a registered user of the application.

```typescript
interface User {
  id: string; // UUID
  email: string; // Unique, required
  passwordHash: string;
  firstName: string;
  lastName: string;
  profilePictureUrl?: string;
  phoneNumber?: string;
  dateOfBirth?: Date;
  preferences: UserPreferences;
  emailVerified: boolean;
  mfaEnabled: boolean;
  mfaSecret?: string;
  lastLoginAt?: Date;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date; // Soft delete
}

interface UserPreferences {
  language: string; // Default: 'en'
  theme: 'light' | 'dark' | 'auto';
  dateFormat: string;
  defaultTreeView: 'vertical' | 'horizontal' | 'radial';
  notifications: {
    email: boolean;
    push: boolean;
    treeUpdates: boolean;
    collaborationInvites: boolean;
  };
}
```

**Indexes:**
- `email` (unique)
- `createdAt`
- `deletedAt`

### 2. Tree

Represents a family tree that can contain multiple people.

```typescript
interface Tree {
  id: string; // UUID
  name: string;
  description?: string;
  ownerId: string; // References User.id
  visibility: 'private' | 'family' | 'public';
  settings: TreeSettings;
  coverImageUrl?: string;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date;
}

interface TreeSettings {
  allowCollaboration: boolean;
  requireApprovalForEdits: boolean;
  showLivingPersonDetails: boolean;
  privacyYearThreshold: number; // e.g., 100 years
  defaultPersonPrivacy: 'private' | 'family' | 'public';
}
```

**Indexes:**
- `ownerId`
- `visibility`
- `createdAt`

### 3. TreeMember

Represents the relationship between a User and a Tree (for collaboration).

```typescript
interface TreeMember {
  id: string; // UUID
  treeId: string; // References Tree.id
  userId: string; // References User.id
  role: TreeRole;
  invitedBy: string; // References User.id
  invitedAt: Date;
  acceptedAt?: Date;
  permissions: TreePermissions;
  createdAt: Date;
  updatedAt: Date;
}

enum TreeRole {
  OWNER = 'owner',
  ADMIN = 'admin',
  EDITOR = 'editor',
  VIEWER = 'viewer',
}

interface TreePermissions {
  canAddPerson: boolean;
  canEditPerson: boolean;
  canDeletePerson: boolean;
  canAddRelationship: boolean;
  canEditRelationship: boolean;
  canDeleteRelationship: boolean;
  canUploadMedia: boolean;
  canDeleteMedia: boolean;
  canInviteMembers: boolean;
  canEditSettings: boolean;
}
```

**Indexes:**
- `treeId, userId` (composite unique)
- `userId`
- `role`

### 4. Person

Represents an individual in a family tree.

```typescript
interface Person {
  id: string; // UUID
  treeId: string; // References Tree.id

  // Basic Information
  firstName: string;
  middleName?: string;
  lastName?: string;
  maidenName?: string;
  nicknames?: string[];
  suffix?: string; // Jr., Sr., III, etc.
  prefix?: string; // Dr., Rev., etc.

  // Demographics
  gender?: 'male' | 'female' | 'other' | 'unknown';
  dateOfBirth?: Date;
  placeOfBirth?: Place;
  dateOfDeath?: Date;
  placeOfDeath?: Place;
  isLiving: boolean;

  // Additional Information
  biography?: string;
  occupation?: string[];
  education?: string[];
  religion?: string;
  ethnicity?: string[];

  // Contact (for living relatives)
  email?: string;
  phoneNumber?: string;
  address?: Address;

  // Metadata
  privacy: 'private' | 'family' | 'public';
  profilePictureId?: string; // References Media.id
  customFields: Record<string, any>; // JSONB for extensibility

  // Audit
  createdBy: string; // References User.id
  updatedBy: string; // References User.id
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date;
}

interface Place {
  name: string;
  city?: string;
  state?: string;
  country?: string;
  latitude?: number;
  longitude?: number;
}

interface Address {
  street?: string;
  city?: string;
  state?: string;
  postalCode?: string;
  country?: string;
}
```

**Indexes:**
- `treeId`
- `treeId, lastName, firstName` (composite)
- `isLiving`
- `createdBy`
- `fullTextSearch` (GIN index for PostgreSQL)

### 5. Relationship

Represents connections between people (parent-child, spouse, etc.).

```typescript
interface Relationship {
  id: string; // UUID
  treeId: string; // References Tree.id
  type: RelationshipType;

  // Person References
  person1Id: string; // References Person.id
  person2Id: string; // References Person.id

  // Relationship Details
  startDate?: Date; // Marriage date, adoption date, etc.
  endDate?: Date; // Divorce date, death of spouse, etc.
  place?: Place;
  status?: RelationshipStatus;

  // Additional Context
  notes?: string;
  customFields: Record<string, any>;

  // Audit
  createdBy: string;
  updatedBy: string;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date;
}

enum RelationshipType {
  // Biological
  BIOLOGICAL_PARENT = 'biological_parent',
  BIOLOGICAL_CHILD = 'biological_child',

  // Adoptive
  ADOPTIVE_PARENT = 'adoptive_parent',
  ADOPTIVE_CHILD = 'adoptive_child',

  // Step
  STEP_PARENT = 'step_parent',
  STEP_CHILD = 'step_child',

  // Foster
  FOSTER_PARENT = 'foster_parent',
  FOSTER_CHILD = 'foster_child',

  // Marriage/Partnership
  SPOUSE = 'spouse',
  PARTNER = 'partner',

  // Siblings
  SIBLING = 'sibling',
  HALF_SIBLING = 'half_sibling',
  STEP_SIBLING = 'step_sibling',

  // Other
  GUARDIAN = 'guardian',
  GODPARENT = 'godparent',
}

enum RelationshipStatus {
  CURRENT = 'current',
  ENDED = 'ended',
  DIVORCED = 'divorced',
  WIDOWED = 'widowed',
  SEPARATED = 'separated',
}
```

**Indexes:**
- `treeId`
- `person1Id`
- `person2Id`
- `type`
- `person1Id, person2Id, type` (composite unique)

**Constraints:**
- `person1Id` and `person2Id` must be different
- Both persons must belong to the same tree

### 6. Media

Represents photos, documents, and other media attached to people.

```typescript
interface Media {
  id: string; // UUID
  treeId: string; // References Tree.id
  personId?: string; // References Person.id (nullable for tree-level media)

  // File Information
  type: MediaType;
  fileName: string;
  fileSize: number; // bytes
  mimeType: string;
  storageKey: string; // S3 key or storage path
  url: string; // CDN or storage URL
  thumbnailUrl?: string;

  // Metadata
  title?: string;
  description?: string;
  dateTaken?: Date;
  location?: Place;
  tags?: string[];

  // Image-specific
  width?: number;
  height?: number;

  // Permissions
  privacy: 'private' | 'family' | 'public';

  // Face Recognition
  detectedFaces?: DetectedFace[];

  // Audit
  uploadedBy: string; // References User.id
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date;
}

enum MediaType {
  PHOTO = 'photo',
  VIDEO = 'video',
  DOCUMENT = 'document',
  AUDIO = 'audio',
}

interface DetectedFace {
  personId?: string; // References Person.id
  boundingBox: {
    x: number;
    y: number;
    width: number;
    height: number;
  };
  confidence: number;
}
```

**Indexes:**
- `treeId`
- `personId`
- `type`
- `uploadedBy`
- `createdAt`

### 7. Event

Represents life events (births, deaths, marriages, graduations, etc.).

```typescript
interface Event {
  id: string; // UUID
  treeId: string;
  type: EventType;
  title: string;
  description?: string;

  // Timing
  date?: Date;
  dateAccuracy: DateAccuracy;
  endDate?: Date; // For events with duration

  // Location
  place?: Place;

  // Participants
  primaryPersonId: string; // References Person.id
  otherPersonIds?: string[]; // References Person.id[]

  // Supporting Information
  mediaIds?: string[]; // References Media.id[]
  sources?: Source[];

  // Audit
  createdBy: string;
  updatedBy: string;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date;
}

enum EventType {
  BIRTH = 'birth',
  DEATH = 'death',
  MARRIAGE = 'marriage',
  DIVORCE = 'divorce',
  BAPTISM = 'baptism',
  GRADUATION = 'graduation',
  MILITARY_SERVICE = 'military_service',
  IMMIGRATION = 'immigration',
  EMIGRATION = 'emigration',
  RESIDENCE = 'residence',
  OCCUPATION = 'occupation',
  RETIREMENT = 'retirement',
  CENSUS = 'census',
  OTHER = 'other',
}

enum DateAccuracy {
  EXACT = 'exact',
  CIRCA = 'circa', // Approximately
  BEFORE = 'before',
  AFTER = 'after',
  BETWEEN = 'between',
  UNKNOWN = 'unknown',
}

interface Source {
  type: 'document' | 'oral' | 'record' | 'other';
  title: string;
  url?: string;
  citation?: string;
  reliability: 1 | 2 | 3 | 4 | 5; // 1 = lowest, 5 = highest
}
```

**Indexes:**
- `treeId`
- `primaryPersonId`
- `type`
- `date`

### 8. Story

Represents written stories and memories about people or families.

```typescript
interface Story {
  id: string; // UUID
  treeId: string;
  title: string;
  content: string; // Rich text / Markdown

  // Relations
  authorId: string; // References User.id
  relatedPersonIds?: string[]; // References Person.id[]

  // Media
  coverImageId?: string; // References Media.id
  mediaIds?: string[]; // References Media.id[]

  // Publishing
  status: 'draft' | 'published' | 'archived';
  publishedAt?: Date;
  privacy: 'private' | 'family' | 'public';

  // Engagement
  viewCount: number;
  likeCount: number;

  // Audit
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date;
}
```

**Indexes:**
- `treeId`
- `authorId`
- `status`
- `publishedAt`

### 9. Activity Log

Tracks all changes for audit and history purposes.

```typescript
interface ActivityLog {
  id: string; // UUID
  treeId: string;
  userId: string; // References User.id

  // Action Details
  entityType: 'person' | 'relationship' | 'media' | 'event' | 'story';
  entityId: string;
  action: 'create' | 'update' | 'delete';

  // Change Details
  changes?: {
    field: string;
    oldValue: any;
    newValue: any;
  }[];

  // Context
  ipAddress?: string;
  userAgent?: string;

  timestamp: Date;
}
```

**Indexes:**
- `treeId, timestamp` (composite)
- `userId`
- `entityType, entityId` (composite)

## Database Schema (PostgreSQL)

### Table Creation Order
1. users
2. trees
3. tree_members
4. persons
5. relationships
6. media
7. events
8. stories
9. activity_logs

### Sample SQL Schema

```sql
-- Users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  profile_picture_url TEXT,
  phone_number VARCHAR(20),
  date_of_birth DATE,
  preferences JSONB DEFAULT '{}',
  email_verified BOOLEAN DEFAULT FALSE,
  mfa_enabled BOOLEAN DEFAULT FALSE,
  mfa_secret VARCHAR(255),
  last_login_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Trees table
CREATE TABLE trees (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  owner_id UUID NOT NULL REFERENCES users(id),
  visibility VARCHAR(20) DEFAULT 'private',
  settings JSONB DEFAULT '{}',
  cover_image_url TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP
);

CREATE INDEX idx_trees_owner_id ON trees(owner_id);
CREATE INDEX idx_trees_visibility ON trees(visibility);

-- Persons table
CREATE TABLE persons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tree_id UUID NOT NULL REFERENCES trees(id) ON DELETE CASCADE,
  first_name VARCHAR(100) NOT NULL,
  middle_name VARCHAR(100),
  last_name VARCHAR(100),
  maiden_name VARCHAR(100),
  nicknames TEXT[],
  gender VARCHAR(20),
  date_of_birth DATE,
  place_of_birth JSONB,
  date_of_death DATE,
  place_of_death JSONB,
  is_living BOOLEAN DEFAULT TRUE,
  biography TEXT,
  privacy VARCHAR(20) DEFAULT 'family',
  custom_fields JSONB DEFAULT '{}',
  created_by UUID REFERENCES users(id),
  updated_by UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP
);

CREATE INDEX idx_persons_tree_id ON persons(tree_id);
CREATE INDEX idx_persons_name ON persons(tree_id, last_name, first_name);
CREATE INDEX idx_persons_is_living ON persons(is_living);

-- Full text search
CREATE INDEX idx_persons_fulltext ON persons
  USING GIN (to_tsvector('english',
    COALESCE(first_name, '') || ' ' ||
    COALESCE(middle_name, '') || ' ' ||
    COALESCE(last_name, '') || ' ' ||
    COALESCE(maiden_name, '')));

-- Relationships table
CREATE TABLE relationships (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tree_id UUID NOT NULL REFERENCES trees(id) ON DELETE CASCADE,
  type VARCHAR(50) NOT NULL,
  person1_id UUID NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  person2_id UUID NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  start_date DATE,
  end_date DATE,
  place JSONB,
  status VARCHAR(20),
  notes TEXT,
  custom_fields JSONB DEFAULT '{}',
  created_by UUID REFERENCES users(id),
  updated_by UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP,
  CONSTRAINT different_persons CHECK (person1_id != person2_id),
  CONSTRAINT unique_relationship UNIQUE (person1_id, person2_id, type)
);

CREATE INDEX idx_relationships_tree_id ON relationships(tree_id);
CREATE INDEX idx_relationships_person1 ON relationships(person1_id);
CREATE INDEX idx_relationships_person2 ON relationships(person2_id);
CREATE INDEX idx_relationships_type ON relationships(type);
```

## Data Validation Rules

### Person Validation
- At least one of firstName or lastName must be provided
- If `isLiving` is false, `dateOfDeath` should be provided
- If `dateOfBirth` is provided, it must be before `dateOfDeath`
- Living persons should not have public visibility by default

### Relationship Validation
- Person1 and Person2 must exist and belong to the same tree
- Person1 and Person2 must be different
- Reciprocal relationships should be created/deleted together
- Spouse relationships require both persons to be adults (configurable age)
- Parent-child age difference should be reasonable (configurable)

### Date Validation
- Dates should be reasonable (not too far in past/future)
- Birth dates should precede death dates
- Marriage dates should be after both spouses' birth dates

## Privacy Rules

### Privacy Levels
1. **Private**: Only tree members with appropriate permissions
2. **Family**: All tree members
3. **Public**: Anyone with tree link

### Living Person Privacy
- Living persons default to 'family' or 'private'
- Contact information only visible to tree admins
- Age < 18 requires special privacy handling

## Caching Strategy

### Cache Keys
```typescript
// User cache
`user:${userId}`
`user:email:${email}`

// Tree cache
`tree:${treeId}`
`tree:members:${treeId}`
`tree:persons:${treeId}`

// Person cache
`person:${personId}`
`person:relationships:${personId}`

// Search results
`search:${treeId}:${query}:${page}`
```

### Cache TTL
- User data: 1 hour
- Tree metadata: 30 minutes
- Person data: 15 minutes
- Search results: 5 minutes
- Activity logs: No cache (always fresh)

## Data Migration & Import

### Supported Import Formats
- GEDCOM (.ged)
- CSV
- JSON
- FamilySearch
- Ancestry.com export
- MyHeritage export

### Export Formats
- GEDCOM
- PDF (visual tree)
- JSON (complete data)
- CSV (tabular data)

## Conclusion

This data model provides a comprehensive foundation for a family tree application while remaining flexible and extensible through JSONB fields and modular design.
