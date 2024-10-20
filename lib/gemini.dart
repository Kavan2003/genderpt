import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<String> geminiText(String message) async {
  final apiKey = 'AIzaSyCKa22zf5XkyofEJvdlq7ZRsB-OgS2wrSg';
  if (apiKey == null) {
    stderr.writeln(r'No $GEMINI_API_KEY environment variable');
    return '';
  }

  final model = GenerativeModel(
    model: 'gemini-1.5-pro-002',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      temperature: 1.4,
      topK: 40,
      topP: 0.95,
      maxOutputTokens: 8192,
      responseMimeType: 'application/json',
    ),
  );

  final content = Content.text(
      ''' Act as a Gendered Language Analysis  analyzes the given TEXT and give your analysis inJson mode with proper information and dont reply with any kind of Markdown language Just plane simple English and Aim for that fact of Gender equality. Evaluate the following text for gender bias on a scale of 0 to 100, where 0 indicates no bias and 100 indicates high bias. Please provide a percentage score. \nuse the given Json format for response enclosed in triple hashtags.\n\n\nresponse format ###{\n  "overall_tone": "neutral",\n  "gender_representation": {\n    "male": {\n      "characters": ["John", "Mike"],\n      "roles": ["hero", "villain"],\n      "traits": ["brave", "strong"],\n      "pronouns": ["he", "him"]\n    },\n    "female": {\n      "characters": ["Jane", "Alice"],\n      "roles": ["heroine", "support"],\n      "traits": ["intelligent", "kind"],\n      "pronouns": ["she", "her"]\n    }\n  },\n  "gender_bias": {\n    "presence": "low",\n    "impact": "minimal",\n    "mitigation": "none"\n  },\n  "equality_promotion": {\n    "suggestions": ["Increase female representation", "Avoid stereotypes"]\n  },\n  "language_analysis": {\n    "gendered_terms": ["he", "she"],\n    "neutral_terms": ["they", "person"],\n    "analysis": "Balanced use of gendered and neutral terms"\n  },\n  "recommendations": ["Continue monitoring", "Promote diversity"]\n, "Percentagescore":"100"}###\n\nTEXT:"$message\n\n \n"''');

  final response = await model.generateContent([content]);
  print(response.text);
  return response.text.toString();
}
