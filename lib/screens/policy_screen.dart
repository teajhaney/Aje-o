import 'package:ajeo_test/screens/home_screen.dart';
import 'package:ajeo_test/utils/utils.dart';
import 'package:flutter/material.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  bool isClicked = false;

  void checkIsCkicked() {
    if (isClicked) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'Click check box to accept terms and condition.',
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: primaryColor),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              padding20, padding50, padding20, padding0),
          child: ListView(
            children: [
              Center(
                  child: Text(
                'PRIVACY NOTICE',
                style: textTheme.headline1,
              )),
              const SizedBox(height: padding20),
              Text(
                'Last updated March 03, 2022',
                style: textTheme.headline2,
              ),
              const SizedBox(height: padding20),
              RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: textTheme.bodyText1,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'AJE-O Limited',
                      style: textTheme.bodyText1!.copyWith(color: primaryColor),
                    ),
                    TextSpan(
                        text: ' (This privacy notice for',
                        style: textTheme.bodyText1),
                    TextSpan(
                        text: 'AJE-O Limited',
                        style:
                            textTheme.bodyText1!.copyWith(color: primaryColor)),
                    TextSpan(text: ' ("Company,"', style: textTheme.bodyText1),
                    TextSpan(
                        text: ' "we," "us,"',
                        style:
                            textTheme.bodyText1!.copyWith(color: primaryColor)),
                    TextSpan(text: ' or', style: textTheme.bodyText1),
                    TextSpan(
                        text: ' our',
                        style:
                            textTheme.bodyText1!.copyWith(color: primaryColor)),
                    TextSpan(
                        text:
                            '), describes how and why we might collect, store, use, and/or share ("process") your information when you use our services (',
                        style: textTheme.bodyText1),
                    TextSpan(
                        text: '"Services"',
                        style:
                            textTheme.bodyText1!.copyWith(color: primaryColor)),
                    TextSpan(
                        text: '), such as when you:',
                        style: textTheme.bodyText1),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding50, padding0, padding0, padding0),
                child: RichText(
                  text: TextSpan(
                    text: '▪ Visit our website at ',
                    style: textTheme.bodyText1,
                    children: <TextSpan>[
                      TextSpan(
                          text: ' http://www.aje-o.com',
                          style: textTheme.bodyText1!
                              .copyWith(color: primaryColor)),
                      TextSpan(
                          text:
                              ' or any website of ours that links to this privacy notice',
                          style: textTheme.bodyText1),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding50, padding0, padding0, padding0),
                child: Text(
                  '▪ Download and use our application(s), such as our mobile application — AjéO, or any other application of ours that links to this privacy notice',
                  style: textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding50, padding0, padding0, padding0),
                child: Text(
                  '▪ Engage with us in other related ways ― including any sales, marketing, or events',
                  style: textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: padding10),
              Text(
                questionConcern,
                style: textTheme.bodyText2,
              ),
              const SizedBox(
                height: padding40,
              ),
              Text(
                sumKeyPoint,
                style: textTheme.headline1,
              ),
              const SizedBox(height: padding10),
              Text(
                keyPoint,
                style: textTheme.bodyText2,
              ),
              const SizedBox(height: padding40),
              Text(
                'TABLE OF CONTENT',
                style: textTheme.headline1,
              ),
              Text(
                tableContent,
                style: textTheme.bodyText2!.copyWith(fontSize: 20, height: 2),
              ),
              const SizedBox(height: padding40),
              Text(
                '1. WHAT INFORMATION DO WE COLLECT?',
                style: textTheme.headline1,
              ),
              Text(infoBody1, style: textTheme.bodyText2),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding40, padding0, padding0, padding0),
                child: Text(infoBody2, style: textTheme.bodyText2),
              ),
              Text(infoBody3, style: textTheme.bodyText2),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding40, padding0, padding0, padding0),
                child: Text(infoBody4, style: textTheme.bodyText2),
              ),
              const SizedBox(height: padding40),
              Text('2. HOW DO WE PROCESS YOUR INFORMATION',
                  style: textTheme.headline1),
              Text(processBody1, style: textTheme.bodyText2),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding40, padding0, padding0, padding0),
                child: Text(
                  processBody2,
                  style: textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: padding40),
              Text(
                '3. WHAT LEGAL BASES DO WE RELY ON TO PROCESS YOUR INFORMATION?',
                style: textTheme.headline1,
              ),
              Text(
                legalBody1,
                style: textTheme.bodyText2,
              ),
              Text(
                  'If you are located in the EU or UK, this section applies to you.',
                  style: textTheme.bodyText2!
                      .copyWith(decoration: TextDecoration.underline)),
              Text(
                legalBody2,
                style: textTheme.bodyText2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding40, padding0, padding0, padding0),
                child: Text(
                  legalBody3,
                  style: textTheme.bodyText2,
                ),
              ),
              Text(
                'If you are located in Canada, this section applies to you.',
                style: textTheme.bodyText2!
                    .copyWith(decoration: TextDecoration.underline),
              ),
              Text(
                legalBody4,
                style: textTheme.bodyText2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding40, padding0, padding0, padding0),
                child: Text(
                  legalBody5,
                  style: textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                height: padding40,
              ),
              Text(
                  '4. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?',
                  style: textTheme.headline1),
              Text(personalBody1, style: textTheme.bodyText2),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    padding40, padding0, padding0, padding0),
                child: Text(personalBody2, style: textTheme.bodyText2),
              ),
              const SizedBox(
                height: padding40,
              ),
              Text('5. HOW LONG DO WE KEEP YOUR INFORMATION',
                  style: textTheme.headline1),
              Text(keepBody, style: textTheme.bodyText2),
              const SizedBox(height: padding40),
              Text('6. HOW DO WE KEEP YOUR INFORMATION SAFE?',
                  style: textTheme.headline1),
              Text(safeBody, style: textTheme.bodyText2),
              Text('7. WHAT ARE YOUR PRIVACY RIGHTS?',
                  style: textTheme.headline1),
              Text(privacyBody, style: textTheme.bodyText2),
              const SizedBox(height: padding40),
              Text('8. CONTROLS FOR DO-NOT-TRACK FEATURES',
                  style: textTheme.headline1),
              Text(controlBody, style: textTheme.bodyText2),
              const SizedBox(height: padding40),
              Text('9. DO CALIFORNIA RESIDENTS HAVE SPECIFIC PRIVACY RIGHTS?',
                  style: textTheme.headline1),
              Text(specificBody, style: textTheme.bodyText2),
              const SizedBox(height: padding40),
              Text('10. DO WE MAKE UPDATES TO THIS NOTICE?',
                  style: textTheme.headline1),
              Text(updateBody, style: textTheme.bodyText2),
              const SizedBox(height: padding40),
              Text('11. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?',
                  style: textTheme.headline1),
              Text(contactBody, style: textTheme.bodyText2),
              const SizedBox(height: padding40),
              Text(
                  '12. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?',
                  style: textTheme.headline1),
              Text(reviewBody, style: textTheme.bodyText2),
              const SizedBox(height: padding40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Accep terms and conditions',
                      style:
                          textTheme.headline1!.copyWith(color: primaryColor)),
                  Checkbox(
                    activeColor: primaryColor,
                    value: isClicked,
                    onChanged: (value) {
                      setState(() {
                        isClicked = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: padding20),
              ElevatedButton(
                  onPressed: checkIsCkicked,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor)),
                  child: Text(
                    'Accept',
                    style: textTheme.headline1!
                        .copyWith(color: mobileBackgroundColor),
                  )),
              const SizedBox(height: padding20),
            ],
          ),
        ),
      ),
    );
  }
}
