use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => "OpenFrame::Segment::Apache",
  VERSION_FROM => "lib/OpenFrame/Segment/Apache.pm",
  PREREQ_PM    => {
    'Apache' => '1.27',
    'OpenFrame::AppKit' => '1.00',
    'LWP::UserAgent' => '2.001',
    'HTTP::Cookies' => '1.25',
    'URI' => '1.21',
  },
);

