// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the FAQItem class
class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

// Modify the TestimonialBox widget to have decoration and fixed size
class TestimonialBox extends StatelessWidget {
  final String text;

  const TestimonialBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Fixed width
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

// Define the FAQCubit class
class FAQCubit extends Cubit<List<FAQItem>> {
  FAQCubit() : super([]);

  void loadFAQs() {
    // Here you can load FAQs from your data source (e.g., API, database)
    // For demonstration purposes, I'm adding some dummy data
    List<FAQItem> faqs = [
      FAQItem(
        question: 'What is 07 Therapy?',
        answer: '07 Therapy is an online therapy platform that provides access to licensed therapists for mental health support and counseling.',
      ),
      FAQItem(
        question: 'How can online therapy improve my life?',
        answer: 'Online therapy can improve your life by providing convenient access to professional support, allowing you to address mental health concerns from the comfort of your own home, and offering a range of therapeutic modalities to suit your needs.',
      ),
      // Add more FAQs here...
    ];

    emit(faqs);
  }
}

// Define the HomeView widget
class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FAQCubit()..loadFAQs(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
        title: Text(
          'Welcome',
          style: TextStyle(fontSize: 24.0, color: Colors.teal[900], fontWeight: FontWeight.bold),
        ),
        floating: true,
                  actions: [
                IconButton(
                  icon: Icon(Icons.notification_important),
                  onPressed: () {
                    // Add your notification action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    // Add your menu action here
                  },
                ),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.0),
                        Container(
                          alignment: Alignment.centerLeft, // Align the text to the center horizontally
                          child: Text(
                            'How to use it',
                            style: TextStyle(fontSize: 24.0, color: Colors.teal[900], fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(height: 16.0),
                        Image.asset(
                          'assets/images/work.jpg',
                          width: 300.0,
                          height: 200.0,
                        ),
                          SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Testimonials',
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.teal[900]),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TestimonialBox(
                              text:
                              'Very friendly, understanding, good listener, intellectual therapist.. it was so nice to start my therapy journey with an expert.',
                            ),
                            TestimonialBox(
                              text: 'Perfect match, thank you so much looking forward to more sessions',
                            ),
                            TestimonialBox(
                              text:
                              'Video bio and profiles for the therapists helped me a lot while building the impression and making the decision...',
                            ),
                            TestimonialBox(
                              text: 'TherNest is a great channel for me for psychological maturity',
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Add FAQs section here
                    SizedBox(height: 32.0),
                    Text(
                      'FAQs',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.teal[900]),
                    ),
                    SizedBox(height: 16.0),
                    // Add BlocBuilder to display FAQ items
                    BlocBuilder<FAQCubit, List<FAQItem>>(
                      builder: (context, faqs) {
                        return Column(
                          children: faqs.map((faq) {
                            return ExpansionTile(
                              title: Text(faq.question),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(faq.answer),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
