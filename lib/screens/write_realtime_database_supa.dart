import 'package:flutter/material.dart';

class WriteReadRealtimeDatabaseSupa extends StatefulWidget {
  const WriteReadRealtimeDatabaseSupa({super.key});

  @override
  State<WriteReadRealtimeDatabaseSupa> createState() => _WriteReadRealtimeDatabaseSupaState();
}

class _WriteReadRealtimeDatabaseSupaState extends State<WriteReadRealtimeDatabaseSupa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Write and Read Realtime Database Supabase'),
        ],
      )
      ,
    );
  }
}