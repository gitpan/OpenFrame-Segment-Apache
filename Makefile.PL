    use ExtUtils::MakeMaker;
    WriteMakefile
      ('DISTNAME' => 'OpenFrame-Segment-Apache',
       'VERSION' => '1.10',
       'PL_FILES' => {},
       'PREREQ_PM' => {
			'Test::More' => '0.01',
			'URI' => '1.21',
			'LWP::UserAgent' => '2.001',
			'OpenFrame::AppKit' => '3.03',
			'HTTP::Cookies' => '1.25',
			'Apache' => '1.27',

		      },
      );
