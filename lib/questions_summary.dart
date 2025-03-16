import 'package:flutter/material.dart';


class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryList, {super.key});

  final List<Map<String, Object>> summaryList;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryList.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 35,
                  decoration: BoxDecoration(
                    color: (data['choseen_answer'] as String == data['correct_answer'] as String)? Color.fromARGB(182, 99, 223, 159) : const Color.fromARGB(134, 253, 101, 112),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color.fromARGB(138, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                //const SizedBox(height: 50,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['choseen_answer'] as String, style: const TextStyle(color: Color.fromARGB(157, 255, 255, 255)),),
                      Text(data['correct_answer'] as String, style: const TextStyle(color: Color.fromARGB(255, 0, 255, 8)),),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}