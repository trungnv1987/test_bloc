# Environment Variables Setup

## Local Development

### 1. Tạo file .env từ template
```bash
cp .env.example .env
```

### 2. Chỉnh sửa file .env với các giá trị thực tế
```bash
# Mở file .env và điền các giá trị cần thiết
nano .env
```

### 3. Sử dụng trong Flutter code
Để sử dụng environment variables trong Flutter, bạn có thể sử dụng package `flutter_dotenv`:

```bash
flutter pub add flutter_dotenv
```

Sau đó trong `main.dart`:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}
```

Sử dụng trong code:
```dart
String apiUrl = dotenv.env['API_BASE_URL'] ?? 'default_url';
String flutterVersion = dotenv.env['FLUTTER_VERSION'] ?? '3.35.4';
```

## GitHub Actions

### Cách sử dụng Flutter Version trong CI

CI workflow đã được cấu hình để sử dụng Flutter version từ environment variables với các cách sau:

#### 1. **Sử dụng Workflow Input (Manual Trigger)**
```yaml
# Trigger workflow manually với Flutter version tùy chỉnh
on:
  workflow_dispatch:
    inputs:
      flutter_version:
        description: 'Flutter version to use (overrides default)'
        required: false
        default: ''
```

#### 2. **Sử dụng Environment Variable (Default)**
```yaml
env:
  FLUTTER_VERSION: '3.35.4'  # Default version
```

#### 3. **Cách hoạt động:**
- **Manual trigger**: Có thể chỉ định Flutter version khi chạy workflow
- **Automatic trigger**: Sử dụng version mặc định từ `env.FLUTTER_VERSION`
- **Matrix strategy**: Sử dụng input nếu có, otherwise sử dụng env

#### 4. **Cách thêm Secrets vào GitHub Repository (Optional)**

1. **Truy cập GitHub Repository Settings:**
   - Vào repository của bạn trên GitHub
   - Click vào tab "Settings"
   - Trong sidebar bên trái, click "Secrets and variables" → "Actions"

2. **Thêm Repository Secrets:**
   - Click "New repository secret"
   - Nhập tên secret (ví dụ: `FLUTTER_VERSION`)
   - Nhập giá trị secret (ví dụ: `3.35.4`)
   - Click "Add secret"

3. **Sử dụng trong GitHub Actions:**
   ```yaml
   env:
     FLUTTER_VERSION: ${{ secrets.FLUTTER_VERSION }}
   ```

### Ví dụ Secrets thường dùng:
- `FLUTTER_VERSION`: Phiên bản Flutter
- `API_BASE_URL`: URL API backend
- `API_KEY`: API key cho các service bên ngoài
- `DATABASE_URL`: Connection string database
- `SIGNING_KEY`: Key để sign app (Android/iOS)

## Lưu ý bảo mật

- ✅ File `.env` đã được thêm vào `.gitignore` - sẽ không được commit
- ✅ File `.env.example` được commit để làm template
- ✅ Sensitive data chỉ lưu trong GitHub Secrets
- ❌ Không bao giờ commit file `.env` với real values
- ❌ Không hardcode sensitive data trong code

## Troubleshooting

### Lỗi "Invalid workflow file"
Nếu gặp lỗi này trong GitHub Actions, kiểm tra:
1. Syntax YAML có đúng không
2. Biến môi trường có được định nghĩa đúng không
3. Secrets có được set trong repository settings không

### Flutter không đọc được .env
Kiểm tra:
1. File `.env` có tồn tại trong root project không
2. Package `flutter_dotenv` đã được add vào `pubspec.yaml` chưa
3. `dotenv.load()` đã được gọi trước `runApp()` chưa
