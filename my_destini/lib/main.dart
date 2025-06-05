import 'package:flutter/material.dart';
import 'package:my_destini/story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: StoryPage());
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  StoryPageState createState() => StoryPageState();
}

class StoryPageState extends State<StoryPage> {
  final brainStory = StoryBrain();
  getActualTitle() {
    return brainStory.getTitleStory();
  }

  getActualChoice1() {
    return brainStory.getChoice1();
  }

  getActualChoice2() {
    return brainStory.getChoice2();
  }

  setChoice(int choice) {
    setState(() {
      brainStory.nextStory(choice);
    });
  }

  void resetChoice() {
    setState(() {
      brainStory.setRestart();
    });
  }

  bool buttonShouldBeVisible() {
    return [3, 4, 5].contains(brainStory.getActualStory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.png')),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    getActualTitle(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () =>
                      buttonShouldBeVisible() ? resetChoice() : setChoice(1),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    getActualChoice1(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: !buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () {
                      setChoice(2);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      getActualChoice2(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
