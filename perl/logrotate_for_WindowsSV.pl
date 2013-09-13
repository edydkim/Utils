#!c:\strawberry\perl\bin

use DateTime qw();

my $before = 1;
if ($#ARGV >= 0) {
	print "Usage: $0 [the day before] \n";
	<STDIN>;
	$before =  @ARGV[0];
}

my $SOURCE_DIR = 'C:\\server\\platform_a';
my $DEST_DIR = 'D:\\log';
my $DEST_DIR_DELETED = 'D:\\log\\4';
my $date = DateTime->now(time_zone=>'local')->subtract(days => $before);
my $YESTERDAY = $date->strftime('%Y%m%d');

# <- unless (-d "$DEST_DIR_DELETED") {
# <- 	system("rmdir /S /Q $DEST_DIR_DELETED") or print "error 0.. : $!, $DEST_DIR_DELETED \n";
# <- }

# <- my @GENERATION = (3, 2, 1);

# <- foreach my $i (@GENERATION) {
# <- 	my n = $i + 1;
# <- 	unless (-d $DEST_DIR."\\".$i) {
# <-  		system("mkdir $DEST_DIR\\$j") or print "error 1.. : $!, $DEST_DIR\\$j \n";
# <-  	}
# <- 	system("rename $DEST_DIR\\$i $j") or print "error 2.. : $!, $DEST_DIR\\$j \n";
# <- }

unless (-d "${DEST_DIR}\\${YESTERDAY}") {
	system("mkdir ${DEST_DIR}\\${YESTERDAY}");
}

for (my $i = 1; $i < 9; $i++) {
	unless (-d ${DEST_DIR}."\\${YESTERDAY}\\platform_a".${i}) {
		system("mkdir ${DEST_DIR}\\${YESTERDAY}\\platform_a${i}");
	}
	system("move ${SOURCE_DIR}${i}\\Log\\*${YESTERDAY}*.log ${DEST_DIR}\\${YESTERDAY}\\platform_a${i}");
}

my $rnt = system("C:\\\"Program Files\"\\7-zip\\7z.exe a D:\\log\\${YESTERDAY}.7z D:\\log\\${YESTERDAY}");

system("rmdir /S /Q ${DEST_DIR}\\${YESTERDAY}") unless $rnt;

exit 0;

1;
