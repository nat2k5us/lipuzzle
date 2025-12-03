# Custom Avatar Images Guide

## Overview

KinStory supports custom avatar images for all characters in your family tree. You can add your own images to make the family tree more authentic and personal.

## How It Works

The avatar system uses a **priority-based approach**:

1. **First Priority**: Custom local images (if you add them)
2. **Fallback**: Auto-generated DiceBear avatars with culturally appropriate South Asian features

## Adding Custom Avatars

### Step 1: Prepare Your Images

1. **Supported formats**: PNG, JPG, JPEG, WebP
2. **Recommended size**: 200x200 pixels or larger (will be displayed at 60x60)
3. **Best practices**:
   - Use square images (1:1 aspect ratio)
   - High quality, clear facial features
   - Good lighting and contrast
   - Culturally appropriate attire and styling

### Step 2: Add Images to Assets Folder

Place your image files in:
```
kinstory/assets/avatars/
```

**Example**:
```
kinstory/assets/avatars/krishna.png
kinstory/assets/avatars/radha.jpg
kinstory/assets/avatars/arjuna.png
```

### Step 3: Update Avatar Mappings

Edit the file: `kinstory/assets/avatar-mappings.json`

Add entries mapping character names to image filenames:

```json
{
  "mappings": {
    "Śrī Kṛṣṇa": "krishna.png",
    "Radha": "radha.jpg",
    "Arjuna": "arjuna.png",
    "Devakī": "devaki.png",
    "Vasudeva": "vasudeva.png"
  }
}
```

**Important**:
- Character names must match **exactly** as they appear in your family tree data
- Names are case-sensitive
- You can use either full name or just first name

### Step 4: Restart the App

After adding images and updating mappings:

```bash
cd kinstory
flutter run
```

The custom avatars will be loaded on app startup.

## Creating Avatars Based on Visual Descriptions

### Method 1: AI Image Generation

You can use AI tools to generate avatars based on character descriptions:

**Recommended Tools**:
1. **DALL-E 3** (via ChatGPT Plus)
2. **Midjourney**
3. **Stable Diffusion**
4. **Leonardo.ai**

**Example Prompts for Indian Mythological Characters**:

```
"Portrait of Krishna, young Indian man with dark blue-tinted skin,
wearing traditional yellow silk dhoti and jeweled crown with peacock
feather, playing bamboo flute, serene expression, digital art,
culturally authentic Indian features, facing forward"

"Portrait of Radha, young Indian woman with golden-brown skin,
wearing traditional red and gold silk sari, ornate jewelry including
nose ring and bangles, long black braided hair with flowers,
gentle smile, digital art, culturally authentic"

"Portrait of Arjuna, young Indian warrior with brown skin,
wearing white silk dhoti and golden armor, traditional tilak mark
on forehead, determined expression, holding a bow, digital art"
```

**Tips for AI Prompts**:
- Specify "Indian features" and "South Asian appearance"
- Mention traditional attire (dhoti, sari, kurta)
- Include jewelry and decorative elements (tilak, bindi, crown)
- Specify "facing forward" or "portrait orientation"
- Use "digital art" or "photorealistic" style
- Mention specific skin tones if historically accurate

### Method 2: Photo Editing

If you have existing images:

1. **Crop** to square aspect ratio
2. **Enhance** lighting and contrast
3. **Remove background** (optional, circular display will crop anyway)
4. **Resize** to at least 200x200 pixels

**Free Tools**:
- **Photopea** (web-based, like Photoshop)
- **GIMP** (desktop)
- **Remove.bg** (background removal)
- **Squoosh** (image compression)

### Method 3: Commission Artists

For highly authentic representations:

1. Find artists specializing in Indian art styles
2. Provide reference images and descriptions
3. Specify traditional clothing and jewelry
4. Request square format, 500x500 minimum

**Where to Find Artists**:
- Fiverr
- DeviantArt
- ArtStation
- Local Indian artists

## Character Description Examples

Use these as references when creating/generating avatars:

### Krishna
- **Appearance**: Young man, dark blue-tinted skin, black curly hair
- **Attire**: Yellow silk dhoti, peacock feather crown, jeweled ornaments
- **Accessories**: Bamboo flute, garland of flowers
- **Expression**: Serene, playful smile

### Radha
- **Appearance**: Young woman, golden-brown skin, long black hair
- **Attire**: Red and gold silk sari, ornate jewelry
- **Accessories**: Bangles, nose ring, flower garlands, bindi
- **Expression**: Gentle, loving

### Arjuna
- **Appearance**: Young warrior, brown skin, strong build
- **Attire**: White dhoti, golden armor, crown
- **Accessories**: Bow and arrows, tilak mark
- **Expression**: Brave, determined

### Draupadi
- **Appearance**: Woman, brown skin, long black braided hair
- **Attire**: Deep blue or green sari with gold embroidery
- **Accessories**: Heavy jewelry, bindi, nose ring
- **Expression**: Dignified, strong

## Troubleshooting

### My custom avatar isn't showing

1. **Check file path**: Ensure image is in `assets/avatars/`
2. **Check mapping**: Verify name in `avatar-mappings.json` matches exactly
3. **Restart app**: Stop completely (not hot reload) and run again
4. **Check file name**: Ensure no typos in image filename
5. **Check console**: Look for errors like "Image not found"

### Avatar looks pixelated

- Use higher resolution images (at least 200x200)
- Ensure image quality is good before adding

### Name doesn't match

Character names in the mapping must match the data exactly:
- Check `assets/krishna-family-tree.json` for exact spelling
- Names are case-sensitive
- Include diacritical marks (ṛ, ṣ, ā, etc.) if present

### Image file is too large

Compress images before adding:
- Use tools like **Squoosh.app** or **TinyPNG**
- Target: Under 200KB per image
- Format: PNG for transparency, JPG for photographs

## Advanced: Batch Avatar Generation

### Using AI APIs Programmatically

If you want to generate avatars for many characters at once:

```python
# Example using DALL-E API (requires OpenAI API key)
import openai
import json

# Load character data
with open('assets/krishna-family-tree.json') as f:
    data = json.load(f)

# Generate avatars
for character in get_all_characters(data):
    prompt = f"Portrait of {character['name']}, traditional Indian character, facing forward, culturally authentic"

    response = openai.Image.create(
        prompt=prompt,
        n=1,
        size="512x512"
    )

    # Save image
    download_image(response['data'][0]['url'], f"avatars/{character['id']}.png")
```

## File Structure Reference

```
kinstory/
├── assets/
│   ├── avatars/              # Your custom avatar images go here
│   │   ├── krishna.png
│   │   ├── radha.jpg
│   │   └── arjuna.png
│   ├── avatar-mappings.json  # Maps names to image files
│   └── krishna-family-tree.json
├── lib/
│   └── data/
│       └── services/
│           └── avatar_service.dart  # Handles avatar loading
└── pubspec.yaml              # Must include assets/avatars/ in assets list
```

## Questions?

- **Where are avatars stored?** Local in `assets/avatars/` folder
- **Can I use photos?** Yes, any image format works
- **Can I change avatars later?** Yes, just replace the image file and restart
- **Do I need custom avatars?** No, system generates them automatically
- **Can I mix custom and generated?** Yes, add custom for some, auto-generated for others

## Best Practices

1. **Consistency**: Use similar artistic style for all avatars
2. **Cultural authenticity**: Research traditional attire and features
3. **File naming**: Use simple names (krishna.png, not krish_12_final_v2.png)
4. **Resolution**: Higher is better, but keep file sizes reasonable
5. **Backup**: Keep original high-res versions separate from optimized versions
