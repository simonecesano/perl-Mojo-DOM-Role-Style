use strict;
use warnings;

package Mojo::DOM::Role::Style;

# ABSTRACT: Adds a style method to Mojo::DOM

use Mojo::Base -role;
use Want;

sub style {
    my $self = shift;
    my $css = $self->attr('style');
    my $h = $css ? { split /\;|\:/, $css } : {};

    # print 'OBJECT' if want('OBJECT');
    # print 'HASH'   if want('HASH');

    if (scalar @_ == 2) {
	$h->{$_[0]} = $_[1];

	my $css = join ';', map { join ':', $_, $h->{$_} } keys %{$h};

	$self->attr('style', $css);

	return want('OBJECT') ? $self :
	    want('HASH') ? $h :
	    $css;
    } elsif (scalar @_ == 1) {
	return $h->{shift()}
    } elsif (want('OBJECT')) {
	return $self;
    } elsif (want('HASH')) {
	return $h;
    } else {
	return $css;
    }
}

1;
