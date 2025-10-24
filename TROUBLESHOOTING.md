# Troubleshooting GitHub Actions CI Issues

## Lỗi "Couldn't find gradlew"

### Nguyên nhân:
- Fastlane không tìm thấy file `gradlew` trong thư mục Android
- Working directory trong GitHub Actions khác với local
- Permissions không đúng cho file `gradlew`

### Giải pháp đã áp dụng:

#### 1. **Sửa Fastfile để sử dụng đường dẫn tuyệt đối:**
```ruby
gradle(
  task: "assembleRelease",
  project_dir: File.expand_path("../android", __dir__)
)
```

#### 2. **Thêm step verify trong CI workflow:**
```yaml
# Verify Android project structure
- name: Verify Android project
  run: |
    echo "Current directory: $(pwd)"
    echo "Android directory contents:"
    ls -la android/
    echo "Checking gradlew:"
    ls -la android/gradlew
    chmod +x android/gradlew
```

#### 3. **Đảm bảo working directory đúng:**
```yaml
# Run full CI pipeline using Fastlane
- name: Run Fastlane CI for Android
  run: |
    cd fastlane
    bundle exec fastlane android ci
```

### Các bước debug thêm:

#### 1. **Kiểm tra file gradlew có tồn tại:**
```bash
ls -la android/gradlew
```

#### 2. **Kiểm tra permissions:**
```bash
chmod +x android/gradlew
```

#### 3. **Kiểm tra working directory:**
```bash
pwd
ls -la
```

#### 4. **Test Fastlane local:**
```bash
cd fastlane
bundle exec fastlane android build_apk
```

### Nếu vẫn gặp lỗi:

#### 1. **Sử dụng đường dẫn tuyệt đối trong Fastfile:**
```ruby
gradle(
  task: "assembleRelease",
  project_dir: "/home/runner/work/test_bloc/test_bloc/android"
)
```

#### 2. **Thêm step tạo symlink:**
```yaml
- name: Create gradlew symlink
  run: |
    ln -sf $(pwd)/android/gradlew /usr/local/bin/gradlew
```

#### 3. **Sử dụng Flutter build thay vì Gradle:**
```ruby
lane :build_apk do
  sh("cd .. && flutter build apk --release")
end
```

### Logs để debug:
- Kiểm tra step "Verify Android project" để xem cấu trúc thư mục
- Kiểm tra step "Install Fastlane" để đảm bảo Fastlane hoạt động
- Kiểm tra step "Run Fastlane CI for Android" để xem lỗi cụ thể

### Các lỗi thường gặp khác:

#### 1. **Java version không đúng:**
```yaml
- name: Setup Java
  uses: actions/setup-java@v4
  with:
    distribution: "zulu"
    java-version: "17"
```

#### 2. **Flutter version không đúng:**
```yaml
- name: Setup Flutter
  uses: subosito/flutter-action@v2
  with:
    flutter-version: ${{ env.FLUTTER_VERSION }}
    channel: "stable"
    cache: true
```

#### 3. **Ruby version không đúng:**
```yaml
- name: Setup Ruby
  uses: ruby/setup-ruby@v1
  with:
    ruby-version: "3.3"
    bundler-cache: true
```
