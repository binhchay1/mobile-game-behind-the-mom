### Sau Lưng Mẹ – Godot 4 (Mobile)

- **Engine**: Godot 4.x
- **Platforms**: Android, iOS
- **Genre**: Point & Click, Story-driven Puzzles

### Run the project
1. Install Godot 4.x Editor.
2. Open the folder in Godot: `File > Open Project... > /home/mobile-game-behind-the-mom`.
3. Press Play. You should see the main menu with options to start Chapter 1 (An or Mẹ Mai).

### Project layout
- `scenes/`: Scenes for menu and chapters
- `scripts/`: Gameplay scripts
- `autoload/`: Global singletons (GameState, DialogueManager, AudioManager, PuzzleManager)
- `ui/`: Reusable UI widgets (DialogueBox)
- `puzzles/`: Puzzle scenes

### Export – Android
1. In Godot: `Editor > Manage Export Templates...` and install official templates.
2. `Editor > Editor Settings > Export > Android`:
   - Set `Android SDK Path` to your Android SDK (e.g., `~/Android/Sdk`).
   - Set `JDK Path` to your JDK (Godot bundles one on some platforms).
3. `Project > Export... > Add > Android`:
   - Set Package name (e.g., `com.yourstudio.saulungme`).
   - Set Permissions as needed (Internet not required for now).
   - For release, configure keystore (path, user, alias). For debug, Godot can use a debug keystore.
4. Click `Export Project` to build an `.apk`/`.aab`.

### Export – iOS (requires macOS + Xcode)
1. On macOS, install Godot 4.x and export templates.
2. `Project > Export... > Add > iOS`.
3. Export to a directory; Godot generates an Xcode project.
4. Open the generated Xcode project, set signing Team and Bundle Identifier.
5. Build and run on device or archive for App Store.

### Notes
- Orientation is portrait by default. Adjust in Project Settings if needed.
- Audio placeholders are stubbed; add your own assets in `assets/audio` and call `AudioManager.play_bgm(...)`.
- Save data is written to `user://savegame.save` (platform-specific app data path).

### Next steps
- Flesh out Chapter 1 puzzles and narrative.
- Add art, sounds, and polish to UI.
- Implement Chapter 2 and 3 per design doc.