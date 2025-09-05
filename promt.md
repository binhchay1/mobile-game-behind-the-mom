Hãy đóng vai một kỹ sư Godot 4, tiếp tục phát triển và tinh chỉnh UI cho dự án sau:
Tên dự án: “Sau Lưng Mẹ”
Engine: Godot 4.x, mobile portrait 1080x1920
Main scene: res://scenes/MainMenu.tscn
Autoloads: GameState, AudioManager, DialogueManager, PuzzleManager (khai báo trong project.godot)
Chương 1:
Tuyến An: res://scenes/Chapter1_An.tscn (+ res://scripts/Chapter1_An.gd)
Tuyến Mẹ Mai: res://scenes/Chapter1_Mai.tscn (+ res://scripts/Chapter1_Mai.gd)
Dialogue UI: res://ui/DialogueBox.tscn (+ res://ui/DialogueBox.gd)
Puzzle mẫu: res://puzzles/StubTreasureMap.tscn (+ res://puzzles/StubTreasureMap.gd)
Nhạc chủ đề placeholder: map key “leitmotif” → res://assets/audio/leitmotif.ogg (hãy thay thế bằng file thật)
Mục tiêu UI:
Tạo theme tổng thể (watercolor, ấm áp, hoài niệm), font hỗ trợ tiếng Việt, tương phản nhẹ giữa tuyến An (tươi sáng) và Mẹ (trầm hơn).
Đảm bảo UI responsive (anchors/offsets), an toàn vùng hiển thị trên thiết bị có tai thỏ.
Việc cần làm:

1. Theme & Font
   Tạo res://themes/MainTheme.tres (và res://themes/AnTheme.tres, res://themes/MaiTheme.tres nếu cần).
   Thêm font Việt (VD: Be Vietnam Pro, Noto Serif) vào res://assets/fonts/, tạo DynamicFont và gán vào theme.
   Áp dụng theme mặc định cho toàn project (Project Settings) hoặc gán vào node gốc mỗi scene.
2. Main Menu (scenes/MainMenu.tscn)
   Thay logo/ảnh nền (node TextureRect hoặc Panel có StyleBoxTexture).
   Update spacing, padding trên MarginContainer/VBoxContainer.
   Tăng kích thước chữ Title, Subtitle qua theme; chỉnh màu theo palette watercolor.
3. DialogueBox (ui/DialogueBox.tscn)
   Tùy biến Panel bằng StyleBoxFlat hoặc StyleBoxTexture watercolor.
   Căn lề chữ, khoảng cách dòng, radius bo góc.
   Nút “Tiếp” nổi bật, màu phù hợp chủ đề.
4. Chương 1 (An/Mẹ)
   Thêm background vẽ tay: Sprite2D/TextureRect full-frame.
   Tuyến An dùng palette sáng; Tuyến Mẹ dùng palette trầm (swap theme khi đổi tuyến).
   Giữ anchors full-viewport để đáp ứng nhiều thiết bị.
5. Âm thanh
   Thay thế assets/audio/leitmotif.ogg bằng giai điệu hộp nhạc thật; tinh chỉnh AudioManager.set_bgm_volume_db(...).
6. Kiểm tra mobile
   Đảm bảo nút lớn đủ chạm; kiểm tra safe area (iOS).
   Test trên nhiều tỉ lệ (16:9, 19.5:9).
   Ràng buộc:
   Không phá vỡ autoloads và đường dẫn hiện có.
   Không tạo linter lỗi; giữ code rõ ràng, có chú ý đến tiếng Việt có dấu.
   Ưu tiên tính năng chạy được ngay sau chỉnh sửa.
   Checklist xác nhận:
   [ ] Theme áp dụng thành công, font Việt OK
   [ ] Main menu hiển thị đúng, anchors chuẩn
   [ ] DialogueBox đẹp, dễ đọc, nút “Tiếp” rõ ràng
   [ ] Hai tuyến có sắc thái màu khác nhau
   [ ] Leitmotif phát bình thường
   [ ] Build Android/iOS không lỗi
   Thay thế UI nhanh (chỉ dẫn ngắn)
   Font: đặt .ttf/.otf vào assets/fonts/ → tạo DynamicFont → gán vào theme → áp dụng theme vào scene/Project Settings.
   Màu/viền/padding: tạo StyleBoxFlat/Texture trong theme và gán cho Panel, Button, Label.
   Ảnh nền: thêm TextureRect full anchors trong MainMenu.tscn, Chapter1\_\*.tscn.
   Dialogue: mở ui/DialogueBox.tscn, tùy Panel và Label, đổi nút “Tiếp”.
   Palette: tạo 2 theme hoặc 1 theme + color overrides khi đổi tuyến (An/Mẹ).
   Nguồn asset “model/game art” (watercolor, UI, SFX, font)
   2D watercolor, UI:
   Kenney Assets: kenney.nl/assets
   Itch.io asset packs: itch.io/game-assets (tìm “watercolor”, “hand-painted”)
   OpenGameArt: opengameart.org (lọc watercolor/hand-painted)
   CraftPix (trả phí): craftpix.net
   Envato Elements (trả phí): elements.envato.com
   SFX/Music:
   Freesound: freesound.org
   Pixabay Audio: pixabay.com/music
   Sonniss GDC Bundles: sonniss.com/gameaudiogdc
   YouTube Audio Library: studio.youtube.com > Audio Library
   Font tiếng Việt:
   Google Fonts (Be Vietnam Pro, Noto Serif, Inter…): fonts.google.com
   Godot Asset Library (plugin/theme tiện ích):
   godotengine.org/asset-library/asset
   Gợi ý tìm kiếm: “watercolor game UI kit”, “hand-painted backgrounds”, “notebook paper texture”, “warm palette UI”.
