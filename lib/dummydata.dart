import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarf/school.dart';

/////////////FAQ/////////////////////////

Map <String,String> FAQs ={

  "Why do I have to choose 2 schools?":"The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
  "Can I change the school later on?":"The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
  "I need more information about the school. Who can I talk to?":"The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
  "How to search for dormitory?":"The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",

};



////////////////////////////////////////////////////////////////////////////////////
List <Institute> favts =[




];


List<Institute> Institutes = [
  Institute(
      title: "Sampson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school1.png',
            'assets/images/school2.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Houston Basked School",
      category: "IT",
      image: "assets/images/school2.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school2.png',
            'assets/images/school1.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Brafford Lincon School",
      category: "Engineering",
      image: "assets/images/school3.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school3.png',
            'assets/images/school2.png',
            'assets/images/school1.png',


          ]
      )

  ),

];
List<Institute> Populars = [

  Institute(
      title: "Houston Basked School",
      category: "IT",
      image: "assets/images/school2.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school2.png',
            'assets/images/school1.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Sampson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school1.png',
            'assets/images/school2.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Brafford Lincon School",
      category: "Engineering",
      image: "assets/images/school3.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school3.png',
            'assets/images/school2.png',
            'assets/images/school1.png',


          ]
      )

  ),

];
List<Institute> Colleges = [
  Institute(
      title: "Brafford Lincon School",
      category: "Engineering",
      image: "assets/images/school3.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school3.png',
            'assets/images/school2.png',
            'assets/images/school1.png',


          ]
      )

  ),
  Institute(
      title: "Sampson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school1.png',
            'assets/images/school2.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Houston Basked School",
      category: "IT",
      image: "assets/images/school2.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school2.png',
            'assets/images/school1.png',
            'assets/images/school3.png',
          ]
      )

  ),

];

List<Institute> SimilarSchools = [
  Institute(
      title: "Brafford Lincon School",
      category: "Engineering",
      image: "assets/images/school3.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school3.png',
            'assets/images/school2.png',
            'assets/images/school1.png',


          ]
      )

  ),
  Institute(
      title: "Sampson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school1.png',
            'assets/images/school2.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Houston Basked School",
      category: "IT",
      image: "assets/images/school2.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school2.png',
            'assets/images/school1.png',
            'assets/images/school3.png',
          ]
      )

  ),

];

List<Institute> Allinstitutes = [
  Institute(
      title: "Brafford Lincon School",
      category: "Engineering",
      image: "assets/images/school3.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school3.png',
            'assets/images/school2.png',
            'assets/images/school1.png',


          ]
      )

  ),
  Institute(
      title: "Samson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school1.png',
            'assets/images/school2.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Houston Basked School",
      category: "IT",
      image: "assets/images/school2.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school2.png',
            'assets/images/school1.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Brafford Lincon School",
      category: "Engineering",
      image: "assets/images/school3.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school3.png',
            'assets/images/school2.png',
            'assets/images/school1.png',


          ]
      )

  ),
  Institute(
      title: "Sampson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school1.png',
            'assets/images/school2.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Houston Basked School",
      category: "IT",
      image: "assets/images/school2.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school2.png',
            'assets/images/school1.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Houston Basked School",
      category: "IT",
      image: "assets/images/school2.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school2.png',
            'assets/images/school1.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Sampson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school1.png',
            'assets/images/school2.png',
            'assets/images/school3.png',
          ]
      )

  ),
  Institute(
      title: "Brafford Lincon School",
      category: "Engineering",
      image: "assets/images/school3.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/school3.png',
            'assets/images/school2.png',
            'assets/images/school1.png',


          ]
      )

  ),

];

// 2D List////

List <List<Institute>> Allschools = [
  Institutes,
  Populars,
  Colleges,
  //SimilarSchools,

];


//List Allinstitutes = Institutes+Populars+Colleges;
