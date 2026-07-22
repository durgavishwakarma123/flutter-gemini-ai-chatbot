# Implementation Plan: Secure API Key Storage with .env

Store the Gemini API key in a `.env` file and use the `flutter_dotenv` package to access it. This ensures the key is not committed to public version control (GitHub).

## User Review Required

> [!IMPORTANT]
> A `.env` file will be created at the project root. You must ensure this file is **NOT** shared if you distribute the project zip manually, though it will be ignored by Git.

## Proposed Changes

### Project Configuration

#### [MODIFY] [pubspec.yaml](file:///C:/Users/LENOVO/Study%20and%20projects/flutter-gemini-ai-chatbot/pubspec.yaml)
- Add `flutter_dotenv` to dependencies.
- Add `.env` to the assets section.

#### [MODIFY] [.gitignore](file:///C:/Users/LENOVO/Study%20and%20projects/flutter-gemini-ai-chatbot/.gitignore)
- Add `.env` to the ignore list to prevent accidental commits.

#### [NEW] [.env](file:///C:/Users/LENOVO/Study%20and%20projects/flutter-gemini-ai-chatbot/.env)
- Create this file to store the `GEMINI_API_KEY`.

### Source Code

#### [MODIFY] [main.dart](file:///C:/Users/LENOVO/Study%20and%20projects/flutter-gemini-ai-chatbot/lib/main.dart)
- Initialize `flutter_dotenv` before running the app.

#### [MODIFY] [chat_controller.dart](file:///C:/Users/LENOVO/Study%20and%20projects/flutter-gemini-ai-chatbot/lib/controllers/chat_controller.dart)
- Replace hardcoded `_apiKey` with a call to `dotenv.env['GEMINI_API_KEY']`.

## Verification Plan

### Automated Tests
- Run `flutter pub get` to verify dependencies.
- Verify the app builds successfully.

### Manual Verification
- Verify that the chatbot still functions correctly using the API key from the `.env` file.
- Check that `.env` is correctly ignored by Git (e.g., `git status` should not show it if Git is initialized).
