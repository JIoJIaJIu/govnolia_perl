

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Govnolia',
    VERSION_FROM => 'lib/Govnolia.pm', # finds \$VERSION
    AUTHOR       => 'Guro Bokum (jiojiajiu@gmail.com)',
    ABSTRACT     => 'Module abstract (<= 44 characters) goes here',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);
