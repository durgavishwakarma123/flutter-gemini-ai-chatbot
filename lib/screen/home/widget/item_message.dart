import 'package:ai_chatbot/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ItemMessage extends StatelessWidget {
  final MessageModel msg;
  const ItemMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: msg.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!msg.isUser) _buildAIAvatar(),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: msg.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: msg.isUser ? null : Colors.white,
                    gradient: msg.isUser 
                        ? const LinearGradient(
                            colors: [Colors.deepPurple, Colors.indigo],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(19),
                      topRight: const Radius.circular(19),
                      bottomLeft: Radius.circular(msg.isUser ? 19 : 4),
                      bottomRight: Radius.circular(msg.isUser ? 4 : 19),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: msg.isUser 
                    ? Text(
                        msg.text,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      )
                    : MarkdownBody(
                        data: msg.text,
                        styleSheet: MarkdownStyleSheet(
                          p: const TextStyle(color: Colors.black87, fontSize: 16, height: 1.4),
                          code: TextStyle(backgroundColor: Colors.grey[200]),
                        ),
                      ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    DateFormat('hh:mm a').format(msg.timestamp),
                    style: TextStyle(fontSize: 11, color: Colors.grey[500], fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (msg.isUser) _buildUserAvatar(),
        ],
      ),
    );
  }

  Widget _buildAIAvatar() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.deepPurple.withOpacity(0.2), width: 1),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/ai_chatbot_logo.png',
          width: 32,
          height: 32,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildUserAvatar() {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo, Colors.deepPurple],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, size: 18, color: Colors.white),
    );
  }
}
