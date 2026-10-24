import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/utils/date_formatter.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text:
          'Halo! Saya **UKKMate AI Assistant** 🤖.\nSaya siap membantu Anda mempersiapkan Uji Kompetensi Keahlian (UKK) SMK, pemahaman materi kejuruan (RPL/TKJ), tips menghadapi CBT, maupun kendala teknis aplikasi.\n\nAda yang bisa saya bantu hari ini?',
      isUser: false,
      timestamp: DateFormatter.getCurrentTimeWib(),
    ),
  ];

  final List<String> _quickPrompts = [
    '📌 Kisi-kisi UKK RPL 2026',
    '💻 Query Database & SQL UKK',
    '⏱️ Tips Manajemen Waktu CBT',
    '🔄 Cara Sinkronisasi Nilai Dapodik',
    '🛡️ Aturan Anti-Kecurangan Ujian',
  ];

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSubmitted(String text) {
    final query = text.trim();
    if (query.isEmpty) return;

    _textController.clear();
    setState(() {
      _messages.add(
        _ChatMessage(
          text: query,
          isUser: true,
          timestamp: DateFormatter.getCurrentTimeWib(),
        ),
      );
      _isTyping = true;
    });
    _scrollToBottom();

    // Simulate AI thinking and response
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) return;

      final botReply = _generateBotResponse(query);
      setState(() {
        _isTyping = false;
        _messages.add(
          _ChatMessage(
            text: botReply,
            isUser: false,
            timestamp: DateFormatter.getCurrentTimeWib(),
          ),
        );
      });
      _scrollToBottom();
    });
  }

  String _generateBotResponse(String query) {
    final q = query.toLowerCase();

    if (q.contains('kisi-kisi') || q.contains('rpl')) {
      return '📋 **Kisi-kisi Utama UKK Rekayasa Perangkat Lunak (RPL)**:\n\n'
          '1. **Pemodelan Perangkat Lunak**: Diagram Use Case, ERD, dan Class Diagram.\n'
          '2. **Basis Data**: Normalisasi database (1NF-3NF), DDL & DML SQL, relasi tabel foreign key.\n'
          '3. **Pemrograman Web / Mobile**: CRUD, autentikasi sesi/JWT, validasi form, dan integrasi RESTful API.\n'
          '4. **Pengujian & Deployment**: Pengujian fungsionalitas (Blackbox Testing) dan presentasi portofolio di hadapan Asesor LSP-P1.';
    } else if (q.contains('database') || q.contains('sql') || q.contains('query')) {
      return '💻 **Tips Query SQL untuk Ujian UKK**:\n\n'
          '• **INNER JOIN**: Menggabungkan data terkait antar 2 tabel:\n'
          '```sql\nSELECT siswa.nama, kelas.nama_kelas\nFROM siswa\nJOIN kelas ON siswa.kelas_id = kelas.id;\n```\n'
          '• **Index & Primary Key**: Pastikan setiap entitas memiliki primary key (auto-increment atau UUID) untuk menjaga integritas data relasional.';
    } else if (q.contains('waktu') || q.contains('cbt') || q.contains('tips')) {
      return '⏱️ **Strategi Sukses Menghadapi CBT UKKMate**:\n\n'
          '1. **Skim Soal Pertama Kali**: Jawab soal-soal konseptual yang mudah terlebih dahulu.\n'
          '2. **Tandai Ragu-ragu**: Jika ada soal studi kasus panjang, gunakan fitur tombol kuning *Ragu-ragu* dan kembali setelah soal lain selesai.\n'
          '3. **Perhatikan Timer**: Sisakan 10 menit terakhir untuk memeriksa ulang seluruh jawaban.';
    } else if (q.contains('dapodik') || q.contains('sinkron')) {
      return '🔄 **Integrasi Dapodik & Supabase Backend**:\n\n'
          'Data siswa otomatis disinkronkan berdasarkan 10 digit NISN resmi. Nilai simulasi ujian dan asesmen akan tersimpan di database cloud (Supabase) dan dapat diekspor langsung oleh Guru Pendamping ke format Dapodik sekolah.';
    } else {
      return 'Terima kasih atas pertanyaannya! 💡\n\n'
          'Mengenai "$query", sistem UKKMate terintegrasi dengan modul pembelajaran dan bank soal standar BNSP. Anda dapat mencoba mengerjakan modul latihan terkait di menu **Latihan** atau menghubungi Guru Pendamping Anda untuk sesi bimbingan teknis lab.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.smart_toy,
                color: AppColors.primaryBlue,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'UKKMate AI Assistant',
                      style: AppTextStyles.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'AI',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Online • Asisten Persiapan UKK',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primaryGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
            onSelected: (value) {
              if (value == 'clear') {
                setState(() {
                  _messages.clear();
                  _messages.add(
                    _ChatMessage(
                      text: 'Riwayat obrolan telah dibersihkan. Ada yang ingin Anda diskusikan?',
                      isUser: false,
                      timestamp: DateFormatter.getCurrentTimeWib(),
                    ),
                  );
                });
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'clear',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, size: 18),
                    SizedBox(width: 8),
                    Text('Bersihkan Obrolan'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Quick prompt chips
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.borderLight, width: 0.8),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: _quickPrompts.map((prompt) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ActionChip(
                      label: Text(
                        prompt,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.08),
                      side: BorderSide(
                        color: AppColors.primaryBlue.withValues(alpha: 0.2),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onPressed: () => _handleSubmitted(prompt),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Messages List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageItem(message);
              },
            ),
          ),

          // Typing Indicator
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'UKKMate AI sedang merespons...',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Bottom Input Bar
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildMessageItem(_ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.smart_toy,
                color: AppColors.primaryBlue,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: message.isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: message.isUser ? AppColors.primaryBlue : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(message.isUser ? 16 : 4),
                      bottomRight: Radius.circular(message.isUser ? 4 : 16),
                    ),
                    border: Border.all(
                      color: message.isUser
                          ? AppColors.primaryBlue
                          : AppColors.borderLight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SelectableText(
                    message.text,
                    style: AppTextStyles.bodyText1.copyWith(
                      color: message.isUser ? Colors.white : AppColors.textPrimary,
                      height: 1.45,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.timestamp,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary.withValues(alpha: 0.7),
                        fontSize: 10,
                      ),
                    ),
                    if (!message.isUser) ...[
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: message.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Teks jawaban disalin ke clipboard'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.copy_rounded,
                          size: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderLight.withValues(alpha: 0.8)),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: InputDecoration(
                          hintText: 'Tanyakan sesuatu tentang UKK...',
                          hintStyle: AppTextStyles.bodyText2.copyWith(
                            color: AppColors.textSecondary.withValues(alpha: 0.6),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  final String timestamp;

  const _ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
