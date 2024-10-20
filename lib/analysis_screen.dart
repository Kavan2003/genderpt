import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genderpt/gemini.dart';
import 'analysis_model.dart';

class AnalysisScreen extends StatefulWidget {
  final String text;

  AnalysisScreen(this.text);

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  bool _isLoading = true;
  late Analysis analysis;
  @override
  void initState() {
    geminiText(widget.text).then((value) {
      analysis = Analysis.fromJson(jsonDecode(value));
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis Report'),
        backgroundColor: Colors.teal,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  _buildSectionTitle(
                      'Overall Score ${analysis.percentagescore}%'),
                  _buildSectionTitle('Overall Tone'),
                  _buildCard(analysis.overallTone),
                  _buildSectionTitle('Gender Representation'),
                  _buildGenderRepresentation(analysis.genderRepresentation),
                  _buildSectionTitle('Gender Bias'),
                  _buildCard(analysis.genderBias.presence),
                  _buildCard(analysis.genderBias.impact),
                  _buildCard(analysis.genderBias.mitigation),
                  _buildSectionTitle('Equality Promotion'),
                  _buildList(analysis.equalityPromotion.suggestions),
                  _buildSectionTitle('Language Analysis'),
                  _buildCard(analysis.languageAnalysis.analysis),
                  _buildSectionTitle('Recommendations'),
                  _buildList(analysis.recommendations),
                ],
              ),
            ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
      ),
    );
  }

  Widget _buildCard(String content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.info, color: Colors.teal),
        title: Text(content),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return Column(
      children: items.map((item) => _buildCard(item)).toList(),
    );
  }

  Widget _buildGenderRepresentation(GenderRepresentation genderRepresentation) {
    return Column(
      children: [
        _buildSectionTitle('Male Representation'),
        _buildGenderDetails(genderRepresentation.male),
        _buildSectionTitle('Female Representation'),
        _buildGenderDetails(genderRepresentation.female),
      ],
    );
  }

  Widget _buildGenderDetails(GenderDetails genderDetails) {
    return Column(
      children: [
        _buildCard('Characters: ${genderDetails.characters.join(', ')}'),
        _buildCard('Roles: ${genderDetails.roles.join(', ')}'),
        _buildCard('Traits: ${genderDetails.traits.join(', ')}'),
        _buildCard('Pronouns: ${genderDetails.pronouns.join(', ')}'),
      ],
    );
  }
}
