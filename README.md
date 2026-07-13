# 🤖 AI Chatbot - Powered by Gemini

A modern, sleek, and intelligent AI Chatbot built with Flutter and integrated with Google's Gemini AI. This application allows users to have real-time conversations with an AI, featuring voice-to-text capabilities and a beautiful Material Design interface.

## 🚀 Features

-   **Gemini AI Integration:** Powered by the latest `gemini-flash` model for fast and accurate responses.
-   **Voice Interaction:** Includes Speech-to-Text functionality for hands-free messaging.
-   **Rich Text Support:** AI responses are rendered using Markdown for better readability (code snippets, bold text, lists, etc.).
-   **Smooth UI/UX:** Features a clean, modern design with custom animations and a splash screen.
-   **Conversation Management:** Easily clear chat history to start fresh.
-   **Permissions Handling:** Seamlessly requests microphone access for voice features.
-   **Share Support:** Share AI responses directly from the app.

## 🛠️ Tech Stack

-   **Framework:** [Flutter](https://flutter.dev/)
-   **Language:** [Dart](https://dart.dev/)
-   **AI Engine:** [Google Gemini API](https://ai.google.dev/)
-   **State Management:** Clean Controller-based architecture.
-   **Key Packages:**
    -   `http`: For API communication.
    -   `speech_to_text`: For voice typing.
    -   `flutter_markdown`: To display AI responses beautifully.
    -   `google_fonts`: For modern typography.
    -   `flutter_spinkit`: For loading indicators.
    -   `permission_handler`: For managing device permissions.

## 📸 Screenshots

| Splash Screen | Home / Chat | Voice Input |
| :---: | :---: | :---: |
| ![Splash](https://via.placeholder.com/200x400?text=Splash+Screen) | ![Home](https://via.placeholder.com/200x400?text=Chat+Interface) | ![Voice](https://via.placeholder.com/200x400?text=Voice+Typing) |

*(Note: Replace these placeholders with actual screenshots of your app)*

## ⚙️ Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/ai_chatbot.git
    cd ai_chatbot
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Get your Gemini API Key:**
    -   Go to [Google AI Studio](https://aistudio.google.com/).
    -   Generate a new API Key.

4.  **Configure the API Key:**
    -   Open `lib/controllers/chat_controller.dart`.
    -   Replace the `_apiKey` value with your actual API key.

5.  **Run the app:**
    ```bash
    flutter run
    ```

## 📂 Project Structure

```text
lib/
├── controllers/    # Business logic & API handling
├── core/           # App themes and constants
├── models/         # Data models (Message, etc.)
├── presentation/   # UI screens and custom widgets
└── main.dart       # Entry point
```

## 🤝 Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

## 📄 License

This project is licensed under the MIT License.

---
Developed with ❤️ by Durga Vishwakarma
