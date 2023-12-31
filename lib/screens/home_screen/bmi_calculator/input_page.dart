import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pemmob_app/screens/home_screen/bmi_calculator/bmi_calculate.dart';
import 'package:pemmob_app/screens/home_screen/bmi_calculator/bmi_constant.dart';
import 'package:pemmob_app/screens/home_screen/bmi_calculator/bmi_result_page.dart';
import 'package:pemmob_app/utils/constants.dart';
import 'bmi_reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender = Gender.male;
  int height = 120;
  int weight = 45;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("BMICalculator"),
        //   elevation: 0,
        // ),
        body: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: activeGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'MALE',
                          style: kLabelTextStyle,
                        )
                      ]),
                  onPress: () {
                    setState(() {
                      activeGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeGender == Gender.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'FEMALE',
                          style: kLabelTextStyle,
                        )
                      ]),
                  onPress: () {
                    setState(() {
                      activeGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: kTextColorBlack,
                    activeTrackColor: Colors.white,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                    trackHeight: 1,
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    onChanged: (double value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                  ),
                ),
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            onPress: () {},
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  onPress: () {},
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Calculate bmiCalculate = Calculate(height: height, weight: weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                        bmiResult: bmiCalculate.calculateBMI(),
                        result: bmiCalculate.getResults(),
                        review: bmiCalculate.getReview())));
          },
          child: Container(
            width: double.infinity,
            height: kBottomContainerHeight,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(bottom: 10),
            color: kTextColorBlack,
            child: const Center(
              child: Text(
                'Calculate',
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Work Sans'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onTap});

  final Icon icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: kButtonColor,
      onPressed: () {
        onTap();
      },
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 7,
      child: icon,
    );
  }
}
