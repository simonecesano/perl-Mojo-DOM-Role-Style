use Test::More tests => 4;

use Mojo::DOM;

my $dom = Mojo::DOM->new('<div style="color:red;background-color:grey;font-size:12pt">some string</div>')->with_roles('+Style');

$\ = "\n";


# print $dom->at('div')->style;

ok($dom->at('div')->style({ 'color' => 'blue'}) eq 'color:blue;background-color:grey;font-size:12pt', 'string round trip');

ok($dom->at('div')->style({ 'font-size' => '16pt' })->style->{'font-size'} eq "16pt");
# print $dom->at('div')->style;



ok($dom->at('div')->style('color', 'blue')->style('color') eq "blue", 'replace #1');
ok($dom->at('div')->style eq "color:blue", 'replace #2');


# ok($dom->at('div')->style->all_text eq 'some string');

