import 'package:flutter/material.dart';
import 'package:sapi_pmk/model/question_model.dart';
import 'package:sapi_pmk/pages/home.dart';
import 'package:sapi_pmk/pages/navpages/about_page.dart';
import 'package:sapi_pmk/pages/navpages/info_pmk.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //memanggil data
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Pendeteksian Gejala Non-Fisik PMK",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            _questionWidget(),
            _answerList(),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pertanyaan ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          color: Colors.black,
          height: 15.0,
          thickness: 2.0,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color(0xFF016CA3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Text(
              questionList[currentQuestionIndex].questionText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool? isSelected = answer == selectedAnswer;
    return Container(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: MediaQuery.of(context).size.height / 12,
        child: ElevatedButton(
          child: Text(
            answer.answerText,
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: isSelected ? Colors.orangeAccent : Color(0xFF01ACC7),
            onPrimary: isSelected ? Colors.white : Colors.white,
          ),
          onPressed: () {
            if (selectedAnswer == null) {
              if (answer.isCorrect) {
                score++;
              }
              setState(() {
                selectedAnswer = answer;
              });
            }
          },
        ),
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height / 14,
          child: ElevatedButton(
            child: Text(
              isLastQuestion ? "Lihat Hasil" : "Selanjutnya",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 0,
              primary: Colors.white,
              onPrimary: Color(0xFF016CA3),
            ),
            onPressed: () {
              if (isLastQuestion) {
                //hasil
                showDialog(
                    context: context, builder: (_) => _showScoreDialog());
              } else if (selectedAnswer == null) {
                currentQuestionIndex;
              } else {
                //pertanyaan selanjutnya
                setState(() {
                  selectedAnswer = null;
                  currentQuestionIndex++;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  _showScoreDialog() {
    bool isPassed = false;
    if (score >= questionList.length * 0.3) {
      isPassed = true;
    }
    String title = isPassed
        ? "Gejala non-fisik PMK sudah dialami oleh sapi. Diharapkan peternak waspada dan segera lakukan pertolongan pertama (pada tombol informasi PMK) atau dapat menghubungi Dinas setempat"
        : "Gejala non-fisik PMK yang dialami oleh sapi, diharapkan peternak tetap waspada dan sebaiknya tetap melakukan konsultasi kepada Dinas setempat.";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " --_ HASIL _--",
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height / 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              padding: EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  Image.asset(
                    'img/hasil2.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "${score}/${questionList.length.toString()}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 1.05,
              child: SingleChildScrollView(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width / 1.05,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            height: MediaQuery.of(context).size.height / 14,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InfoPmkPage()));
                              },
                              elevation: 0.0,
                              color: Color(0xFF016CA3),
                              textColor: Colors.white,
                              child: Text("Informasi PMK"),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 300,
                            height: MediaQuery.of(context).size.height / 14,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutPage()));
                              },
                              elevation: 0.0,
                              color: Color(0xFF016CA3),
                              textColor: Colors.white,
                              child: Text("Dinas Setempat"),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 300,
                            height: MediaQuery.of(context).size.height / 14,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuizPage()));
                              },
                              elevation: 0.0,
                              color: Color(0xFF016CA3),
                              textColor: Colors.white,
                              child: Text("Ulangi Deteksi"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 14,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          label: const Text('Selesai'),
          backgroundColor: Color(0xFF01ACC7),
        ),
      ),
    );
  }
}
