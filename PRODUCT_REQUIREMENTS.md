# KinStory - Product Requirements Document

## Executive Summary

**Product Name**: KinStory (working title)
**Platform**: iOS & Android (Flutter)
**Target Launch**: Q4 2026 (MVP)

**One-Line Vision**:
A privacy-first, AI-assisted family tree app that turns genealogy data into living stories, games, and shared moments for the entire family, not just the researcher.

---

## 1. Market Landscape & Competitive Analysis

### 1.1 Existing Solutions

#### Big Ecosystem Players (Genealogy + Records + DNA)

**Ancestry (iOS & Android)**
- Full genealogy platform with trees, historical records, hints, DNA results
- Mobile app mainly access point to broader ecosystem
- Strong on records database and hints
- Subscription-based ($25-50/month)
- **Weaknesses**: Complex UI, overwhelming for casual users, expensive

**MyHeritage (iOS & Android)**
- Family tree builder + huge records database + DNA
- Strong AI photo tools (colorization, enhancement, "LiveMemory™")
- Rich mobile tree views with color-coding
- **Weaknesses**: Similar subscription model, less focus on storytelling

**FamilySearch Tree (iOS & Android)**
- Free, nonprofit, "world's largest online family tree"
- Strong collaborative tree, record hints, map ancestors
- Memories feature (photos, stories, audio)
- **Weaknesses**: Single shared tree can cause conflicts, less polished UX

#### Tree-Focused Standalone Apps

**MobileFamilyTree (iOS)**
- Desktop-grade genealogy for iPhone/iPad
- Visually rich charts and reports
- Local-first with Mac sync
- **Weaknesses**: iOS only, technical, not family-friendly

**Quick Family Tree (iOS/Android)**
- Lightweight, no account needed
- Very easy interactive tree building
- **Weaknesses**: Limited features, no collaboration

### 1.2 Market Gaps & Opportunities

What existing apps don't do well:

1. **UX for Non-Genealogy Nerds**
   - Current apps are built for serious researchers
   - Kids, teens, and casual users find them boring or intimidating
   - Opportunity: Make genealogy engaging for everyone

2. **Deep Social / Family Network Experience**
   - Limited real-time collaboration
   - Poor communication features
   - No family-oriented social features
   - Opportunity: Build family network into the core experience

3. **Privacy-First Architecture**
   - Most require cloud accounts
   - Limited encryption options
   - Poor granular permission controls
   - Opportunity: Privacy as a core differentiator

4. **Storytelling & Narrative**
   - Data-focused, not story-focused
   - No AI-assisted narrative generation
   - Limited multimedia integration
   - Opportunity: Make stories the center, data the support

5. **Multi-Cultural Support**
   - Western-centric relationship models
   - Poor support for non-English kinship terms
   - Opportunity: First-class multi-cultural support

6. **Gamification & Engagement**
   - No features for younger users
   - No incentive systems
   - Opportunity: Gamify discovery and contribution

---

## 2. Product Vision & Strategy

### 2.1 Vision Statement

KinStory transforms family history from a solo research project into a collaborative, engaging experience that brings families closer together through stories, memories, and shared discovery.

### 2.2 Mission

Make preserving and sharing family history accessible, enjoyable, and meaningful for every family member, regardless of age or technical expertise.

### 2.3 Core Values

1. **Privacy First**: User data is sacred; encryption and control by default
2. **Inclusive Design**: Built for ages 8 to 88
3. **Story Over Data**: Humans remember stories, not dates
4. **Family Together**: Collaboration and sharing are core, not afterthoughts
5. **Cultural Respect**: Support diverse family structures and traditions

### 2.4 Target Personas

#### Primary Personas

**The Family Historian** - "Sarah, 55"
- The one who knows everyone and wants to document it
- Motivated to preserve family legacy
- Willing to invest time in research
- Needs: Robust tree building, GEDCOM import, research tools
- Pain: Current apps don't make it easy to share with family

**The Busy Parent** - "Michael, 38"
- Wants simple tree + memories for kids
- Not interested in heavy research
- Values quick, easy interactions
- Needs: Simple entry, story viewing, photo uploads
- Pain: Existing apps too complex, too time-consuming

**Kids & Teens** - "Emma, 13"
- Will only engage if fun, visual, gamified
- Loves stories about ancestors
- Digital native, expects modern UX
- Needs: Interactive visualizations, games, rewards
- Pain: Traditional apps are "boring"

**Older Relatives** - "Grandma Ruth, 78"
- Has the stories and memories
- Limited technical skills
- Might prefer voice over typing
- Needs: Ultra-simple, large type, voice input
- Pain: Can't use complex apps, gets lost in menus

#### Secondary Personas

**The Genealogy Enthusiast** - Serious hobbyist who wants advanced features
**The Privacy Advocate** - Concerned about data security and control
**The Immigrant Family** - Needs multi-language, multi-cultural support

---

## 3. Core Functional Requirements

### 3.1 Account, Onboarding & Identity

**Authentication**
- Email / phone sign-in
- Social sign-in (Apple, Google)
- Sign in with Apple (required for iOS)
- Two-factor authentication (optional)

**Local-Only Mode**
- Option for no account using on-device storage
- Later "connect & sync" to cloud
- Perfect for privacy-conscious users

**Onboarding Flow**
- Guided setup: "Start with yourself"
- Choose to start fresh or import GEDCOM
- Invite first family member
- Tutorial on basic navigation

**Family Groups**
- Create/join multiple family trees
- Invite via link / QR / contact share
- Role system: Owner, Admin, Editor, Viewer
- Per-branch permissions

### 3.2 Family Tree Model

**Relationship Support**
- Parents, children (biological, adopted, step, foster)
- Multiple spouses/partners
- Siblings (full, half, step)
- Guardians, godparents
- Custom "important relationship" labels

**Multiple Views**
- **Pedigree View**: Ascending ancestors (classic fan chart)
- **Family View**: Descendants and siblings
- **Timeline View**: Events across person's life chronologically
- **Map View**: Geographic locations of life events
- **List View**: Searchable, sortable table

**Visualization Features**
- Color-coding by branch/family line
- Highlight relationships to you
- Filter by: living/deceased, generation, location
- Zoom and pan for large trees
- Portrait thumbnails inline

**Offline-First**
- Tree browsable without network
- Changes sync when online
- Conflict resolution UI for edits

**Import/Export**
- GEDCOM import (.ged files)
- Export to GEDCOM / JSON
- CSV export (tabular data)
- PDF export (printable tree)

### 3.3 Person & Event Profiles

**Basic Person Details**
- Names (first, middle, last, maiden, nicknames)
- Multiple name scripts (e.g., English + Chinese)
- Gender/sex (with custom options)
- Life dates (birth, death)
- Places (with geocoding)
- Profile photo

**Rich Life Events**
- **Standard Events**: Birth, death, marriage, divorce, baptism, burial
- **Life Milestones**: Immigration, education, occupation, retirement, military service
- **Custom Events**: User-defined with icons and colors

**Event Details**
- Date (exact, circa, before/after, between)
- Location (free text + geocoding)
- Description/notes
- Sources and citations
- Privacy level

**Media Attachments**
- Photos (JPEG, PNG, HEIC)
- Videos (MP4, MOV)
- Documents (PDF, DOCX)
- Audio (M4A, MP3)
- Tag people in images
- Link media to specific events

**Relationship Visualization**
- Graph showing connections to selected person
- Branch color-coding
- Degree of relationship calculator
- Common ancestor finder

### 3.4 Memories & Storytelling (Major USP)

**Story Section for Each Person**
- Scrollable narrative combining:
  - Text stories
  - Photos and videos
  - Audio clips
  - Key life events
- Rich text editor with formatting
- Timeline layout option

**AI Story Mode**
- Generate readable story draft from structured data
- Multiple tones:
  - Formal biography
  - Kid-friendly narrative
  - First-person narrative (with disclaimers)
- User edits and approves before saving
- Cite data sources in generated text

**AI Interview Assistant**
- Guided interview questions for elders
- Questions adapt based on prior answers
- Record audio with prompts
- On-device transcription (speech-to-text)
- Searchable memories from transcripts
- Export interview as story

**Story Timelines**
- Combine stories of multiple relatives
- "Family Storyline" for selected period
- Example: "Our family in the 1990s"
- Multimedia scrapbook layout

**Memory Prompts**
- Weekly prompts: "Share a memory about..."
- Holiday/birthday reminders to gather stories
- Quest system: "Interview someone about their childhood"

### 3.5 Collaboration & Social Features

**Real-Time Collaboration**
- Multiple users editing simultaneously
- Optimistic updates with conflict resolution
- Activity indicators ("Sarah is editing...")
- Change history and undo

**Commenting System**
- Comment threads on:
  - People
  - Events
  - Photos
  - Stories
- @mentions with notifications
- Resolve/archive comments

**Family Newsfeed**
- Recent additions (new photo, story, member)
- Achievements and milestones
- Birth anniversaries and remembrances
- "On this day" historical posts

**Messaging**
- In-app chat for family group
- Thread discussions around specific people/events
- Share photos and stories inline
- Push notifications for messages

**Sharing**
- Share individual profiles externally
- Generate shareable links (time-limited, view-only)
- Export person/branch as PDF or web page
- Social media sharing with privacy controls

### 3.6 Discovery & Research Integration (Phase 2+)

**External Links**
- Store links to FamilySearch, Ancestry, MyHeritage profiles
- Deep-link: "Open in Ancestry app"
- Reference external sources and documents

**Record Hints (Future)**
- Pluggable architecture for future integrations
- Suggest potential matches from public records
- User reviews and accepts/rejects hints

**DNA Integration (Future)**
- Link to DNA test results (23andMe, Ancestry, etc.)
- Visualize genetic relationships
- Suggest potential relatives

### 3.7 Kids Mode & Gamification (Major Differentiator)

**Kids Mode**
- PIN-protected entry from parents
- Simplified interface with avatars
- Colorful, playful design
- Age-appropriate content filtering

**Interactive Features**
- Family tree as animated character tree
- Tap portraits to hear stories
- Map showing where ancestors lived
- Photo galleries with swipe

**Quizzes & Games**
- "Who is this?" person identification
- "Where did they live?" geography
- "When was this?" timeline ordering
- Family trivia with multiple choice

**Quest System**
- Missions: "Ask elder about first job and record it"
- "Add 5 photos from the 1950s"
- "Complete Grandma's profile"
- Track progress with visual indicators

**Achievement Badges**
- Earned for contributions:
  - "Story Collector" - 10 stories added
  - "Photo Archivist" - 50 photos uploaded
  - "Detective" - Found missing connection
  - "Interviewer" - Completed 5 interviews
- Display badges on profile
- Leaderboard (optional, family-only)

### 3.8 Privacy & Permissions (Major USP)

**Tree Privacy Modes**
- **Private**: Invite-only, fully encrypted
- **Family**: Shareable link, requires family group membership
- **Limited Public**: Selected deceased profiles only
- Per-person privacy overrides

**Granular Permissions**
- Control which branches visible to whom
- Living persons: restrict contact details
- Separate permissions for:
  - View profile
  - View media
  - View stories
  - Edit details
  - Add media
  - Delete content

**End-to-End Encryption (E2EE)**
- Optional E2EE for:
  - Stories marked "private"
  - Audio recordings
  - Sensitive documents
- Keys stored per family group
- User controls encryption per item

**Data Control**
- Export all data (GDPR compliant)
- Delete account and all data
- Remove specific people/media
- Audit log of who accessed what

**Living Person Protection**
- Auto-privacy for persons born < 100 years ago
- Require explicit sharing for living persons
- Mask contact details (email, phone, address)
- Special handling for minors (< 18)

---

## 4. "Special" Features - Unique IP & Differentiators

### 4.1 Narrative Engine / "Family Book" Generator

**Auto-Generate Print-Ready Book**
- Compile entire tree into formatted book
- Chapters per branch (color-coded)
- Interleaved stories, photos, maps
- Timeline of major events
- Index of names

**Template Library**
- Classic heritage book
- Modern photo book
- Kid-friendly storybook
- Academic genealogy report

**Customization**
- Choose which branches/people to include
- Edit auto-generated text
- Rearrange chapters
- Add custom sections

**Export Options**
- PDF for self-printing
- Send to print service integration
- EPUB for e-readers
- Web page version

**Proprietary Story Compiler**
- Template engine + data model = unique IP
- Markup language for genealogy narratives
- Reusable across formats

### 4.2 AR "Family Room" (Visual Innovation)

**AR Portrait Gallery**
- Place floating portrait frames in physical room (ARKit/ARCore)
- Each shows relative's photo and name
- Tap to see basic facts
- Play short story audio

**"Family Around the Table"**
- AR mode shows relatives sitting around virtual table
- Lines connecting them to you
- See relationships in 3D space
- Great for kids to understand connections

**AR Timeline Walk**
- Walk through physical space as timeline
- Each step = decade or generation
- See who lived when
- Place-based storytelling

**Marketing Potential**
- Unique demo/screenshot opportunity
- Strong App Store feature potential
- PR-worthy innovation

### 4.3 AI Photo & Face Experience (Privacy-Respecting)

**On-Device Face Clustering**
- Group photos by detected faces
- Never sends raw faces to server
- Suggest tags, require confirmation
- No "secret" face recognition

**Smart Photo Organization**
- Auto-suggest events based on dates/locations
- Group photos by decade/era
- Find photos of specific person
- Duplicate detection

**AI Time Travel View**
- Collage showing family style changes over decades
- Side-by-side comparisons
- Fashion, locations, home settings
- Non-creepy, playful, educational

**Photo Enhancement**
- Colorize black & white photos
- Enhance/restore damaged photos
- Upscale low-resolution images
- Remove scratches and stains

### 4.4 Multi-Cultural Kinship & Language Layer

**Custom Kinship Systems**
- Support for cultural relationship terms
- Indian: mama, chikki, dada, etc.
- Chinese: 表哥, 堂妹, etc.
- Arabic: عم, خال, etc.
- Spanish: primo hermano, etc.

**Per-User Language Display**
- Show relationships in user's preferred language
- Same underlying graph, different labels
- Automatic translation of relationship terms
- Cultural context help

**Family Structure Variations**
- Support non-Western family models
- Extended family as first-class
- Multiple simultaneous marriage structures
- Adoption and fosterage variations

**Global Calendar Support**
- Gregorian, Julian, Hebrew, Islamic, Chinese calendars
- Date conversion and display
- Cultural event templates

### 4.5 "Consensus vs Personal View" Trees

**Versioned Graph Model**
- Canonical "family tree" (agreed upon)
- Personal "my view" with variations
- Proposed edits await approval
- Track who believes what

**Conflict Resolution UI**
- Visual diff of competing versions
- Comment threads on disagreements
- Vote or owner decides
- Maintain both versions if unresolved

**Research Notes & Confidence**
- Confidence level per fact (certain, probable, possible, disputed)
- Source quality ratings
- Research notes visible to editors
- Track uncertainty transparently

**UX Moat**
- Solves "That's not our grandfather!" problem
- Enables collaborative research without conflicts
- Unique among consumer apps

---

## 5. User Experience Requirements

### 5.1 Design Principles

1. **Simplicity First**: Core tasks should be obvious
2. **Progressive Disclosure**: Advanced features hidden until needed
3. **Delight in Details**: Smooth animations, thoughtful micro-interactions
4. **Accessibility Always**: WCAG 2.1 AA minimum
5. **Offline Capable**: Core features work without internet

### 5.2 Key User Flows

**Onboarding (First-Time User)**
1. Sign up / create account
2. "Start with yourself" - add your basic info
3. Add parents or children (choose starting point)
4. Add first photo
5. Invite first family member
6. Complete first story or interview

**Adding a Person**
1. Tap "+" on tree view
2. Select relationship type
3. Enter basic details (name, dates)
4. Add photo (optional)
5. Save and see in tree
6. Prompt: "Add a story about [name]?"

**Recording a Memory**
1. Navigate to person
2. Tap "Add Story"
3. Choose: Write, Record Audio, or AI Interview
4. For AI Interview: Answer prompted questions
5. Review and edit transcript
6. Save as story
7. Share notification to family

**Kids Mode Flow**
1. Child opens app
2. Enters PIN (set by parent)
3. Sees gamified tree view
4. Taps quest: "Learn about Great-Grandma"
5. Views photos and hears story
6. Answers quiz question
7. Earns badge
8. Returns to quest map

### 5.3 Accessibility Requirements

**Visual**
- Dynamic type support (iOS) / font scaling (Android)
- High contrast mode
- Support for screen readers (VoiceOver / TalkBack)
- Color-blind safe palette
- Minimum touch target 44x44pt

**Motor**
- Full keyboard navigation
- Voice control support
- No time-based interactions required
- Swipe alternatives for all gestures

**Cognitive**
- Clear, simple language
- Consistent navigation patterns
- Undo for all destructive actions
- Confirmation dialogs for major changes

**Auditory**
- Captions for video content
- Visual alternatives for audio
- Transcripts for audio stories

---

## 6. Non-Functional Requirements

### 6.1 Performance

- **App Launch**: < 2 seconds to interactive
- **Tree Rendering**: < 1 second for 1000-person tree
- **Search**: < 500ms for 10,000 person database
- **Photo Upload**: Background with progress indicator
- **Sync**: < 10 seconds for typical daily changes
- **Offline Mode**: Full tree browsing and basic edits

### 6.2 Scalability

- Support trees up to 50,000 people
- 100,000+ photos per tree
- 10,000+ stories per tree
- 100 concurrent collaborators per tree
- Handle trees with 10+ generations

### 6.3 Security

- TLS 1.3 for all network communication
- AES-256 encryption at rest
- Optional E2EE for sensitive data
- Secure key storage (Keychain / Keystore)
- Regular security audits
- Penetration testing before launch

### 6.4 Privacy & Compliance

- **GDPR Compliant**:
  - Right to access
  - Right to deletion
  - Right to portability
  - Consent management
- **CCPA Compliant**: Do not sell personal information
- **COPPA Compliant**: Special handling for users < 13
- Privacy policy in plain language
- Regular privacy audits

### 6.5 Reliability

- **Uptime**: 99.9% target (< 9 hours downtime/year)
- **Data Durability**: 99.999999999% (11 nines)
- **Backup**: Automated daily backups
- **Recovery**: Point-in-time recovery for 30 days
- **Monitoring**: Real-time alerts for issues

### 6.6 Platform Support

**iOS**
- Minimum: iOS 15.0
- Target: iOS 17.0+
- Devices: iPhone 8 and newer, iPad Air 2 and newer
- Optimized for: iPhone 14/15/16, iPad Pro

**Android**
- Minimum: Android 8.0 (API 26)
- Target: Android 14 (API 34)
- Devices: 95% of active devices
- Optimized for: Pixel, Samsung Galaxy S series

### 6.7 Internationalization

**Launch Languages**
- English (US, UK)
- Spanish (ES, LATAM)
- Chinese (Simplified, Traditional)
- Hindi
- Arabic

**Future Languages**
- French, German, Portuguese, Japanese, Korean, Russian

**Localization Requirements**
- RTL support for Arabic, Hebrew
- Date/time formats per locale
- Currency and number formats
- Cultural relationship terms
- Locale-specific content

---

## 7. Success Metrics & KPIs

### 7.1 User Acquisition

- **Downloads**: 100k in first 6 months
- **Activation Rate**: 60% (complete onboarding)
- **Viral Coefficient**: 1.5 (each user invites 1.5 family members)

### 7.2 Engagement

- **DAU/MAU Ratio**: 30% (daily active / monthly active)
- **Session Length**: 8+ minutes average
- **Sessions per Week**: 3+ per active user
- **Retention**:
  - Day 1: 60%
  - Day 7: 40%
  - Day 30: 25%

### 7.3 Content Creation

- **Average Tree Size**: 50 people per family
- **Stories per User**: 5+ stories created
- **Photos per User**: 20+ photos uploaded
- **Interviews Completed**: 2+ per active user

### 7.4 Collaboration

- **Multi-User Trees**: 60% of trees have 2+ editors
- **Average Family Size**: 4 members per tree
- **Comments per Month**: 10+ per active tree
- **Shared Trees**: 40% of trees shared outside immediate family

### 7.5 Technical Performance

- **Crash-Free Rate**: 99.5%+
- **API Response Time**: p95 < 500ms
- **App Store Rating**: 4.5+ stars
- **Customer Support CSAT**: 90%+

### 7.6 Business Metrics (If Applicable)

- **Conversion to Paid**: 10% (if freemium model)
- **Churn Rate**: < 5% monthly
- **LTV:CAC Ratio**: > 3:1
- **NPS Score**: 50+

---

## 8. Monetization Strategy (Future Consideration)

### Option 1: Freemium

**Free Tier**
- Up to 100 people in tree
- 1GB photo storage
- Basic features
- Ads (non-intrusive)

**Premium Tier** ($9.99/month or $79.99/year)
- Unlimited people
- 100GB storage
- AI features (story generation, interview assistant)
- Advanced visualization
- Priority support
- No ads

### Option 2: Family Plan

- $19.99/month for family group
- Unlimited members
- Shared storage pool (500GB)
- All premium features
- Family admin controls

### Option 3: One-Time Purchase

- $49.99 one-time
- Lifetime access
- All features
- No subscriptions
- Pay once per family tree

### Option 4: Free with Premium Services

- Free core app
- Paid services:
  - Professional book printing ($50-200)
  - DNA integration service ($29.99)
  - Professional genealogy research ($99+)
  - Photo restoration service ($4.99 per photo)

---

## 9. Risk Assessment

### 9.1 Technical Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Offline sync conflicts | High | Medium | Robust conflict resolution, user testing |
| Large tree performance | High | Medium | Lazy loading, virtualization, optimization |
| Photo storage costs | Medium | High | Compression, tiered storage, user limits |
| Platform API changes | Medium | Medium | Use stable APIs, regular testing, abstraction layers |
| Security breach | Critical | Low | Security audits, pen testing, encryption, monitoring |

### 9.2 Market Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Low user adoption | High | Medium | Strong marketing, unique features, viral mechanics |
| Competitor response | Medium | High | Patents/IP, rapid iteration, community building |
| Market saturation | Medium | Medium | Clear differentiation, niche targeting initially |
| Privacy concerns | Medium | Low | Transparency, user control, compliance, education |

### 9.3 Product Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Feature complexity | Medium | High | Phased rollout, user testing, simplification |
| AI accuracy issues | Medium | Medium | Human review, confidence scores, disclaimers |
| Collaboration conflicts | Medium | High | Versioning system, moderation tools, clear policies |
| Cultural insensitivity | High | Low | Diverse team, cultural consultants, user research |

---

## 10. Success Criteria for MVP

An MVP is successful if it demonstrates:

1. **Core Value Prop**: Users can build a basic family tree and add stories
2. **Differentiation**: At least 2 unique features work well (e.g., AI interview + Kids mode)
3. **Collaboration**: 2+ family members actively using same tree
4. **Engagement**: Users return 3+ times in first week
5. **Quality**: 4.0+ App Store rating
6. **Performance**: Core flows work offline
7. **Viral Growth**: 1.0+ viral coefficient (each user invites 1+ person)

**MVP Go/No-Go Criteria**:
- ✅ 1000+ downloads in first month
- ✅ 40%+ Day 7 retention
- ✅ 50%+ of users add a story or photo
- ✅ < 2% crash rate
- ✅ Positive user feedback (NPS > 30)

---

## 11. Out of Scope for MVP

The following are explicitly **not** in MVP:

- ❌ DNA integration
- ❌ Historical records database
- ❌ Advanced genealogy research tools
- ❌ Print book ordering service
- ❌ Video calls / live collaboration
- ❌ Blockchain / NFT features
- ❌ VR/extended AR features
- ❌ Automated record hints
- ❌ Professional genealogist marketplace
- ❌ Family social network feed (basic newsfeed only)
- ❌ Advanced statistics and analytics
- ❌ Integration with 23andMe/Ancestry DNA

These may be considered for post-MVP phases based on user feedback and validation.

---

## Appendix A: User Stories

### Epic 1: Tree Building

- As a family historian, I want to import my GEDCOM file so I don't lose years of research
- As a user, I want to add my parents so I can start building my tree
- As a user, I want to see a visual tree so I can understand relationships
- As a user, I want to search for people so I can quickly find anyone
- As a genealogist, I want to export my tree so I can backup my data

### Epic 2: Storytelling

- As a grandchild, I want to record grandma's stories so they're preserved forever
- As a parent, I want to write about my childhood so my kids understand where I came from
- As a user, I want AI to help write a biography so I can save time
- As a child, I want to listen to stories about ancestors so I can learn about my heritage

### Epic 3: Collaboration

- As a tree owner, I want to invite my siblings so we can build the tree together
- As a collaborator, I want to see recent changes so I know what's new
- As a user, I want to comment on profiles so I can discuss with family
- As a tree owner, I want to control who can edit so the tree stays accurate

### Epic 4: Memories & Media

- As a user, I want to upload old photos so they're digitally preserved
- As a user, I want to tag people in photos so others know who they are
- As a user, I want to organize photos by event so they tell a story
- As a user, I want to share photos with family so everyone can enjoy them

### Epic 5: Kids & Engagement

- As a parent, I want a kid-friendly mode so my children can explore safely
- As a child, I want to play games about my family so learning is fun
- As a user, I want to earn badges so I feel accomplished
- As a child, I want to see a map of where ancestors lived so I can visualize their journeys

### Epic 6: Privacy & Security

- As a user, I want to control who sees living relatives so their privacy is protected
- As a user, I want to encrypt sensitive data so it's secure
- As a tree owner, I want granular permissions so I control access
- As a user, I want to export my data so I'm not locked in

---

## Appendix B: Glossary

- **GEDCOM**: GEnealogical Data COMmunication - standard file format for exchanging genealogy data
- **Pedigree**: Chart showing ancestors of one person
- **Descendancy**: Chart showing descendants of one person
- **Person**: Individual in the family tree
- **Relationship**: Connection between two people (parent-child, spouse, etc.)
- **Event**: Life occurrence (birth, marriage, death, etc.)
- **Source**: Citation or reference for genealogical information
- **Tree Member**: User with access to a specific family tree
- **Living Person**: Individual considered alive (typically < 100 years since birth)
- **Branch**: Section of tree descending from common ancestor
- **Generation**: Level in tree hierarchy (parent, grandparent, etc.)

---

**Document Version**: 1.0
**Last Updated**: 2025-11-15
**Owner**: Product Team
**Status**: Draft for Review
