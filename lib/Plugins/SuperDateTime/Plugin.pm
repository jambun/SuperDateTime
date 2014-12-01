# SuperDateTime plugin.pm by Greg Brown Feb 2005    www.gregbrown.net/squeeze
#	Copyright (c) 2005 
#	All rights reserved.
#
# DESCRIPTION
# SlimServer plugin screensaver datetime replacement. Graphically displays current weather conditions and forecasts.  
# Will also optionally display stock quotes and upcoming/current game information for MLB, NBA, NHL, NFL, and college 
# football and basketball teams at user-configurable intervals.
#
# REMOTE CONTROL
# Pressing up or down cycles the information shown on line one during time display.  It will also immediately
# display the time if it is not currently being shown.
# Pressing right or left cycles through the available games and long weather forecasts that normally cycle automatically.
# Pressing FWD or REW cycles through the long weather forecasts.
# Pressing '+' will force an immediate data refresh.
#
# This screen saver is based on the standard SlimServer DateTime screensaver written written by kdf.
# The graphical weather icons and the code to support them are based on the WeatherTime screensaver written by Martin Rehfeld.
#
# VERSION HISTORY
# 5.9.16   04/13/13 Ongoing updates to weather.com parsing
# 5.9.15b2 07/24/13 Ongoing updates to weather.com parsing
# 5.9.15b1 03/17/13 Ongoing updates to weather.com parsing
#                   Fixed NBA parsing (Thanks Steve)
# 5.9.14 05/15/12  Fixed weather.com parsing for most data elements.
#                  Updated German translations.
#                  Replaced NHL Thrashers with Wild.
#                  Fixed PayPal donation link from plugin settings page.  Wink wink.
# 5.9.13 03/14/12  Fixed NCAA basketball parsing.  Thanks again BoomX2.
# 5.9.12 02/01/12  Fixed NCAA basketball parsing.  Thanks BoomX2.
# 5.9.10 01/21/12  Added macro options to round WUnderground temperature data.
# 5.9.9  11/30/11  Moved to Google Code repository (Thanks Erland).  Fixed wunderground (Thanks BoomX2).  Changed plugin max version.
# 5.9.8  06/18/11  Fixed weather parsing.  Thanks for everyone's patience.
# 5.9.7  04/16/11  Added stuck monitor.
#                  Fixed NCAA football showing games on non gamedays.  Thanks BoomX2.
#                  Fixed weather.com and map parsing.  Thanks Peter, BoomX2, and any ohters.
#                  Fixed HI/LO shortened text.
#                  For non graphical players will no longer crash attempting to call setCustomChar (I hope).
#                  Removed Amazon associate links from settings page as they no longer support Illinois associates. :(
# 5.9.5  10/02/10  Fixed weather parsing.  Thanks Stubie.
#                  Fixed NCAA football parsing
#                  Fixed NHL parsing
#                  Fixed international precip parsing.
#                  Fixed weather alert parsing.
#                  Fixed bug relating to the display of long weather text items.                
#                  Above thanks to BoomX2.
#                  Minor display tweaks.             
# 5.9.3  07/31/10  Fixed weather.com parsing.  Special thanks to Erland and BoomX2.
#                  Should handle HTML ISO 8859-1 characters better.
# 5.9.2  06/12/10  Fixed MLB parsing.
# 5.9.1  05/24/10  Fixed infinite '*' when there are no cycling display items to show.
# 5.9.0  05/22/10  Substantial external API enhancements to bring SuperDateTime content to Jive-based players (Touch, Controller, Radio)
#                  via the Custom Clock applet (special thanks to Erland and Dan for all their coordination efforts to make this happen).
#                  Updated weather icon images.
#                  Added support for weather map images by location.
#                  Added support for sport team logo images.
#                  Added support for daily stock chart images.
#                  All sorts of other minor tweaks and enhancements.
# 5.8.15 03/07/10  Improved reliablity for international weather identifiers.
#                  Updated weather periods logic to reflect weather.com's recent changes
#                  Updated MLB date range to include spring training.
# 5.8.14 02/06/10  Complete weather.com parsing fix. Added past 24-hr precip and snowfall. Weather alerts.  
#                  NFL parsing fix (Thanks BoomX2).  Added TV/Radio info for College BB and NBA.
# 5.8.12 01/15/10  Initial fixing of weather.com parsing
# 5.8.11 12/17/09  Fixed College Football to only display games on the day in which they are occuring based on Eastern timezone.
#                  Fixed NFL icons (only three supported, more welcome!).
#                  Added Dutch translations (thanks Willem)
# 5.8.10 12/10/09  Fixed NFL to only display games on they day in which they are occuring based on Eastern timezone.
# 5.8.9  11/13/09  Fixed NFL, College Football, and weather averages parsing and long forecast display (Thanks BoomX2).
# 5.8.8  08/07/09  Fixed SqueezeServer 7.4 compatibility issues.  Fixed MLB/NBA refresh collision (Thanks Steve B and family.)
# 5.8.7  04/30/09  Fixed MLB icons and parsing for delayed/postponed games (Thanks Steve B and family).
#		   UV Rating now supported.
# 5.8.6  04/09/09  Fixed MLB parsing. (Thanks Steve B. and family)
# 5.8.5  03/13/09  Fixed NCAA CBB parsing. (Thanks Atslim)  
# 5.8.4  02/11/09  Fixed NBA and NHL parsing. (Thanks Steve B. and family)  
# 5.8.3  01/17/09  Fixed NBA parsing. (Thanks Steve B. and family)
# 5.8.2  12/06/08  Fixed date/time formatting to once again use regular Date/Time plugin format setting
#                  Updated WeatherUnderground parsing to handle stations that include Solar Radiation in their reading data
# 5.8.1  11/25/08  Switched to .par packaging to resolve installation issues (Thanks Steve B.)
#                  Switched to .png weather icons for clearer Duet display (Thanks Sue C)
# 5.8.0  11/22/08  Overhauled NBA parsing (Thanks Steve B, Sarah and Hannah).
#                  Stock information now viewable via Duet controller
#                  To support our international friends, stock display/refresh is now 24/7.
#                  Unit of measure for certain forecasts and Duet is not configurable
#                  German translations (Thanks Juergen)
#                  Misc bug fixes
# 5.7.0  09/10/08  Updated NFL parsing for new season.
#                  Resurrected automatic long weather forecast scrolling.
#                  Number of upcoming days worth of weather forecasts now configurable.
#                  Loads of bug fixes and performance enhancements.
#                  API now supports long text display items.
# 5.6.2  08/30/08  Alarm display support.  
#                  Touched font files to resolve overlapping text issue caused by
#                  SqueezeCenter fontcache bug.
#                  SDT will refresh data when there are no players with displays (Duet only configurations)
# 5.6.0  08/28/08  BOOM Support.  Player-specific configuration.
# 5.5.1  04/11/08  Fixed MLB parsing
# 5.5.0            Now offers API for other plugins to add display info.
#                  Added all remaing MLB icons.  Thanks B. Yudichak!
#                  Added Minnesota and Tampa Bay MLB icons.  Thanks M.Meyer!            
#		   Major overhaul of display code for future expandability.
#		   Fuzzytime support  http://www.tux.org/~peterw/slim/FuzzyTime.html
#                  Supports negative forecasts
#                  Save last viewing top item on restart
#                  Highly configurable display with smart spacing
#                  Up/down moves both screens for period.
#                  Holding down jumps to current conditions
#                  10 day forecasts
#                  Data updates sequential and less prone to blocking
#                  *** SlimServer 7.0 or later is required. ***
# 5.0.5  04/02/07  Fixed ESPN MLB parsing to handle minor '07 season website changes.
#                  Divided up MLB processing to decrease HTML parsing hangs.
#                  Added a few additional MLB logos.
# 5.0.4  01/19/07  Fixed bug where Top-25 conference selection is overwritten on sever restart.
# *** Complete version history is available on the website listed above. ***
#
# INSTALLATION
# 1. Unzip downloaded zip file into Squeezebox\server\Plugins\ directory.  This should result in a SuperDateTime folder
#    being created within the Plugins folder.  The folder name is case sensitive.
# 2. Restart SqueezeServer.
# 3. Ensure plugin is enabled from Server Settings / Plugins web page.
# 4. Configure custom plugin settings (city, teams, etc.) from Server Setttings / Plugins web page.
# 5. Enable screensaver for when a player is turned off from Player Settings web page.   
#
# [OPTIONAL] SlimServer can be configured to temporarily display SuperDateTime when powered on by holding the
#            size button for a couple seconds.  The display is returned to it's previous state by holding the
#            size button again for a couple seconds.  This is useful to view sports/weather/etc information
#            while listening to music.
#
# 6. Open up \SlimServer\Server\IR\Default.map in your favorite raw text editor.
# 7. Scroll down to # textsize modes
# 8. Edit the text in that section to mirror:
#      size = dead
#      size.single = textsize_toggle
#      size.hold   = modefunction_Plugins::SuperDateTime::Plugin->showme
#      #size           = textsize_toggle
#      textsize_small  = textsize_small
#      textsize_medium = textsize_medium
#      textsize_large  = textsize_large
# 9. Restart SlimServer
#
# NOTE: ABOVE OPTIONAL INFO IS DATED AND NEEDS TO BE REVISED FOR CHANGES IN SQUEEZECENTER.
# 
# FEEDBACK
# Please direct all feedback to GoCubs on the Slim Devices public forums at forums.slimdevices.com
#
# KNOWN BUGS/ISSUES
# 1.) Text may get truncated if it does not fit on the screen.  Selecting a smaller font fixes the problem.
# 2.) When using the "slide" scroll option, time display may appear to skip a second when the display
# transitions from showing game information or long description forecast to the time.
# 3.) In celius mode, a long description forecast that contains a temperature group (ie mid to upper 30s) instead of
# a specific high/low value (Low 30F) may not make sense after the conversion (ie mid to upper -2s).
# 4.) When SuperDateTime is used as an offsaver in SoftSqueeze, data refreshes will continue to occur once SoftSqueeze is
# closed.  This is because SoftSqueeze is put in "off" state when it is closed, which activates the offsaver. 
#
#	This program is free software; you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation; either version 2 of the License, or
#	(at your option) any later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program; if not, write to the Free Software
#	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
#	02111-1307 USA
#
# This code is derived from code with the following copyright message:
#
# SliMP3 Server Copyright (C) 2001 Sean Adams, Slim Devices Inc.
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License,
# version 2.

package Plugins::SuperDateTime::Plugin;

use strict;

use base qw(Slim::Plugin::Base);
use Slim::Utils::Misc;
use Slim::Utils::Strings qw (string);
use Slim::Networking::SimpleAsyncHTTP;
use Slim::Utils::Prefs;
use Slim::Utils::Log;
use Plugins::SuperDateTime::Settings;
use Plugins::SuperDateTime::PlayerSettings;
use lib "plugins/SuperDateTime/lib";
use HTML::TreeBuilder;
use Time::Local; 
#use Data::Dumper;
use HTML::Entities qw(decode_entities);
use JSON;

my $prefs = preferences('plugin.superdatetime');

my $twccity = '';

my $log = Slim::Utils::Log->addLogCategory({
	'category'     => 'plugin.superdatetime',
#	'defaultLevel' => 'WARN',
	'defaultLevel' => 'DEBUG',
	'description'  => getDisplayName(),
});

use vars qw($VERSION);
$VERSION = substr(q$Revision: 5.9.16 $,10);

$Plugins::SuperDateTime::Plugin::apiVersion = 2.0;

sub getDisplayName {
	return 'PLUGIN_SCREENSAVER_SUPERDATETIME';
}

sub enabled {
	return ($::VERSION ge '7.0');
}

my %killTicker; #Flag used to exit out of ticker mode
my $status = '';  #Used for the status indicator
my %overlay; #Used to show alarm indicator
my $errorCount = 0; #Used to keep track of network errors
my $activeClients = 0; #Number of players currently displaying SuperDateTime
my $forecastNum; #Used to keep track of if today's forecast includes just today or today and tonight.  There's probably a better way to do this but this will suffice for now...

#These preferences are used often so they're locally cached. Preset to default values.
my $showtime = 7; #How long to show the time when no games are active
my $showgame = 3; #How long to show an upcoming/completed game
my $showactivetime = 5; #How long to show the time when games are active
my $showactivegame = 3; #How long to show an active game
my $activeGames = 0; #Flag set if any games are active
my $newActiveGames; #Flag set during a data refresh if any games are active
my %scrollType = (); #Type of display scrolling between games per player

my %displayInfo; #Contains all the info shown when hitting up/down
my %displayInfoBuild; #Used while building display info in pieces

my %nowshowing; #What's now showing, 0 for time, Negative for long forecasts, etc
my %weathershowing; #Used for when the user chooses to just view the long weather forecasts via remote
my %topNowShowing; #Which item is being shown on top line during time display
my %displayLine1; #What is currently being shown on the display line 1 while cycling
my %displayLine2; #What is currently being shown on the display line 2 while cycling
my %tickline1; #Used to store previous value of display line 1 during ticker display

my %macroHash; #Used for custom macros that interfacing plugins may register

my %wetData = ();	#Stores weather-related data
my %wetMapURLs = ();	#Stores available weather image URLs

my %miscData = ();	#Stores misc data for use from jive interface (stocks)
my %sportsData = (); 	#Stores all sport info for use from jive interface

#Track the average high/low for today/tomorrow
my %averages = ('last' => ''); #Used to store raw averages data and when they were last refreshed

#Used to store pointers to the data providers
my %providers =  (#'1'  => \&getWeatherToday,
                  #'2'  => \&getLongWeatherTxt,
                  '1' => \&getWeatherTomorrow,
				  '2'  => \&get10day,
                  '3'  => \&getWunderground,
                  '4'  => \&getMLB,
                  '5'  => \&getNFL,
                  '6'  => \&getNBA,
                  '7'  => \&getNHL,
                  '8'  => \&getCBB,                  
                  '9' => \&getCFB,
                  '10' => \&getStocks,
                  '11' => \&getLongWeather,                 
                  '12' => \&getAverages);

my @WETdisplayItems1 = ();
my @WETdisplayItems2 = ();

my @WETdisplayItems1temp = ();
my @WETdisplayItems2temp = ();

my $drawEachPending = 0;
my $drawEachPendingDelay;

my @refreshTracker = (); #Used to keep track of which fields to continue to refresh
my $lastRefresh = ''; #Date that pertains to @refreshTracker data

#Arrays to contain the user selected teams to monitor for each sport and icon mappings
my @MLBteams = ();
my %MLBmap = ('Cubs'  => 10, 'White Sox'  => 11, 'Braves' => 12, 'Giants' => 13, 'Angels' => 14, 'Tigers' => 15, 'Astros' => 16, 'Reds' => 17, 'Diamondbacks' => 18, 'Twins' => 19, 'Rays' => 20, 'Red Sox' => 21, 'Indians' => 22, 'Rangers' => 24, 'Yankees' => 25, 'Orioles' => 26, 'Blue Jays' => 27, 'Royals' => 28, 'Athletics' => 29, 'Mariners' => 30, 'Pirates' => 31, 'Mets' => 32, 'Phillies' => 33, 'Marlins' => 34, 'Nationals' => 35, 'Brewers' => 36, 'Cardinals' => 37, 'Dodgers' => 38, 'Padres' => 39, 'Rockies' => 40 ); #Graphical icon mapping
my @NBAteams = ();
my @NHLteams = ();
my @NFLteams = ();
my %NFLmap = ('Bears'  => 10, 'Lions'  => 11, 'Packers' => 12); #Graphical icon mapping
my @CBBteams = ();
my @CFBteams = ();

#Graphical display stuff
my %xmax = ();
my %ymax = ();

my %hashDisp;

#
# Map ASCII characters to custom @Charset elements
#
my %Codepage = ( ' ' =>  0, '1' =>  1, '2' =>  2, '3' =>  3, '4' =>  4,
                 '5' =>  5, '6' =>  6, '7' =>  7, '8' =>  8, '9' =>  9,
                 '0' => 10, '-' => 11, '°' => 12, '.' => 13, '%' => 14,
                 'A' => 15, 'B' => 16, 'C' => 17, 'D' => 18, 'E' => 19,
                 'F' => 20, 'G' => 21, 'H' => 22, 'I' => 23, 'J' => 24,
                 'K' => 25, 'L' => 26, 'M' => 27, 'N' => 28, 'O' => 29,
                 'P' => 30, 'Q' => 31, 'R' => 32, 'S' => 33, 'T' => 34,
                 'U' => 35, 'V' => 36, 'W' => 37, 'X' => 38, 'Y' => 39,
                 'Z' => 40, '/' => 41, ':' => 42 );

#
# Custom 7x5 mono charset for 3-line forecast display on Squeezebox2
#
my @Charset = ('







','
  *
 **
* *
  *
  *
  *
*****
','
 ***
*   *
    *
   *
  *
 *
*****
','
 ***
*   *
    *
  **
    *
*   *
 ***
','
   *
  **
 * *
*****
   *
   *
   *
','
*****
*
*
****
    *
*   *
 ***
','
 ***
*
*
****
*   *
*   *
 ***
','
*****
    *
    *
   *
  *
 *
*
','
 ***
*   *
*   *
 ***
*   *
*   *
 ***
','
 ***
*   *
*   *
 ****
    *
    *
 ***
','
 ***
*   *
*   *
*   *
*   *
*   *
 ***
','



*****



','
 **
*  *
*  *
 **



','





  **
  **
','
**   
**  *
   *
  *
 *
*  **
   **
','
 ***
*   *
*   *
*****
*   *
*   *
*   *
','
****
*   *
*   *
****
*   *
*   *
****
','
 ***
*   *
*
*
*
*   *
 ***
','
****
*   *
*   *
*   *
*   *
*   *
****
','
*****
*
*
****
*
*
*****
','
*****
*
*
****
*
*
*
','
 ***
*   *
*
* ***
*   *
*   *
 ***
','
*   *
*   *
*   *
*****
*   *
*   *
*   *
','
 ***
  *
  *
  *
  *
  *
 ***
','
    *
    *
    *
    *
    *
*   *
 ***
','
*   *
*  *
* *
**
* *
*  *
*   *
','
*
*
*
*
*
*
*****
','
*   *
** **
* * *
*   *
*   *
*   *
*   *
','
*   *
*   *
**  *
* * *
*  **
*   *
*   *
','
 ***
*   *
*   *
*   *
*   *
*   *
 ***
','
****
*   *
*   *
****
*
*
*
','
 ***
*   *
*   *
*   *
*   *
* * *
*  **
 ** *
','
****
*   *
*   *
****
* *
*  *
*   *
','
 ****
*
*
 ***
    *
    *
****
','
*****
  *
  *
  *
  *
  *
  *
','
*   *
*   *
*   *
*   *
*   *
*   *
 *** 
','
*   *
*   *
*   *
*   *
*   *
 * *
  *
','
*   *
*   *
*   *
*   *
* * *
** **
*   *
','
*   *
*   * 
 * * 
  *  
 * * 
*   * 
*   *
','
*   *
*   *
 * *
  *
  *
  *
  *
','
*****
    *
   *
  *
 *
*
*****
','

    *
   *
  *
 *
*

','

 **
 **

 **
 **

');

#
# map standard weather.com icons to custom icons
#
my %Iconmap = ( '1'  => 2, '2'  => 2, '3'  => 2, '4'  => 2, '5'  => 23, 
                '6'  => 27,'7'  => 24,'8'  => 3, '9'  => 1, '10' => 3, 
                '11' => 25,'12' => 1, '13' => 18,'14' => 3, '15' => 19, 
                '16' => 20,'17' => 2, '18' => 26,'19' => 32,'20' => 33, 
                '21' => 10,'22' => 9, '23' => 11,'24' => 11,'25' => 30, 
                '26' => 0, '27' => 14,'28' => 6, '29' => 13,'30' => 5, 
                '31' => 12,'32' => 4, '33' => 13,'34' => 5, '35' => 2, 
                '36' => 31,'37' => 8, '38' => 8, '39' => 7, '40' => 28, 
                '41' => 21,'42' => 22,'43' => 22,'44' => 9, '45' => 15, 
                '46' => 16,'47' => 17,'48' => 29, '0' => 2, 'na' => 9,
                'NA' => 9, 'N/A' => 9 );

#
# Custom weather condition icons (40x32 pixel)
#
#234567890123456789012345678901234567890 - icon 0
my @Icons = ('





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
',
#234567890123456789012345678901234567890 - icon 1
'





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************

     *         *        *
     *         *   *    *
    *    *    *    *   *
    *    *    *   *    *    *
   *    *    *    *    *    *
   *         *        *    *
  *         *         *    *
',
#234567890123456789012345678901234567890 - icon 2
'





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **     **         ** ***
     *      **          *** **
  ****     **            *   **
 **        **                 *
**        **                  **
*         **                   ***
*        ** **                   **
*        ******                   *
**       *** **                  **
 ***        **                  **
   ******************************
           **
          **
     *    **   *        *
     * * **    *   *    *
    *  ****   *    *   *
    *  *****  *   *    *    *
   *    **   *    *    *    *
   *    *    *        *    *
  *         *         *    *
',
#234567890123456789012345678901234567890 - icon 3
'





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************

                           * *
      * *                *  *  *
    *  *  *               * * *
     * * *      * *      * *** *
    * *** *   *  *  *     * * *
     * * *     * * *     *  *  *
    *  *  *   * *** *      * *
      * *      * * *
              *  *  *
                * *
',
#234567890123456789012345678901234567890 - icon 4
'
                     *
        *            *
         *          *
          *         *
          *         *
           *       *          *
            *      *         *
                           **
                          *
 *            *****      *
  **        *********
    **     ***********
      *   *************
          *************
         ***************
         ***************
         ***************  *******
         ***************
         ***************
    ***   *************
****      *************
           ***********
            *********
              *****      *
                          *
           *               **
          *       *          *
         *        *           *
         *        *
        *          *
       *           *
                   *
',
#234567890123456789012345678901234567890 - icon 5
'
                     *
        *            *
         *          *
          *         *
          *         *
           *       *          *
            *      *         *
                           **
                          *
 *            *****      *
  **        *********
    **     *********** ****
      *   **********  **   *
          *********         **
         *********           * **
         *******              *  *
         ******                  **
         *****                    **
         *****                     *
    ***   *****                    *
****      *************************
           ***********
            *********
              *****      *
                          *
           *               **
          *       *          *
         *        *           *
         *        *
        *          *
       *           *
                   *
',
#234567890123456789012345678901234567890 - icon 6
'
                  *       *        *
                   *      *       *
                   *      *       *
                    *     *      *
                                *
              ****     *******
           ****  **** *********
        ****        ************     **
       **            ************  **
      **              ***********
     **                **********
     *                  *** *****
  ****                   *   ****
 **                           *** *
**                            ***  **
*                              ***   **
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
',
#234567890123456789012345678901234567890 - icon 7
'
                  *       *        *
                   *      *       *
                   *      *       *
                    *     *      *
                                *
              ****     *******
           ****  **** *********
        ****        ************     **
       **            ************  **
      **              ***********
     **                **********
     *                  *** *****
  ****                   *   ****
 **                           *** *
**                            ***  **
*                              ***   **
*                                **
*                                 *
**                               **
 ***                            **
   ******************************

     *         *        *
     *         *   *    *
    *    *    *    *   *
    *    *    *   *    *    *
   *    *    *    *    *    *
   *         *        *    *
  *         *         *    *
',
#234567890123456789012345678901234567890 - icon 8
'
                  *       *        *
                   *      *       *
                   *      *       *
                    *     *      *
                                *
              ****     *******
           ****  **** *********
        ****        ************     **
       **            ************  **
      **              ***********
     **     **         **********
     *      **          *** *****
  ****     **            *   ****
 **        **                 *** *
**        **                  ***  **
*         **                   ***   **
*        ** **                   **
*        ******                   *
**       *** **                  **
 ***        **                  **
   ******************************
           **
          **
     *    **   *        *
     * * **    *   *    *
    *  ****   *    *   *
    *  *****  *   *    *    *
   *    **   *    *    *    *
   *    *    *        *    *
  *         *         *    *
',
#234567890123456789012345678901234567890 - icon 9
'






                *****
              *********
             ***    ***
             *       ***
                     ***
                     ***
                    ****
                   ****
                  ****
                 ****
                 ***
                ***
                ***
                ***
                ***


                ***
                ***
                ***
',
#234567890123456789012345678901234567890 - icon 10
'




    
 
                               
**   **    *     ****** **   **
**   **   ***        ** **   **
**   **   * *       **   ** **
*******  **  *     **     ***
**   **  *****    **       *
**   **  *   *   **        *
**   ** *     * **         *
**   ** *     * ********   *
  
  *     *     *    *     *                
    *      *     *    *      *  
 *     *  *       *       * 
     *       *         *    *      
      *            *        
    *       *           *

  *       *       *        *              
                
      *       *        *          
                 
           *       *         
',
#234567890123456789012345678901234567890 - icon 11 - Windy - Thanks Yannzola
'
                       *
        *****          **
       **   **         **
      **     *         ******
      *      ****      ******
      *         **     ******
   ****          *     ******
  **           ******* **********
 **                    **********
 *                     **********
 *          ********** **********
 **                    **************
  ***                  **************
    ****************** **************
                       **************
                       ****************
         *******       *****************
        **     **     **
        *       **   **
       **    *   *  **
       *    **     **
       *    *     **
   *****    **   **
  **         ** **   ************
 **           ***
 *
 *
 *             ************************
 *
 **
  ***
    *****************************
',
#234567890123456789012345678901234567890 - icon 12
'
                     
        
         
          
          
           
          
                     
                          
              *****      
            **     **
           *     *   *
          *     * **  *
          *           *
         *          *  *
         *    *        *
         *   **   *    *  
         **   *  ***   *
         ***     *    *
          **    **    *
          ** ***      *
           ****   *  *
            **  ** **
              *****      
                          
          
         
      
        
        
       
                   
',
#234567890123456789012345678901234567890 - icon 13
'
                     
        
         
          
          
           
          
                     
                          
              *****      
            **     **
           *        ** ****
          *        *  **   *
          *       *         **
         *      **           * **
         *     *              *  *
         *    *                  **
         *   *                    **
         *   *                     *
          *   *                    *
          *   *********************
           *         *
            **     **
              *****      
                          
          
         
      
        
        
       
                   
',
#234567890123456789012345678901234567890 - icon 14
'
                  
                   
                   
                               
                         *****       
              ****     **     **
           ****  **** *         *
        ****        **           *     
       **            **          *  
      **              **         *
     **                ** ***    *
     *                  *** **   *
  ****                   *   *  *
 **                           ** 
**                            **   
*                              ***   
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
',
#234567890123456789012345678901234567890 - icon 15
'
                  
                   
                   
                               
                         *****       
              ****     **     **
           ****  **** *         *
        ****        **           *     
       **            **          *  
      **              **         *
     **                ** ***    *
     *                  *** **   *
  ****                   *   *  *
 **                           ** 
**                            **   
*                              ***   
*                                **
*                                 *
**                               **
 ***                            **
   ******************************

     *         *        *
     *         *   *    *
    *    *    *    *   *
    *    *    *   *    *    *
   *    *    *    *    *    *
   *         *        *    *
  *         *         *    *
',
#234567890123456789012345678901234567890 - icon 16
'
                  
                   
                   
                               
                         *****       
              ****     **     **
           ****  **** *         *
        ****        **           *     
       **            **          *  
      **              **         *
     **                ** ***    *
     *                  *** **   *
  ****                   *   *  *
 **                           ** 
**                            **   
*                              ***   
*                                **
*                                 *
**                               **
 ***                            **
   ******************************

                           * *
      * *                *  *  *
    *  *  *               * * *
     * * *      * *      * *** *
    * *** *   *  *  *     * * *
     * * *     * * *     *  *  *
    *  *  *   * *** *      * *
      * *      * * *
              *  *  *
                * *
',
#234567890123456789012345678901234567890 - icon 17
'
                  
                   
                   
                               
                         *****       
              ****     **     **
           ****  **** *         *
        ****        **           *     
       **            **          *  
      **              **         *
     **     **         ** ***    *
     *      **          *** **   *
  ****     **            *   *  *
 **        **                 ** 
**        **                  **   
*         **                   ***   
*        ** **                   **
*        ******                   *
**       *** **                  **
 ***        **                  **
   ******************************
           **
          **
     *    **   *        *
     * * **    *   *    *
    *  ****   *    *   *
    *  *****  *   *    *    *
   *    **   *    *    *    *
   *    *    *        *    *
  *         *         *    *
',
#234567890123456789012345678901234567890 - icon 18
'





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************

                         * *
                       *  *  *
                        * * *
                       * *** *
                        * * *
                       *  *  *
                         * *
                    
                     
                   
',
#234567890123456789012345678901234567890 - icon 19
'












                    * *
                  *  *  *
                   * * *
                  * *** *
                   * * *
                  *  *  * 
                    * *    * *
      * *                *  *  *
    *  *  *               * * *
     * * *      * *      * *** *
    * *** *   *  *  *     * * *
     * * *     * * *     *  *  *
    *  *  *   * *** *      * *
      * *      * * *
              *  *  *
                * *




',
#234567890123456789012345678901234567890 - icon 20
'




              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
        *  *  *     * * *
         * * *     *  *  *
        * *** *      * *    * *
   * *   * * *            *  *  *
 *  *  **  *  *            * * *
  * * *   * *   * *       * *** *
 * *** *      *  *  *      * * *
  * * *        * * *      *  *  *
 *  *  *      * *** *       * *
   * *         * * *
              *  *  *
                * *
',
#234567890123456789012345678901234567890 - icon 21
'
                  *       *        *
                   *      *       *
                   *      *       *
                    *     *      *
                                *
              ****     *******
           ****  **** *********
        ****        ************     **
       **            ************  **
      **              ***********
     **                **********
     *                  *** *****
  ****                   *   ****
 **                           *** *
**                            ***  **
*                              ***   **
*                                **
*                                 *
**                               **
 ***                            **
   ******************************

                           * *
      * *                *  *  *
    *  *  *               * * *
     * * *      * *      * *** *
    * *** *   *  *  *     * * *
     * * *     * * *     *  *  *
    *  *  *   * *** *      * *
      * *      * * *
              *  *  *
                * *   
',
#234567890123456789012345678901234567890 - icon 22
'

              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
  * *** *         *  *  *   * * *
   * * *           * * *   *  *  *
  *  *  *         * *** *    * *
    * *  *  *  *   * * *
          * * *   *  *  *
         * *** *    * *     * *
   * *    * * *           *  *  *
 *  *  * *  *  *           * * *
  * * *    * *  * *       * *** *
 * *** *      *  *  *      * * *
  * * *        * * *      *  *  *
 *  *  *      * *** *       * *
   * *         * * *
              *  *  *
                * *
',
#234567890123456789012345678901234567890 - icon 23
'

              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
   * *** *    *    *  *  *       
    * * *     *     * * *     *        
   *  *  *   *     * *** *   *         
     * *     *      * * *    *      
  *         *      *  *  *  *    
 *          *        * *    *
    * *                   
  *  *  *    *             
   * * *    *    * *       
  * *** *   *  *  *  *   *
   * * *   *    * * *    *
  *  *  *  *   * *** *  *    
 *  * *   *     * * *   *     
*         *    *  *  * *      
*                * *   *     
',
#234567890123456789012345678901234567890 - icon 24
'

              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
      *                 *  *         
      *  *  *  *  *          *          
  *  *   *   * * *     *  * *  *
 *   *  *   * *** *         *  *    
 *      *    * * *   *  *  *  *
*      *    *  *  *        *    
*  *   *      * *   *  *  *  
   *  *                      *
  *       * *      *  *     *
  *   * *  *  *         *   * 
 *    *  * * *   *  *  *   *  
 *   *  * *** *        *   *  
*    *   * * *  *  *  *   *
    *   *  *  *       *     
    *     * *  *  *  *       
',
#234567890123456789012345678901234567890 - icon 25
'





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
       *    *    *    *    *         
                             
       *    *    *    *    * 
                           
     *    *    *    *    *  
                           
     *    *    *    *    *  
                           
    *         *        *   
                                             
                      
',
#234567890123456789012345678901234567890 - icon 26
'




              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
     *     *     *     *     *         
        *     *     *     *      
     *     *     *     *     * 
        *     *     *     *    
     *     *     *     *     *  
        *     *     *     *   
     *     *     *     *     *  
        *     *     *     *   
     *     *     *     *     *   
        *     *     *     *    
                       
                      
',
#234567890123456789012345678901234567890 - icon 27
'





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
         *   *  *   *     *   *
     *     *   * *    * *
     * *     * *   *    *  * *
    *    * *  * *  *   *
    * *  *    *   * *  *  * *
   *    *  * *  * *    *    *
   *         *        *    *
  *  *   *  *   *  *  *  * *                    
',
#234567890123456789012345678901234567890 - icon 28
'





              ****
           ****  ****
        ****        **
       **            **
      **              **
     **                ** ***
     *                  *** **
  ****                   *   **
 **                           *
**                            **
*                              ***
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
       *    *    *    *     *
    *  *    *    *    * *   *
    * *    *  * * *  *  *  *
   *  * *  * *  * *  * *   *
   * *  * *  * * *  *  *  *  *
  *  * *  * *  * *  *  *  *  *
  * *  *    *   *  *  *  *  *
 *    *    *    *     *     *
',
#234567890123456789012345678901234567890 - icon 29
'
                  *       *        *
                   *      *       *
                   *      *       *
                    *     *      *
                                *
              ****     *******
           ****  **** *********
        ****        ************     **
       **            ************  **
      **              ***********
     **                **********
     *                  *** *****
  ****                   *   ****
 **                           *** *
**                            ***  **
*                              ***   **
*                                **
*                                 *
**                               **
 ***                            **
   ******************************
       *    *    *    *     *
    *  *    *    *    * *   *
    * *    *  * * *  *  *  *
   *  * *  * *  * *  * *   *
   * *  * *  * * *  *  *  *  *
  *  * *  * *  * *  *  *  *  *
  * *  *    *   *  *  *  *  *
 *    *    *    *     *     *
',
#234567890123456789012345678901234567890 - icon 30 Frigid - Thanks Yannzola
'


    *****                 *
   **   **                *
   *     *            *   *   *
   * *** *            *** * ***
   * *   *         *    *****    *
   * **  *         *     ***     *
   * *   *         *      *      *
   * *** *    ***  *      *      *  ***
   * *   *      ****      *      ****
   * **  *        ***     *      **
   * *   *      *** ***   *   *** ***
   * *** *    ***     *** * ***     ***
   * *   *              *****
   * **  *               ***
   * *   *              *****
   * *** *    ***     *** * ***     ***
   * *   *      *** ***   *   *** ***
   * **  *        ***     *     ***
   * *   *      ****      *      ****
   * *** *    ***  *      *      *  ***
  ** *** **        *      *      *
  * ***** *        *     ***     *
  * ***** *        *    *****    *
  * ***** *           *** * ***
  ** *** **           *   *   *
   **   **                *
    *****                 *
',
#234567890123456789012345678901234567890 - icon 31 HOT - Thanks Yannzola
'

                         *
    *****                *
   **   **               *
   *     *    *          *          *
   * *** *     *         *         *
   * *   *      *        *        *
   * *** *       *               *
   * *** *        *    *****    *
   * *** *           *********
   * *** *          ***********
   * *** *         *************
   * *** *         *************
   * *** *        ***************
   * *** *        ***************
   * *** * ****** *************** ******
   * *** *        ***************
   * *** *        ***************
   * *** *         *************
   * *** *         *************
   * *** *          ***********
   * *** *           *********
  ** *** **       *    *****    *
  * ***** *      *               *
  * ***** *     *        *        *
  * ***** *    *         *         *
  ** *** **   *          *          *
   **   **               *
    *****                *
                         *
',
#234567890123456789012345678901234567890 - icon 32 Dust - Thanks Yannzola
'

                 *******
                **     **
               **  *    *
               *        **
          ****** *  *    *
         **            * *
        **         *     *****
        *    *   *   *       **
        *  *             *    **
    *****                   *  *
   **        *   ******  *     *
  **   *  *     **    **       *
  *            **      **      *
  *       *  * *   *    *  *****
  *  *  *      *        ****   **
  *         ****    *           **
  **   *   **     *    *  *   *  *
   ***    **  *             *    *
     ******           *   *      ****
          *     * *           *     **
          **            *            **
           ***      *     *       *   *
             ******          *        *
                  *    *        *    **
                  *  *     ****    ***
                  **   *  **  ******
                   **    **
                    ******
',
#234567890123456789012345678901234567890 - icon 33 Fog - Thanks Yannzola
'
   ***********************************



   ***********************************



   ***********************************
                *********
               ***********

   ***********************************
             ***************
             ***************

   ***********************************
             ***************
   ***********************************

   ***********************************
                *********
   ***********************************

   ***********************************

   ***********************************

   ***********************************

   ***********************************
');

my $TWClogo = '
       ************************
       ************************
       ************************
       ************************
       ************************
       ************************
       *    *******************
       ** *  *** **************
       ** * * *   *************
       ** * * * ***************
       ** * * **  *************
       ************************
       * * * ****** ** ********
       * * * * *  *  *  ** *  *
       * * *    **  ** *     **
       ** * * **    ** *  ** **
       ** * **       * * *   **
       ************************
       **   **************** **
       * **  *  *   *   * ** **
       * ** * **  * * *    * **
       * ** *     * * *  *** **
       **   *     * * * *  ** *
       ************************



            * *
* * * * ** *****   *  **   **  * ** *
* * ****  * * * * *** *   *   * ** * *
** ***  *** * * * *   *   *   * ** * *
 * *  ***** *** *  ** * ** **  * * * *
';

our %mapping = ('arrow_up' => 'up',
					'arrow_right' => 'right',
					'arrow_left' => 'left',
					'knob_right' => 'up',
					'knob_left' => 'down',
					'knob_right.repeat' => 'up',
					'knob_left.repeat' => 'down',
					'add.single' => 'refresh',
					'arrow_down' => 'down',
					'arrow_down.hold' => 'down.hold',
					'fwd' => 'wnext',
					'rew' => 'wprev',
					'knob' => 'done',
					'size.hold'  => 'size.hold');

sub getTWCCity {  #Set up Async HTTP request for The Weather Channel's explicit location jjj
	my $city = shift;
#	my $timerObj = shift; #Should be undef
	my $client = undef;
	my $refreshItem = undef;
	my $url = 'http://www.weather.com/weather/today/' . $city;
	my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotTWCCity,
							  \&gotErrorViaHTTP,
							  {caller => 'getTWCCity',
							   callerProc => \&getTWCCity,
							   client => $client,
							   refreshItem => $refreshItem});
	$log->info("async request: $url");
	
	$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0',
	'Accept-Language' => 'en-us,en;q=0.5',
	'Accept' => 'text/html',
	'Accept-Charset' => 'UTF-8');
}

sub gotTWCCity {  #TWC city was received jjj
	my $http = shift;

#	my $params = $http->params();
#	my $client = $params->{'client'};
#	my $refreshItem = $params->{'refreshItem'};

	$log->info("in gotTWCCity got " . $http->url());

	my $content = $http->content();

# these are the two refs found - who knows which, if either, will be reliable ...
#	Drupal.settings.twc.contexts.loc.id = 'ASXX0023:1:AS';
#	window.explicit_location = "ASXX0023:1:AS";

	$content =~ /window\.explicit_location = "(.*?)";/;
	$twccity = $1;
}


##################################################
### Super Functions ###
##################################################
sub initPlugin {
	my $class = shift;
	$class->SUPER::initPlugin();
	
	$log->info("Initializing $VERSION.");

	Plugins::SuperDateTime::Settings->new;
	Plugins::SuperDateTime::PlayerSettings->new;

	Slim::Buttons::Common::addSaver('SCREENSAVER.superdatetime', 
	                                 getScreensaverSuperDatetime(), 
	                                 \&setScreensaverSuperDateTimeMode,
	                                 \&leaveScreensaverSuperDateTimeMode,
	                                 getDisplayName()
	                               );

	Slim::Hardware::IR::addModeDefaultMapping('SCREENSAVER.superdatetime',\%mapping);
	Slim::Hardware::IR::addModeDefaultMapping('OFF.superdatetime',\%mapping);

	# Get previous settings or set default
	if ($prefs->get('city') eq '') {
		$prefs->set('city','60614'); #Default to Chicago... cuz Chicago is where it's at!
	}
    # who knows how this will go! jjj
	if ($twccity eq '') {
		getTWCCity($prefs->get('city'));
	}

	#Not everyone will need weather icons - default disabled
	if ($prefs->get('getWeatherImgs') eq '') {
		$prefs->set('getWeatherImgs',0);
	}

	if ($prefs->get('stock1format') eq '') {
		$prefs->set('stock1format','%n');
	}

	if ($prefs->get('stock2format') eq '') {
		$prefs->set('stock2format','%l %c %z %v');
	}

	if ($prefs->get('refresh') eq '') {
		$prefs->set('refresh','10');
	}

	if ($prefs->get('time') eq '') {
		$prefs->set('time', $showtime);
	}

	if ($prefs->get('score') eq '') {
		$prefs->set('score', $showgame);
	}

	if ($prefs->get('atime') eq '') {
		$prefs->set('atime', $showactivetime);
	}

	if ($prefs->get('ascore') eq '') {
		$prefs->set('ascore', $showactivegame);
	}

	if ($prefs->get('offset') eq '') {
		$prefs->set('offset', '00');
	}

	if ($prefs->get('temperature') eq '') {
		$prefs->set('temperature', 0);
	}

	if ($prefs->get('windunit') eq '') {
		$prefs->set('windunit', 0);
	}

	if ($prefs->get('teamlogos') eq '') {
		$prefs->set('teamlogos', 2);
	}

	if ($prefs->get('lweather') eq '') {
		$prefs->set('lweather', 1);
	}

	if ($prefs->get('drawEachDelay') eq '') {
		$prefs->set('drawEachDelay', .5);
	}

	if ($prefs->get('lalerts') eq '') {
		$prefs->set('lalerts', 1);
	}
	
	if ($prefs->get('cbballconf') eq '') {
		$prefs->set('cbballconf', 0);
	}

	if ($prefs->get('cfballconf') eq '') {	
		$prefs->set('cfballconf', 0);
	}

	if ($prefs->get('errorCountMax') eq '') {	
		$prefs->set('errorCountMax', 10);
	}

	$showtime = $prefs->get('time');
	$showactivetime = $prefs->get('atime');

	$showgame = $prefs->get('score');
	$showactivegame = $prefs->get('ascore');
	
	@MLBteams = @{ $prefs->get('mlb') || [] };
	if (scalar(@MLBteams) == 0) {
		$prefs->set('mlb', \@MLBteams);
    }

	@NBAteams = @{ $prefs->get('nba') || [] };
	if (scalar(@NBAteams) == 0) {
		$prefs->set('nba', \@NBAteams);
    }

	@NHLteams = @{ $prefs->get('nhl') || [] };
	if (scalar(@NHLteams) == 0) {
		$prefs->set('nhl', \@NHLteams);
    }

	@NFLteams = @{ $prefs->get('nfl') || [] };
	if (scalar(@NFLteams) == 0) {
		$prefs->set('nfl', \@NFLteams);
	}

	@CBBteams = @{ $prefs->get('cbb') || [] };
	if (scalar(@CBBteams) == 0) {
		$prefs->set('cbb', \@CBBteams);
	}

	@CFBteams = @{ $prefs->get('cfb') || []};
	if (scalar(@CFBteams) == 0) {
		$prefs->set('cfb', \@CFBteams);
	}
	
	#        |requires Client
	#        |  |is a Query
	#        |  |  |has Tags
	#        |  |  |  |Function to call
	#        C  Q  T  F
	Slim::Control::Request::addDispatch(['SuperDateTime', '_mode'],
        	  [1, 1, 1, \&cliQuery]);

	Slim::Control::Request::addDispatch(['sdtMacroString'],
        	  [1, 1, 1, \&macroString]);

	Slim::Control::Request::addDispatch(['sdtVersion'],
        	  [1, 1, 1, \&sdtVersion]);
	
	#Experimental
	Slim::Control::Request::addDispatch(['SuperDateTimeState', 'dataRefreshState'],[0, 1, 0, undef]);
	
	Slim::Control::Request::addDispatch(['sdtTop'],[1, 1, 0, \&sdtTop]);
	Slim::Control::Request::addDispatch(['sdtCurrent'],[1, 1, 0, \&sdtCurrent]);
	Slim::Control::Request::addDispatch(['sdtForecast'],[1, 1, 0, \&sdtForecast]);
	Slim::Control::Request::addDispatch(['sdtForecastDetail','_forecastNum'],[1, 1, 0, \&sdtForecastDetail]);
	Slim::Control::Request::addDispatch(['sdt10day'],[1, 1, 0, \&sdt10day]);
	Slim::Control::Request::addDispatch(['sdtScores'],[1, 1, 0, \&sdtScores]);
	Slim::Control::Request::addDispatch(['sdtStocks'],[1, 1, 0, \&sdtStocks]);
	Slim::Control::Request::addDispatch(['sdtStockDetail','_ticker'],[1, 1, 0, \&sdtStockDetail]);
	Slim::Control::Request::addDispatch(['sdtGameList','_sport'],[1, 1, 0, \&sdtGameList]);
	
	my @menu = ({
		text   => 'SuperDateTime',
		'icon-id' => 'plugins/SuperDateTime/html/images/32.png',
		id     => 'pluginSuperDateTime',
		weight => 15,
		actions => {
				go => {
					player => 0,
					cmd	 => [ 'sdtTop' ],
				}
		},
	});

	Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 75, \&duetCheck);
	Slim::Control::Jive::registerPluginMenu(\@menu, 'extras');

	#Check to see if weather icons are enabled
	if ($prefs->get('getWeatherImgs') == 1) {
		Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 5, \&getWeatherMapList, 'Local', 0);
	}
}

sub sdtTop {
	my $request = shift;
	my $client = $request->client();
	my @menu = ();

	duetCheck(); #If we're in here there must be a duet-like device connected...

	push @menu, {
		text => 'Current Conditions',
		window => { menuStyle => 'album' },
        actions  => {
          go  => {
              player => 0,
              cmd    => [ 'sdtCurrent' ],
              params => {
              	menu => 'sdtCurrent',
              },
          },
        },
	};
	
	push @menu, {
		text => 'Forecast',
		window => { menuStyle => 'album' },
        actions  => {
          go  => {
              player => 0,
              cmd    => [ 'sdtForecast' ],
              params => {
              	menu => 'stdForecast',
              },
          },
        },
	};
	
	push @menu, {
		text => '10-Day Forecast',
		window => { menuStyle => 'album' },
        actions  => {
          go  => {
              player => 0,
              cmd    => [ 'sdt10day' ],
              params => {
              	menu => 'sdt10day',
              },
          },
        },
	};	
	
	push @menu, {
		text => 'Scores',
		window => { menuStyle => 'album' },
        actions  => {
          go  => {
              player => 0,
              cmd    => [ 'sdtScores' ],
              params => {
              	menu => 'sdtScores',
              },
          },
        },
	};
	
	push @menu, {
		text => 'Stocks',
		#window => { menuStyle => 'album' },
        actions  => {
          go  => {
   			  player => 0,
              cmd    => [ 'sdtStocks' ],
              params => {
              	menu => 'sdtStocks',
              },
          },
        },
	};
	
	my $numitems = scalar(@menu);
	
	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachPreset (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachPreset);
		$cnt++;
	}
	
	$request->setStatusDone();
}

sub duetCheck {
	#Look for any players that don't have a screen.  This implies they probably have a Duet that they want to utilize the plugin with
	#Duets are always active, so update plugin accordingly
	my @players = Slim::Player::Client::clients();
	if ($activeClients == 0) {
		$log->info("No active SDT clients so checking for duet only configuration.");
		for my $player (@players) {
			if ($player->display->isa('Slim::Display::NoDisplay')) {
					$activeClients++;
					Slim::Utils::Timers::killTimers(undef, \&refreshData); #Paranoia check
					Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 5, \&refreshData, $player, -1);
					$log->info("Non-display player found, configuring SDT to always refresh data.");
			}
		}
	}
}

sub sdt10day {
	my $request = shift;
	my $client = $request->client();
	
	my @menu = ();
	my $i=1;
	
	my $ForC;
	if ($prefs->get('temperature') == 1) {  #Cel
		$ForC = 'C';
	}
	else {
		$ForC = 'F';
	}
	
	while ($i <11) {
		push @menu, {
#			'icon-id' => 'plugins/SuperDateTime/html/images/'.$wetData{'d'.$i}{'forecastIcon'}.'_52x52_p.gif',
			'icon-id' => 'plugins/SuperDateTime/html/images/'.$wetData{'d'.$i}{'forecastIcon'}.'.png',
			text => $wetData{'d'.$i}{'day'}. '. '. $wetData{'d'.$i}{'date'}."\n".
				$wetData{'d'.$i}{'high'.$ForC} . '°/' .$wetData{'d'.$i}{'low'.$ForC} . '° Precip. ' . $wetData{'d'.$i}{'precip'} . "\n".
				$wetData{'d'.$i}{'condition'},
		};

		$i++;
	}
	
	my $numitems = scalar(@menu);
	
	$request->addResult("base", {window => { titleStyle => 'album' }});	
	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachPreset (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachPreset);
		$cnt++;
	}
	
	$request->setStatusDone();
}

sub sdtStocks {
	my $request = shift;
	my $client = $request->client();
	
	my @menu = ();
	
	for my $key (keys %{%miscData->{'stocks'}} ) {
		push @menu, {
			text => $miscData{'stocks'}{$key}{'ticker'}. ' - '.
						$miscData{'stocks'}{$key}{'lasttrade'}. ' ('.$miscData{'stocks'}{$key}{'change'}. ')',
         actions  => {
           go  => {
               player => 0,
               cmd    => [ 'sdtStockDetail', $key ],
               params => {
               	menu => 'nowhere',
               },
           },
         },
		};				
	}
	
	my $numitems = scalar(@menu);
	
	#$request->addResult("base", {window => { titleStyle => 'album' }});	
	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachPreset (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachPreset);
		$cnt++;
	}
	
	$request->setStatusDone();
}

sub sdtStockDetail {
	my $request = shift;
	my $client = $request->client();
	my $ticker = $request->getParam('_ticker');

	my @menu = ();
	
	push @menu, {
		text => $miscData{'stocks'}{$ticker}{'name'}
		,
	};

	push @menu, {
		text => 	'Open: '.$miscData{'stocks'}{$ticker}{'open'}
		,
	};

	push @menu, {
		text => 	'Last: '.$miscData{'stocks'}{$ticker}{'lasttrade'} . ' ('.$miscData{'stocks'}{$ticker}{'change'}.')'
		,
	};

	push @menu, {
		text =>	'Range: '.$miscData{'stocks'}{$ticker}{'low'}. ' - '.$miscData{'stocks'}{$ticker}{'high'}
		,
	};

	push @menu, {
		text => 	'Volume: '.$miscData{'stocks'}{$ticker}{'volume'}
		,
	};

	push @menu, {
		text => 	$miscData{'stocks'}{$ticker}{'lasttime'}.' '.$miscData{'stocks'}{$ticker}{'lastdate'}
		,
	};

	my $numitems = scalar(@menu);

	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachItem (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachItem);
		$cnt++;
	}
	$request->setStatusDone();
}

sub sdtForecast {
	my $request = shift;
	my $client = $request->client();
	
	my @menu = ();
	my $i = 0;

	my $ForC;
	if ($prefs->get('temperature') == 1) {  #Cel
		$ForC = 'C';
	}
	else {
		$ForC = 'F';
	}
	
	while ($i <4) {	
		push @menu, {
			#'icon-id' => 'plugins/SuperDateTime/html/images/'.$wetData{$i}{'forecastIcon'}.'_52x52_p.gif',
			'icon-id' => 'plugins/SuperDateTime/html/images/'.$wetData{$i}{'forecastIcon'}.'.png',
			text => $wetData{$i}{'forecastTOD'}."\n".
				$wetData{$i}{'forecastType'} .' '. $wetData{$i}{'forecastTemp'.$ForC} . '° Precip. '. $wetData{$i}{'forecastPrec'} . "\n".
				$wetData{$i}{'skyCondition'},
         		actions  => {
         			  go  => {
         			      player => 0,
         			      cmd    => [ 'sdtForecastDetail', $i ],
         			      params => {
         			      menu => 'nowhere',
         		      	  },
         		},
         	},
		};
				
		$i++;
	}
		
	my $numitems = scalar(@menu);
	
	$request->addResult("base", {window => { titleStyle => 'album' }});	
	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachPreset (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachPreset);
		$cnt++;
	}
	
	$request->setStatusDone();
}

sub sdtForecastDetail {
	my $request = shift;
	my $client = $request->client();
	my $forecastNum = $request->getParam('_forecastNum');

	my @menu = ();
	
	push @menu, {
		text => $WETdisplayItems2[$forecastNum],
	};

	my $numitems = scalar(@menu);

	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachItem (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachItem);
		$cnt++;
	}
	$request->setStatusDone();
}

sub sdtCurrent {
	my $request = shift;
	my $client = $request->client();
	
	my @menu = ();

	my $ForC = '';
	if ($prefs->get('temperature') == 1) {  #Cel
		$ForC = 'C';
	}
	else {
		$ForC = 'F';
	}
	
	my $WindUnit = '';
	if ($prefs->get('windunit') == 0) {  #mi/hr
		$WindUnit = 'mh';
	}
	elsif ($prefs->get('windunit') == 1) {  #km/hr
		$WindUnit = 'kh';
	}
	elsif ($prefs->get('windunit') == 2) {  #kt/hr
		$WindUnit = 'kth';
	}
	else {  #m/s
		$WindUnit = 'ms';
	}
	
	push @menu, {
		#'icon-id' => 'plugins/SuperDateTime/html/images/'.$wetData{-1}{'forecastIcon'}.'_52x52_p.gif',
		'icon-id' => 'plugins/SuperDateTime/html/images/'.$wetData{-1}{'forecastIcon'}.'.png',
			  text => "$wetData{'temperature'.$ForC}°($wetData{'feelslike'.$ForC}°) $wetData{'windspeed_'.$WindUnit}"."\n".
						"$wetData{-1}{'forecastType'} $wetData{-1}{'forecastTemp'.$ForC}° Precip. $wetData{-1}{'forecastPrec'}" . "\n".
						$wetData{-1}{'skyCondition'}."\n".
						"Humidity: $wetData{'humidity'}"."\n".
						"Pressure: $wetData{'pressureIN'}$wetData{'pressureT'}"."\n".
						"Dewpoint: $wetData{'dewpointF'}°",
         actions  => {
           go  => {
               player => 0,
               cmd    => [ 'sdtForecastDetail', -1 ],
               params => {
               	menu => 'nowhere',
               },
           },
         },
	};
		
	my $numitems = scalar(@menu);
	
	$request->addResult("base", {window => { titleStyle => 'album' }});	
	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachItem (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachItem);
		$cnt++;
	}
	
	$request->setStatusDone();
}

sub sdtScores {
	my $request = shift;
	my $client = $request->client();
	
	my @menu = ();
	for my $key ( sort keys %sportsData ) {
		my $icon;
			
		$icon = $sportsData{$key}{'logoURL'};
		if (not defined $icon) {
			$icon = 'plugins/SuperDateTime/html/images/blank.png';
		}
		
		push @menu, {
				'icon-id' => $icon,
				text => $key,
				window => { menuStyle => 'album' },
				actions  => {
				           go  => {
	#7.3 menustyle=multiline to remove icons entirely
									player => 0,
				               cmd    => [ 'sdtGameList', $key ],
				               params => {
				               	menu => 'nowhere',
				               },
				           },
         },
		}
		
	}	
	
	my $numitems = scalar(@menu);
	
	$request->addResult("base", {window => { titleStyle => 'album' }});	
	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);

	my $cnt = 0;
	for my $eachItem (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachItem);
		$cnt++;
	}
	
	$request->setStatusDone();
}

sub sdtGameList {
	my $request = shift;
	my $client = $request->client();
	my $sport = $request->getParam('_sport');

	my @menu = ();
	my $hashRef = \%sportsData;
	
	for my $key (sort keys %{$hashRef->{$sport}} ) {
		#print "$key => $value\n";
		if ($key ne 'logoURL') {
			my $logo = 'plugins/SuperDateTime/html/images/blank.png';
			if (defined $sportsData{$sport}{$key}{'gameLogoURL'}) {
				$logo = $sportsData{$sport}{$key}{'gameLogoURL'};
			}
		
			push @menu, {
				#'icon-id' => 'html/images/blank.png',
				'icon-id' => $logo,
				text => "$sportsData{$sport}{$key}{'awayTeam'} $sportsData{$sport}{$key}{'awayScore'} \n $sportsData{$sport}{$key}{'homeTeam'} $sportsData{$sport}{$key}{'homeScore'} \n $sportsData{$sport}{$key}{'gameTime'}",
			};
		}
	}	

	my $numitems = scalar(@menu);

	$request->addResult("count", $numitems);
	$request->addResult("offset", 0);
	my $cnt = 0;
	for my $eachItem (@menu[0..$#menu]) {
		$request->setResultLoopHash('item_loop', $cnt, $eachItem);
		$cnt++;
	}
	$request->setStatusDone();
}

sub FtoC {
	my $temp = shift;

	$temp = ($temp-32)*5/9;
	$temp = int($temp + .5 * ($temp <=> 0)); #Funky round	
	
	return $temp;
}

sub CtoF {
	my $temp = shift;

	$temp = ($temp*9/5)+32;
	$temp = int($temp + .5 * ($temp <=> 0)); #Funky round	
	
	return $temp;
}

sub getAverages {  #Set up Async HTTP request for averages
	my ($days_advance, $client, $refreshItem) = @_;

	if (!defined $days_advance) {
		$days_advance = 0;
	}

	if ($wetData{'0'}{'forecastTOD'} ne $averages{'last'}) { #See if the averages need to be refreshed due to a period change    
		my $dayNum = "";
		if ($days_advance > 0) {
			$dayNum = "?dayNum=$days_advance";
  		}

		my $url = 'http://www.weather.com/outlook/travel/businesstraveler/wxdetail/' . $prefs->get('city') . $dayNum;
  		# tomorrow ### http://www.weather.com/weather/wxdetail/95616?dayNum=1

  		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotAverages,
								\&gotErrorViaHTTP,
								{caller => 'getAverages',
								 dayNum => $days_advance,
								 client => $client,
								 refreshItem => $refreshItem});

		$log->info("async request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0',
			'Accept-Language' => 'en-us,en;q=0.5',
			'Accept' => 'text/html',
			'Accept-Charset' => 'UTF-8');
	}
	else {
		$log->debug("Skipping averages...");
		refreshData(undef, $client, $refreshItem);
	}
}

sub gotAverages {  #Average data was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
  	my $refreshItem = $params->{'refreshItem'};
  
	$log->info("got " . $http->url());
	my $dayNum = 0;

	if ($http->url() =~ m/\?dayNum=(\d+)/) {
		$dayNum = $1;
	}

	my $content = $http->content();
	  
	if ($content =~ m/Avg. High:<\/TD>.*?<B>(-?\d+)\&deg\;(F|C)<\/B><\/TD>/s) {
		$averages{$dayNum}{'average_high_F'} = $1;
	}
	else {
		$averages{$dayNum}{'average_high_F'} = '';
	}

	if ($content =~ m/Record High:<\/TD>.*?<B>(-?\d+)\&deg\;(F|C) \((\d+)\)<\/B><\/TD>/s) {
		$averages{$dayNum}{'record_high_F'} = $1;
		$averages{$dayNum}{'record_high_year'} = $3;
	}
	else {
		$averages{$dayNum}{'record_high_F'} = 'NA';
		$averages{$dayNum}{'record_high_year'} = 'NA';	
	}
  
	if ($content =~ m/Avg. Low:<\/TD>.*?<B>(-?\d+)\&deg\;(F|C)<\/B><\/TD>/s) {
		$averages{$dayNum}{'average_low_F'} = $1;
	}
	else {
		$averages{$dayNum}{'average_low_F'} = 'NA';
	}
  
	if ($content =~ m/Record Low:<\/TD>.*?<B>(-?\d+)\&deg\;(F|C) \((\d+)\)<\/B>/s) {
		$averages{$dayNum}{'record_low_F'} = $1;
		$averages{$dayNum}{'record_low_year'} = $3;
	}
	else {
		$averages{$dayNum}{'record_low_F'} = 'NA';
		$averages{$dayNum}{'record_low_year'} = 'NA';	
	}
	
	if ($content =~ m/Sunrise:<\/TD>.*?<B>(\d+:\d+) (AM|PM).*<\/B>/s) {
		$averages{$dayNum}{'sunrise'} = "$1 $2";
	}
	else {
		$averages{$dayNum}{'sunrise'} = '';
	}
	
	if ($content =~ m/Sunset:<\/TD>.*?<B>(\d+:\d+) (AM|PM).*<\/B>/s) {
		$averages{$dayNum}{'sunset'} = "$1 $2";
	}
	else {
		$averages{$dayNum}{'sunset'} = '';
	}

	if ($dayNum == 0) { 
		#Set CURRENTLY as high values
			$wetData{-1}{'average_F'} = $averages{0}{'average_high_F'};
			$wetData{-1}{'average_C'} = FtoC($averages{0}{'average_high_F'});
				
			$wetData{-1}{'record_F'} = $averages{0}{'record_high_F'};
			$wetData{-1}{'record_C'} = FtoC($averages{0}{'record_high_F'});
			
			$wetData{-1}{'record_year'} = $averages{0}{'record_high_year'};
				
			$wetData{-1}{'sunrise'} = $averages{0}{'sunrise'};
			$wetData{-1}{'sunset'}  = $averages{0}{'sunset'};
		
		#Today's was received okay, let's get tomorrows
		getAverages(1, $client, $refreshItem);
	}
	else { #Just received tomorrow's averages
		for (my $i = 0; $i <= 2; $i++) { #Update average info for each wetData period
			my $name = $wetData{$i}{'forecastTOD'};

			if ($name eq 'TODAY' || ($name eq 'NEXT 6HRS' && $wetData{1}{'forecastTOD'} eq 'TODAY')) {
				$wetData{$i}{'average_F'} = $averages{0}{'average_high_F'};
				$wetData{$i}{'average_C'} = FtoC($averages{0}{'average_high_F'});

				$wetData{$i}{'record_F'} = $averages{0}{'record_high_F'};
				$wetData{$i}{'record_C'} = FtoC($averages{0}{'record_high_F'});
			
				$wetData{$i}{'record_year'} = $averages{0}{'record_high_year'};
				
				$wetData{$i}{'sunrise'} = $averages{0}{'sunrise'};
				$wetData{$i}{'sunset'}  = $averages{0}{'sunset'};
			}
			elsif ($name eq 'TONIGHT' || ($name eq 'NEXT 6HRS' && $wetData{1}{'forecastTOD'} eq 'TONIGHT')) {
				$wetData{$i}{'average_F'} = $averages{0}{'average_low_F'};
				$wetData{$i}{'average_C'} = FtoC($averages{0}{'average_low_F'});
			
				$wetData{$i}{'record_F'} = $averages{0}{'record_low_F'};
				$wetData{$i}{'record_C'} = FtoC($averages{0}{'record_low_F'});
			
				$wetData{$i}{'record_year'} = $averages{0}{'record_low_year'};
				
				$wetData{$i}{'sunrise'} = $averages{0}{'sunrise'};
				$wetData{$i}{'sunset'}  = $averages{0}{'sunset'};				
			}
			elsif ($name eq 'TOMORROW') {
				$wetData{$i}{'average_F'} = $averages{1}{'average_high_F'};
				$wetData{$i}{'average_C'} = FtoC($averages{1}{'average_high_F'});
				
				$wetData{$i}{'record_F'} = $averages{1}{'record_high_F'};
				$wetData{$i}{'record_C'} = FtoC($averages{1}{'record_high_F'});
			
				$wetData{$i}{'record_year'} = $averages{1}{'record_high_year'};
				
				$wetData{$i}{'sunrise'} = $averages{1}{'sunrise'};
				$wetData{$i}{'sunset'}  = $averages{1}{'sunset'};				
			}
			else { #Non USA
				if ($wetData{1}{'forecastTOD'} eq 'TODAY') {
					$wetData{$i}{'average_F'} = $averages{0}{'average_high_F'};
					$wetData{$i}{'average_C'} = FtoC($averages{0}{'average_high_F'});

					$wetData{$i}{'record_F'} = $averages{0}{'record_high_F'};
					$wetData{$i}{'record_C'} = FtoC($averages{0}{'record_high_F'});
			
					$wetData{$i}{'record_year'} = $averages{0}{'record_high_year'};
				
					$wetData{$i}{'sunrise'} = $averages{0}{'sunrise'};
					$wetData{$i}{'sunset'}  = $averages{0}{'sunset'};
				}
				else {
					$wetData{$i}{'average_F'} = $averages{0}{'average_low_F'};
					$wetData{$i}{'average_C'} = FtoC($averages{0}{'average_low_F'});
			
					$wetData{$i}{'record_F'} = $averages{0}{'record_low_F'};
					$wetData{$i}{'record_C'} = FtoC($averages{0}{'record_low_F'});
			
					$wetData{$i}{'record_year'} = $averages{0}{'record_low_year'};
				
					$wetData{$i}{'sunrise'} = $averages{0}{'sunrise'};
					$wetData{$i}{'sunset'}  = $averages{0}{'sunset'};								
				}
			}
		}
	
		$averages{'last'} = $wetData{'0'}{'forecastTOD'}; #update last average update indicator
		refreshData(undef, $client, $refreshItem);
	}
}

sub getLongWeatherTxt {  #Set up Async HTTP request for long weather forecasts
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;

	#Using the averages last updated reference, I suppose if averages fails this will keep refreshing or if this fails it wont know to refresh...
	if ($wetData{'0'}{'forecastTOD'} ne $averages{'last'}) { #See if the averages & 10day need to be refreshed due to a period change    
		my $url = 'http://www.weather.com/outlook/travel/businesstraveler/narrative/' . $prefs->get('city');

  		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotLongWeatherTxt,
								\&gotErrorViaHTTP,
								{caller => 'getLongWeatherTxt',
								 client => $client,
								 refreshItem => $refreshItem});

		$log->info("async request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("Skipping long weather...");
		refreshData(undef, $client, $refreshItem);
	}
}

sub gotLongWeatherTxt {  #Long weather data was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
  	my $refreshItem = $params->{'refreshItem'};
  
	$log->info("got " . $http->url());
	my $content = $http->content();

	my $tree = HTML::TreeBuilder->new; # empty tree
	
	$tree->parse($content);
	$tree->eof();
	
	my @period = $tree->look_down( "_tag", "td", "class", "inDentA" );
	my @periodTxt = $tree->look_down( "_tag", "td", "class", "lapDataRow" );

	my $outcome_txt;
	if (scalar @period != 0) {
		#Hold onto 0 value
		my $wet1 = $WETdisplayItems1[0];
		my $wet2 = $WETdisplayItems2[0];

		@WETdisplayItems1 = ();  # Reset long weather text.  Make sure new text is displayed.
		@WETdisplayItems2 = ();  # Reset long weather text.  Make sure new text is displayed.
	
		#Bring back 0 value
		if ($wet1 ne '') { #It'll be blank for international
			$WETdisplayItems1[0] = $wet1;
			$WETdisplayItems2[0] = $wet2;
		}
		
		#for(my $i=0; $i < scalar @period; $i++) {
		for(my $i=0; $i < 5; $i++) {
			$outcome_txt = $period[$i]->as_HTML;
			if ($outcome_txt =~ m/dayNum=\d">(.*)<\/a/) {
				push(@WETdisplayItems1, $1);
			}
  
		  	$outcome_txt = $periodTxt[$i]->as_HTML;
		  	if ($outcome_txt =~ m/%">(.*)<\/td/) {
		  		push(@WETdisplayItems2, localizeLongWeather($1));
			}
		}
	}
	else {
		$log->warn('Unable to parse long weather text.');
	}
	
	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);
}

sub drawEach {
	$log->debug("Start");
	my ($timerObj, $client, $period, $formatLoc) = @_;
	    #^Should be undef
	
	my $destLoc = 0;
	
	if (defined $displayInfoBuild{$client}{'TOPdisplayItems1'}) {
		$destLoc = scalar @{$displayInfoBuild{$client}{'TOPdisplayItems1'}};
	}
	
	$log->debug("Drawing scrn $destLoc $client $period");
	
	my @show1icon  = @{ $prefs->client($client)->get('show1icon') || [] };
	my @show13line = @{ $prefs->client($client)->get('show13line') || [] };
	my @d3line1t   = @{ $prefs->client($client)->get('v3line1t') || [] };
	my @d3line1m   = @{ $prefs->client($client)->get('v3line1m') || [] };
	my @d3line1b   = @{ $prefs->client($client)->get('v3line1b') || [] };
	my @d1period   = @{ $prefs->client($client)->get('v1period') || [] };
	my @weatherformat1t = @{ $prefs->client($client)->get('weatherformat1t') || [] };
	my @weatherformat1b = @{ $prefs->client($client)->get('weatherformat1b') || [] };
	my @weatherformat2t = @{ $prefs->client($client)->get('weatherformat2t') || [] };
	my @weatherformat2b = @{ $prefs->client($client)->get('weatherformat2b') || [] };
	
	clearCanvas($client);
	#$displayInfoBuild{$client}{'btmLinePreSpace'}[$destLoc] = '';
	
	#Draw icons
	if ($show1icon[$formatLoc] == 1) {
		drawIcon($client,0,$ymax{$client}-1, $Icons[$Iconmap{$wetData{$period}{'forecastIcon'}}]);		
		$displayInfoBuild{$client}{'hasIcon'}[$destLoc] = 1;
	}
	
	#Draw 3line stuff
	if ($show13line[$formatLoc] == 1) {
		my $line1 = uc(replaceMacrosPer($d3line1t[$formatLoc], $period, $client));
		my $line2 = uc(replaceMacrosPer($d3line1m[$formatLoc], $period, $client));
		my $line3 = uc(replaceMacrosPer($d3line1b[$formatLoc], $period, $client));		
	
		#Shorten HI/HIGH/LOW/Lo to gain screen real estate on Booms
		if($client->display->isa('Slim::Display::Boom')) {
			$line1 =~ s/^ LOW/LO/;
			$line1 =~ s/^HIGH/HI/;
			$line1 =~ s/^RAIN/RN/;
			$line1 =~ s/^SNOW/SN/;
			$line1 =~ s/^PREC/PR/;
			$line2 =~ s/^ LOW/LO/;
			$line2 =~ s/^HIGH/HI/;
			$line2 =~ s/^RAIN/RN/;
			$line2 =~ s/^SNOW/SN/;
			$line2 =~ s/^PREC/PR/;
			$line3 =~ s/^ LOW/LO/;
			$line3 =~ s/^RAIN/RN/;
			$line3 =~ s/^SNOW/SN/;
			$line3 =~ s/^PREC/PR/;
			$line3 =~ s/^High/HI/;
		}
	
		if ($show1icon[$formatLoc] == 1) {
			drawText($client,42,$ymax{$client}-25, $line3);
			drawText($client,42,$ymax{$client}-13, $line2);
			drawText($client,42,$ymax{$client}-1,  $line1);
		}
		else {
			drawText($client,0,$ymax{$client}-25, $line3);
			drawText($client,0,$ymax{$client}-13, $line2);
			drawText($client,0,$ymax{$client}-1,  $line1);
		}

		#Save the character lengths of each line
		$displayInfoBuild{$client}{'CharLen1'}[$destLoc] = length($line1);
		$displayInfoBuild{$client}{'CharLen2'}[$destLoc] = length($line2);
		$displayInfoBuild{$client}{'CharLen3'}[$destLoc] = length($line3);		
	}
	
	#If necessary can make the width calculation based on max length of 3line text
	$displayInfoBuild{$client}{'forecastG'}[$destLoc] = getFramebuf($client,$xmax{$client});
	
	push(@{$displayInfoBuild{$client}{'TOPdisplayItems1'}},  replaceMacrosPer($weatherformat1t[$formatLoc], $period, $client));	
	push(@{$displayInfoBuild{$client}{'BOTdisplayItems1'}},  replaceMacrosPer($weatherformat1b[$formatLoc], $period, $client));
	push(@{$displayInfoBuild{$client}{'TOPdisplayItems2'}}, replaceMacrosPer($weatherformat2t[$formatLoc], $period, $client));	
	push(@{$displayInfoBuild{$client}{'BOTdisplayItems2'}}, replaceMacrosPer($weatherformat2b[$formatLoc], $period, $client));
	#$log->debug("Pending draw each timers: " . Slim::Utils::Timers::pendingTimers(undef, \&drawEach));
		
	$drawEachPending--;
	
	if ($drawEachPending == 0) {
		doneDrawing($client);
	}
	
	$log->debug("Finish");
}

sub replaceMacros {
	my $string = shift;
	my $client = shift;

	for ($string) {
		#my $date = Slim::Utils::DateTime::longDateF(undef, preferences('plugin.datetime')->get('dateformat'));
		#Replace custom macros from other plugins. Do custom before default in case overriding
		for my $key ( keys %macroHash ) {
			$string =~ s/$key/$macroHash{$key}/;
	    	}		
		
		my $date = $client->longDateF();
		s/%2/$date/;
		
		s/%t/$wetData{'temperatureF'}°/;
		s/%T/$wetData{'temperatureC'}°/;
		s/%h/$wetData{'humidity'}/;
		s/%p/$wetData{'pressureIN'}$wetData{'pressureT'}/;
		s/%P/$wetData{'pressureMB'}$wetData{'pressureT'}/;
		s/%d/$wetData{'dewpointF'}°/;
		s/%D/$wetData{'dewpointC'}°/;
		s/%f/$wetData{'feelslikeF'}°/;
		s/%F/$wetData{'feelslikeC'}°/;
		s/%w/$wetData{'windspeed_mh'}/;
		s/%W/$wetData{'windspeed_kh'}/;
		s/%q/$wetData{'windspeed_kth'}/;
		s/%Q/$wetData{'windspeed_ms'}/;		
		s/%u/$wetData{'UVindexNum'}/;
		s/%U/$wetData{'UVindexTxt'}/;
		s/%b/$wetData{'rain'}/;
		s/%B/$wetData{'snow'}/;

		#Wunderground
		s/%e/$wetData{'wu_temperatureF'}°/;
		s/%r/$wetData{'wu_temperatureFr'}°/;
		s/%E/$wetData{'wu_temperatureC'}°/;
		s/%R/$wetData{'wu_temperatureCr'}°/;
		s/%H/$wetData{'wu_humidity'}/;
		s/%l/$wetData{'wu_pressureIN'}/;
		s/%L/$wetData{'wu_pressureMB'}/;
		s/%m/$wetData{'wu_dewpointF'}°/;
		s/%M/$wetData{'wu_dewpointC'}°/;
		s/%j/$wetData{'wu_windspeed_mh'}/;
		s/%J/$wetData{'wu_windspeed_kh'}/;
		s/%k/$wetData{'wu_windspeed_kth'}/;
		s/%K/$wetData{'wu_windspeed_ms'}/;		
	}

	return $string;
}

sub replaceMacrosPer {
	my $string  = shift;
	my $location = shift;
	my $client = shift;

	$string = replaceMacros($string, $client);

	for ($string) {
		s/%a/$wetData{$location}{'average_F'}°/;
		s/%A/$wetData{$location}{'average_C'}°/;
		s/%c/$wetData{$location}{'record_F'}°/;
		s/%C/$wetData{$location}{'record_C'}°/;
		s/%g/$wetData{$location}{'record_year'}/;
		s/%s/$wetData{$location}{'sunrise'}/;
		s/%S/$wetData{$location}{'sunset'}/;

		s/%z/$wetData{$location}{'forecastType'} $wetData{$location}{'forecastTempF'}°/;
		s/%Z/$wetData{$location}{'forecastType'} $wetData{$location}{'forecastTempC'}°/;
		s/Low/ Low/;

		s/%x/$wetData{$location}{'forecastPrec'}/;
		
		#if ($location != -1) { #Make sure it's not a special "currently" case
			s/%y/$wetData{$location}{'forecastTOD'}/;
			s/%v/$wetData{$location}{'skyCondition'}/;
		#}
		#else { #Current conditions
		#	s/%y/Currently/;
		#	s/%v/$wetData{'-1'}{'skyCondition'}/;		
		#}
		
		#10day stuff
		s/%_3/$wetData{$location}{'day'}/;
		s/%_4/$wetData{$location}{'date'}/;
		s/%_5/$wetData{$location}{'highF'}°/;
		s/%_6/$wetData{$location}{'highC'}°/;
		s/%_7/$wetData{$location}{'lowF'}°/;
		s/%_8/$wetData{$location}{'lowC'}°/;
		s/%_9/$wetData{$location}{'precip'}/;
		s/%_0/$wetData{$location}{'condition'}/;
	}		

	return $string;
}


sub getWeatherToday {  #Set up Async HTTP request for Weather
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	# jjj
	my $url = 'http://dsx.weather.com/wxd/v2/MORecord/en_US/' . $twccity;
#	my $url = 'http://www.weather.com/weather/today/' . $prefs->get('city');
	my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotWeatherToday,
							  \&gotErrorViaHTTP,
							  {caller => 'getWeatherToday',
							   callerProc => \&getWeatherToday,
							   client => $client,
							   refreshItem => $refreshItem});
	$log->info("async request: $url");
	
	$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0',
	'Accept-Language' => 'en-us,en;q=0.5',
	'Accept' => 'text/html',
	'Accept-Charset' => 'UTF-8');
}

sub gotWeatherToday {  #Weather data for today was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
	my $tree = HTML::TreeBuilder->new; # empty tree
	$tree->parse($content);
	$tree->eof();
	my $outcome_txt = '';

	my $json = decode_json $http->content();
	my $modata = $json->{'MOData'};

	# assuming all or notihng
	if ($modata->{'tmpF'} eq '') {
		$status = '-';
		$log->warn('Error parsing weather today');
	}

	$wetData{-1}{'forecastTOD'} = 'Right Now';
	
	$wetData{'temperatureF'} = $modata->{'tmpF'};
	$wetData{'temperatureC'} = $modata->{'tmpC'};
	$wetData{'feelslikeF'} = $modata->{'flsLkIdxF'};
	$wetData{'feelslikeC'} = $modata->{'flsLkIdxC'};
	$wetData{'windspeed_mh'} = $modata->{'wDirAsc'} . $modata->{'wSpdM'};
	$wetData{'windspeed_kh'} = $modata->{'wDirAsc'} . $modata->{'wSpdK'};
	$wetData{'windspeed_kth'} = $modata->{'wDirAsc'} . $modata->{'wSpdKn'};
	$wetData{'windspeed_ms'} = $modata->{'wSpdM'}*16.09344/36;
	$wetData{'windspeed_ms'} = int($wetData{'windspeed_ms'} + .5 * ($wetData{'windspeed_ms'} <=> 0)); #Funky round
	$wetData{'windspeed_ms'} = $modata->{'wDirAsc'} . $wetData{'windspeed_ms'};
	$wetData{'skyCondition'} = $modata->{'wx'};
	$wetData{'dewpointF'} = $modata->{'dwptF'};
	$wetData{'dewpointC'} = $modata->{'dwptC'};
	$wetData{'pressureIN'} = $modata->{'alt'};
	$wetData{'pressureMB'} = $modata->{'alt'} * 33.8639;
	$wetData{'pressureMB'} = int($wetData{'pressureMB'} + .5 * ($wetData{'pressureMB'} <=> 0)); #Funky round			
	$wetData{'pressureT'} = '~' if $modata->{'baroTrnd'} == 0;
	$wetData{'pressureT'} = '+' if $modata->{'baroTrnd'} == 1;
	$wetData{'pressureT'} = '-' if $modata->{'baroTrnd'} == 2;
	$wetData{'humidity'} = $modata->{'rH'} . '%';
	$wetData{'UVindexNum'} = $modata->{'uvIdx'};
	$wetData{'UVindexTxt'} = $modata->{'uvDes'};

	# not currently supporting these here - seem to be all forecast stuff
	# which isn't in the MO record jjj
#	$wetData{$i-1}{'forecastIcon'} = $2;
#	$wetData{$i-1}{'forecastIconURLSmall'} = '/plugins/SuperDateTime/html/images/' . $2 . '.png';
#	push(@WETdisplayItems1temp, $wetData{-1}{'forecastTOD'});
#	push(@WETdisplayItems2temp, localizeLongWeather($outcome_txt->as_text));
#	$wetData{1}{'forecastPrec'} = 'SNOW ' . $1;
#	$wetData{-1}{'forecastPrec'} = 'SNOW ' . $1;
#	$wetData{1}{'forecastPrec'} = 'RAIN ' . $1;
#	$wetData{-1}{'forecastPrec'} = 'RAIN ' . $1;
#	$wetData{1}{'forecastPrec'} = 'PREC ' . $1;
#	$wetData{-1}{'forecastPrec'} = 'PREC ' . $1;
#	$wetData{-1}{'forecastPrec'} = 'RAIN ' . $2;
#	$wetData{0}{'forecastPrec'} = 'RAIN '. $2;
#	$wetData{-1}{'forecastPrec'} = 'SNOW ' . $2;
#	$wetData{0}{'forecastPrec'} = 'SNOW '. $2;
#	$wetData{-1}{'forecastPrec'} = 'PREC ' . $2;
#	$wetData{0}{'forecastPrec'} = 'PREC '. $2;			
#	$wetData{0}{'forecastTOD'} = 'Observed Today';
#	$wetData{1}{'forecastTOD'} = 'Tonight';
#	$wetData{0}{'forecastTempF'} = $1;
#	$wetData{0}{'forecastType'} = 'High';
#	$wetData{0}{'forecastTempC'} = FtoC($1);
#	$wetData{-1}{'forecastTempF'} = $1;
#	$wetData{-1}{'forecastType'} = 'High';
#	$wetData{-1}{'forecastTempC'} = FtoC($1);
#	$wetData{1}{'forecastTempF'} = $1;
#	$wetData{1}{'forecastType'} = 'Low';
#	$wetData{1}{'forecastTempC'} = FtoC($1);
#	$wetData{-1}{'forecastTempF'} = $1;
#	$wetData{-1}{'forecastType'} = 'Low';
#	$wetData{-1}{'forecastTempC'} = FtoC($1);
#	$wetData{'rain'} = $1;
#	$wetData{'snow'} = $1;
#	push(@WETdisplayItems1temp, $1);
#	push(@WETdisplayItems2temp, localizeLongWeather($2));
#	push(@WETdisplayItems1temp, $1);
#	push(@WETdisplayItems2temp, localizeLongWeather($2));

	refreshData(undef, $client, $refreshItem);
}

sub getWeatherTomorrow {  #Set up Async HTTP request for Weather
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	my $url = 'http://www.weather.com/weather/tomorrow/' . $prefs->get('city');
	my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotWeatherTomorrow,
							  \&gotErrorViaHTTP,
							  {caller => 'getWeatherTomorrow',
							   callerProc => \&getWeatherTomorrow,
							   client => $client,
							   refreshItem => $refreshItem});
	$log->info("async request: $url");
	
	$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0',
	'Accept-Language' => 'en-us,en;q=0.5',
	'Accept' => 'text/html',
	'Accept-Charset' => 'UTF-8');
}

sub gotWeatherTomorrow {  #Weather data for tomorrow was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	$forecastNum =2;
	
	my $content = $http->content();

	my $tree = HTML::TreeBuilder->new; # empty tree
	$tree->parse($content);
	$tree->eof();

	my $outcome_txt = ($tree->look_down( "_tag", "div", "class", "wx-details"))[0];
	if ($outcome_txt) {
		if ($outcome_txt->as_text =~ m/Chance of (\w+):(.*%)W/) {
			if ($1 eq 'Snow') {
				$wetData{$forecastNum}{'forecastPrec'} = $1 . ' ' . $2;
			}
			else {
				$wetData{$forecastNum}{'forecastPrec'} = 'RAIN ' . $2;
			}
		}
		else {
			$status = '-';
			$log->warn('Error parsing tomorrow 1 rain/snow');			
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 1 rain/snow');
	}

	$outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-temp"))[0];
	if ($outcome_txt) {
		if ($outcome_txt->as_HTML =~ m/wx-temp\">\s?(\d+)<.*wx-label\">(\w+)<\/span>/) {
			$wetData{$forecastNum}{'forecastTempF'} = $1;
			$wetData{$forecastNum}{'forecastType'} = $2;
			$wetData{$forecastNum}{'forecastTempC'} = FtoC($1);
		}
		else {
			$status = '-';
			$log->warn('Error parsing tomorrow 1 hi/low');			
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 1 hi/low');
	}

	# For now lets assume it's always tomorrow and tomorrow night
	$wetData{$forecastNum}{'forecastTOD'} = 'TOMORROW';

	#note the extra trailing space...
	my $outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-phrase "))[0];
	if ($outcome_txt) {
		$wetData{$forecastNum}{'skyCondition'} = $outcome_txt->as_text;
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 1 sky conditions');
	}

	$outcome_txt = ($tree->look_down( "_tag", "img", "class", "wx-weather-icon"))[0];
	if ($outcome_txt) {
		if ($outcome_txt->as_HTML =~ m/(\d+).png/) {
			$wetData{$forecastNum}{'forecastIcon'} = $1;
			$wetData{$forecastNum}{'forecastIconURLSmall'} = '/plugins/SuperDateTime/html/images/' . $1 . '.png';
		}
		else {
			$status = '-';
			$log->warn('Error parsing tomorrow 1 weather icon');			
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 1 weather icon');	
	}

	my $outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-narrative"))[0];
	if ($outcome_txt) {
		push(@WETdisplayItems1temp, $wetData{$forecastNum}{'forecastTOD'});
		push(@WETdisplayItems2temp, localizeLongWeather($outcome_txt->as_text));
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 1 narrative');
	}

	#------------------------------------------- Tomorrow 2.  Keep as separate code from Tomorrow 1 for flexibility?
	$forecastNum++;

	$outcome_txt = ($tree->look_down( "_tag", "div", "class", "wx-details"))[1];
	if ($outcome_txt) {
		if ($outcome_txt->as_text =~ m/Chance of (\w+):(.*%)W/) {
			if ($1 eq 'Snow') {
				$wetData{$forecastNum}{'forecastPrec'} = $1 . ' ' . $2;
			}
			elsif ($1 eq 'Rain') {
				$wetData{$forecastNum}{'forecastPrec'} = 'RAIN ' . $2;
			}
			else {
				$wetData{$forecastNum}{'forecastPrec'} = 'PREC ' . $2;
			}	
		}
		else {
			$status = '-';
			$log->warn('Error parsing tomorrow night rain/snow');			
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow night rain/snow');
	}

	$outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-temp"))[1];
	if ($outcome_txt) {
		if ($outcome_txt->as_HTML =~ m/wx-temp\">\s?(\d+)<.*wx-label\">(\w+)<\/span>/) {
			$wetData{$forecastNum}{'forecastTempF'} = $1;
			$wetData{$forecastNum}{'forecastType'} = $2;
			$wetData{$forecastNum}{'forecastTempC'} = FtoC($1);
		}
		else {
			$status = '-';
			$log->warn('Error parsing tomorrow 2 hi/low');			
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 2 hi/low');
	}

	# For now let's assume it's always tomorrow and tomorrow night
	$wetData{$forecastNum}{'forecastTOD'} = 'TOMORROW NIGHT';

	#note the extra trailing space...
	my $outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-phrase "))[1];
	if ($outcome_txt) {
		$wetData{$forecastNum}{'skyCondition'} = $outcome_txt->as_text;
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 2 sky conditions');
	}

	$outcome_txt = ($tree->look_down( "_tag", "img", "class", "wx-weather-icon"))[1];
	if ($outcome_txt) {
		if ($outcome_txt->as_HTML =~ m/(\d+).png/) {
			$wetData{$forecastNum}{'forecastIcon'} = $1;
			$wetData{$forecastNum}{'forecastIconURLSmall'} = '/plugins/SuperDateTime/html/images/' . $1 . '.png';
		}
		else {
			$status = '-';
			$log->warn('Error parsing tomorrow 2 weather icon');			
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 2 weather icon');	
	}

	my $outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-narrative"))[1];
	if ($outcome_txt) {
		push(@WETdisplayItems1temp, $wetData{$forecastNum}{'forecastTOD'});
		push(@WETdisplayItems2temp, localizeLongWeather($outcome_txt->as_text));
	}
	else {
		$status = '-';
		$log->warn('Error parsing tomorrow 2 narrative');
	}

	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);
}

sub getWeatherNow {  #Set up Async HTTP request for Weather
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;

	my $url = 'http://www.weather.com/weather/today/' . $prefs->get('city');
	my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotWeatherNow,
							  \&gotErrorViaHTTP,
							  {caller => 'getWeatherNow',
							   callerProc => \&getWeatherNow,
							   client => $client,
							   refreshItem => $refreshItem});
	$log->info("async request: $url");
	
	$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0',
	'Accept-Language' => 'en-us,en;q=0.5',
	'Accept' => 'text/html',
	'Accept-Charset' => 'UTF-8');
}


sub gotWeatherNow {  #Weather data was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();

	my $tree = HTML::TreeBuilder->new; # empty tree
	$tree->parse($content);
	$tree->eof();
	
	$wetData{-1}{'forecastTOD'} = 'Right Now';
	
	my $outcome_txt = ($tree->look_down( "_tag", "span", "itemprop", "temperature-fahrenheit"))[0];
	if ($outcome_txt) {
		$wetData{'temperatureF'} = $outcome_txt->as_text;
		$wetData{'temperatureC'} = FtoC($outcome_txt->as_text);
	}
	else {
		$status = '-';
		$log->warn('Error parsing current temperature');	
	}
	
	$outcome_txt = ($tree->look_down( "_tag", "span", "itemprop", "feels-like-temperature-fahrenheit"))[0];
	if ($outcome_txt) {
		$wetData{'feelslikeF'} = $outcome_txt->as_text;
		$wetData{'feelslikeC'} = FtoC($outcome_txt->as_text);
	}
	else {
		$status = '-';
		$log->warn('Error parsing feels like temperature');	
	}

	$outcome_txt = ($tree->look_down( "_tag", "div", "class", "wx-wind-label"))[0];
	if ($outcome_txt) {
		if ($outcome_txt->as_text =~ m/(.*) at (\d+) mph/) {
			$wetData{'windspeed_mh'} = $2;
			$wetData{'windspeed_kh'} = $2*1.609344;
			$wetData{'windspeed_kh'} = int($wetData{'windspeed_kh'} + .5 * ($wetData{'windspeed_kh'} <=> 0)); #Funky round
	
			$wetData{'windspeed_ms'} = $2*16.09344/36;
			$wetData{'windspeed_ms'} = int($wetData{'windspeed_ms'} + .5 * ($wetData{'windspeed_ms'} <=> 0)); #Funky round
			$wetData{'windspeed_kth'} = $2/1.1515;
			$wetData{'windspeed_kth'} = int($wetData{'windspeed_kth'} + .5 * ($wetData{'windspeed_kth'} <=> 0)); #Funky round
			
			$wetData{'windspeed_mh'} = $1 . $wetData{'windspeed_mh'};
			$wetData{'windspeed_kh'} = $1 . $wetData{'windspeed_kh'};
			$wetData{'windspeed_ms'} = $1 . $wetData{'windspeed_ms'};
			$wetData{'windspeed_kth'} = $1 . $wetData{'windspeed_kth'};

		}
		else {
			$status = '-';
			$log->warn('Error parsing current wind');	
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing current wind');	
	}

	$outcome_txt = ($tree->look_down( "_tag", "div", "class", "wx-data-part wx-first"))[0];
	
	if ($outcome_txt) {
		if ($outcome_txt->as_HTML =~ m/img alt="(.*)" class="wx-wea.*\/(\d+).png/) {
			$wetData{-1}{'skyCondition'} = $1;
			$wetData{-1}{'forecastIcon'} = $2;
			$wetData{-1}{'forecastIconURLSmall'} = '/plugins/SuperDateTime/html/images/' . $2 . '.png';

		}
		else {
			$status = '-';
			$log->warn('Error parsing current sky conditions and icon');	
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing current sky conditions and icon');	
	}	

	$outcome_txt = ($tree->look_down( "_tag", "div", "class", qr(wx-dewpoint)))[0];
	if ($outcome_txt) {
		if ($outcome_txt->as_HTML =~ m/wx-data">(\d+)&deg;</) {
			$wetData{'dewpointF'} = $1;
			$wetData{'dewpointC'} = FtoC($1);
		}
		else {
			$status = '-';
			$log->warn('Error parsing current dew point');			
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing current dew point');	
	}

	$outcome_txt = ($tree->look_down( "_tag", "span", "itemprop", "barometric-pressure-incheshg"))[0];
	if ($outcome_txt) {
		if ($outcome_txt->as_text =~ m/(\d+\.\d+)/) {
			$wetData{'pressureIN'} = $1;
			$wetData{'pressureMB'} = $1 * 33.8639;
			$wetData{'pressureMB'} = int($wetData{'pressureMB'} + .5 * ($wetData{'pressureMB'} <=> 0)); #Funky round			
		}
		else {
			$status = '-';
			$log->warn('Error parsing current pressure');	
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing current pressure');	
	}

	$outcome_txt = ($tree->look_down( "_tag", "span", "class", qr{wx-pressure}))[0];
	if ($outcome_txt) {
		if ($outcome_txt->as_HTML =~ m/wx-pressure-(.*)\"><\/span/) {
			if ($1 eq 'steady') {
				$wetData{'pressureT'} = '~'; #~ is not displayed in all player text locations
			}
			elsif ($1 eq 'down') {
				$wetData{'pressureT'} = '-';
			}
			elsif ($1 eq 'up') {
				$wetData{'pressureT'} = '+'; #+ is not displayed in all player text locations
			}
			else {
				$status = '-';
				$log->warn('Error parsing current pressure trend');			
			}
		}
	}
	else {
		$status = '-';
		$log->warn('Error parsing current pressure trend');	
	}

	#Now narrative
	#Not applicable to all places, so don't warn if it doesn't exist
	my $outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-value"))[0];
	if ($outcome_txt) {
		push(@WETdisplayItems1temp, $wetData{-1}{'forecastTOD'});
		push(@WETdisplayItems2temp, localizeLongWeather($outcome_txt->as_text));
	}

#	my @matches;
#	if (scalar (@matches) > 0) { #Make sure we got some good HTML to play with
#		#Check for weather alerts if configured to display them
#		if ($prefs->get('lalerts') == 1) {
#			@matches = $tree->look_down( "_tag", "div", "class", qr{sevWxTip} );
#			if (scalar (@matches) > 0) { #Check if any alert was found
#				$outcome_txt = $matches[0]->as_HTML;
#				if ($outcome_txt =~ m/<strong>(.*)<\/strong>./) {
#				if ($outcome_txt =~ /\<strong\>(.+?\.).*<\/strong/) {
#					addDisplayItem('getWeatherNow', 'Weather Alert', $1, 'L');
#				}
#				else {
#					$status = '-';
#					$log->warn('Error parsing weather alert');
#				}
#			}
#		}

            

#			# Nowcast narrative
#	        @matches = $tree->look_down("_tag", "td", "class", "twc-col-1 twc-line-nar");
#			if (scalar (@matches) > 0) { #Check if location supports nowcasts
#				$outcome_txt = $matches[0]->as_text;
#				if ($outcome_txt=~ m/Short-term forecast summary is only/) { #Check if location supports nowcasts
#					$log->debug('Non-US weather.com station selected');
#				}
#				else {
#					if ($outcome_txt=~ /(.+am|.+pm):(.+)/) {
#						$WETdisplayItems1[0] = "Now" . $1;
#						$WETdisplayItems2[0] = localizeLongWeather($2);
#					}
#					else { 
#						$status = '-';
#						$log->warn('Error parsing Now cast narrative');
#					}
#				}
#			}
#	}

	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);
}

sub get10day {  #Set up Async HTTP request for 10day
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	if ($wetData{'0'}{'forecastTOD'} ne $averages{'last'}) { #See if the averages & 10day need to be refreshed due to a period change    	
		my $url = 'http://www.weather.com/weather/tenday/' . $prefs->get('city');
		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&got10day,
							  \&gotErrorViaHTTP,
							  {caller => 'get10day',
							   callerProc => \&get10day,							  
							   client => $client,
							   refreshItem => $refreshItem});
		$log->info("async request: $url");
	
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0',
			'Accept-Language' => 'en-us,en;q=0.5',
			'Accept' => 'text/html',
			'Accept-Charset' => 'UTF-8');
	}
	else {
		$log->debug("Skipping 10day");
		refreshData(undef, $client, $refreshItem);
	}
}

sub got10day {  #10day weather data was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
	
	my $tree = HTML::TreeBuilder->new; # empty tree
	$tree->parse($content);
	$tree->eof();
		
	my $dayNum = 1;
	while ($dayNum <10) {
		my $outcome_txt = ($tree->look_down( "_tag", "div", "class", "wx-daypart"))[$dayNum];
		if ($outcome_txt) {
			if ($outcome_txt->as_HTML =~ m/<h3>(\S+)\s?<span.*label\">(.*)<\/span><\/h3>/) {
				$wetData{'d'.$dayNum}{'day'} = $1;
				$wetData{'d'.$dayNum}{'date'} = $2 . ' '; #extra space to help screen spacing		
			}
			else {
				$status = '-';
				$log->warn('Error parsing 10day day/date');			
			}
		}
		else {
			$status = '-';
			$log->warn('Error parsing 10day day/date');
		}

		$outcome_txt = ($tree->look_down( "_tag", "img", "class", "wx-weather-icon"))[$dayNum];
		if ($outcome_txt) {
			if ($outcome_txt->as_HTML =~ m/(\d+).png/) {
				$wetData{'d'.$dayNum}{'forecastIcon'} = $1;
				$wetData{'d'.$dayNum}{'forecastIconURLSmall'} = '/plugins/SuperDateTime/html/images/' . $1 . '.png';
			}
			else {
				$status = '-';
				$log->warn('Error parsing 10day icon');			
			}
		}
		else {
			$status = '-';
			$log->warn('Error parsing 10day icon');
		}

		$outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-phrase"))[$dayNum];
		if ($outcome_txt) {
			$wetData{'d'.$dayNum}{'condition'} = decode_entities($outcome_txt->as_text);
		}
		else {
			$status = '-';
			$log->warn('Error parsing 10day sky cond');
		}

		$outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-temp"))[$dayNum];
		if ($outcome_txt) {
			if ($outcome_txt->as_HTML =~ m/temp">\s?(-?\d+)/) {
				$wetData{'d'.$dayNum}{'highF'} = $1;
				$wetData{'d'.$dayNum}{'highC'} = FtoC($1);

			}
			else {
				$status = '-';
				$log->warn('Error parsing 10day high');			
			}
		}
		else {
			$status = '-';
			$log->warn('Error parsing 10day high');
		}

		$outcome_txt = ($tree->look_down( "_tag", "p", "class", "wx-temp-alt"))[$dayNum];
		if ($outcome_txt) {
			if ($outcome_txt->as_HTML =~ m/temp-alt">\s?(-?\d+)/) {
				$wetData{'d'.$dayNum}{'lowF'} = $1;
				$wetData{'d'.$dayNum}{'lowC'} = FtoC($1);		
			}
			else {
				$status = '-';
				$log->warn('Error parsing 10day low');			
			}
		}
		else {
			$status = '-';
			$log->warn('Error parsing 10day low');
		}

		$outcome_txt = ($tree->look_down( "_tag", "div", "class", "wx-details wx-event-details-link"))[$dayNum];
		if ($outcome_txt) {
			if ($outcome_txt->as_text =~ m/(\d+%)/) {
				$wetData{'d'.$dayNum}{'precip'} = $1;
			}
			else {
				$status = '-';
				$log->warn('Error parsing 10day precip');
			}
		}
		else {
			$status = '-';
			$log->warn('Error parsing 10day precip');
		}
		
		$dayNum++;
	}	
   	
	refreshData(undef, $client, $refreshItem);
}

sub getWunderground {  #Set up Async HTTP request for Weather
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	if ($prefs->get('wunder') ne '') { #Make sure wunderground data is needed  
		my $url = 'http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=' . $prefs->get('wunder') . '&format=1';
		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotWunderground,
						  \&gotErrorViaHTTP,
						  {caller => 'getWunderground',
							callerProc => \&getWunderground,
						   client => $client,
						   refreshItem => $refreshItem});
	
		$log->info("async request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("No wunderground.com value set.  Skipping...");
		refreshData(undef, $client, $refreshItem);
	}

}

sub gotWunderground {  #Weather data was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	$log->info("got " . $http->url());

	my $content = $http->content();
	my $metric = ($content =~ m/TemperatureC/);
	
	my @ary=split /\n/,$content; #break large string into array

	if($ary[scalar(@ary)-2] =~ /^20\d\d-.*?,(.*?),(.*?),(.*?),(.*?),.*?,(.*?),.*?,(.*?),.*?,(.*?),(.*?),.*,/) {
		if ($metric) {
			$wetData{'wu_temperatureF'} = CtoF($1);
			$wetData{'wu_temperatureFr'} = int($wetData{'wu_temperatureF'} + .5 * ($wetData{'wu_temperatureF'} <=> 0)); #Funky round
			$wetData{'wu_temperatureC'} = $1; 
			$wetData{'wu_temperatureCr'} = int($wetData{'wu_temperatureC'} + .5 * ($wetData{'wu_temperatureC'} <=> 0)); #Funky round
			$wetData{'wu_dewpointF'} = CtoF($2);
			$wetData{'wu_dewpointC'} = $2;
		}
		else {
			$wetData{'wu_temperatureF'} = $1;
			$wetData{'wu_temperatureFr'} = int($wetData{'wu_temperatureF'} + .5 * ($wetData{'wu_temperatureF'} <=> 0)); #Funky round
			$wetData{'wu_temperatureC'} = FtoC($1); 
			$wetData{'wu_temperatureCr'} = int($wetData{'wu_temperatureC'} + .5 * ($wetData{'wu_temperatureC'} <=> 0)); #Funky round
			$wetData{'wu_dewpointF'} = $2;
			$wetData{'wu_dewpointC'} = FtoC($2);	
		}
	
		$wetData{'wu_pressureIN'} = $3;
		$wetData{'wu_pressureMB'} = $3 * 33.8639;
		$wetData{'wu_pressureMB'} = int($wetData{'wu_pressureMB'} + .5 * ($wetData{'wu_pressureMB'} <=> 0)); #Funky round	
		
		if ($5==0) {
			$wetData{'wu_windspeed_mh'}  = 'Calm';
			$wetData{'wu_windspeed_kh'}  = 'Calm';
			$wetData{'wu_windspeed_kth'} = 'Calm';
			$wetData{'wu_windspeed_ms'}  = 'Calm';
		}
		else {
			my $winddir = $4;
			if ($winddir eq 'South') {
				$winddir = 'S';
			}
			elsif ($winddir eq 'North') {
				$winddir = 'N';
			}
			elsif ($winddir eq 'East') {
				$winddir = 'E';
			}
			elsif ($winddir eq 'West') {
				$winddir = 'W';
			}
			
			$wetData{'wu_windspeed_mh'} = $winddir . $5;
			
			$wetData{'wu_windspeed_kh'} = $5*1.609344;
			$wetData{'wu_windspeed_kh'} = $wetData{'wu_windspeed_kh'} . int($wetData{'wu_windspeed_kh'} + .5 * ($wetData{'wu_windspeed_kh'} <=> 0)); #Funky round
			
			$wetData{'wu_windspeed_ms'} = $5*16.09344/36;
			$wetData{'wu_windspeed_ms'} = $wetData{'wu_windspeed_ms'} . int($wetData{'wu_windspeed_ms'} + .5 * ($wetData{'wu_windspeed_ms'} <=> 0)); #Funky round

			$wetData{'wu_windspeed_kth'} = $5/1.1515;
			$wetData{'wu_windspeed_kth'} = $wetData{'wu_windspeed_kth'} . int($wetData{'wu_windspeed_kth'} + .5 * ($wetData{'wu_windspeed_kth'} <=> 0)); #Funky round	
		}
		
		$wetData{'wu_humidity'} = $6 . '%';
	}

	refreshData(undef, $client, $refreshItem);
}

sub getStocks {  #Set up Async HTTP request for Stocks
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;

	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
		
	my $offset = $prefs->get('offset');	
	while ($offset != 0) {
		if ($offset >0) {
			$offset = $offset -1;
			$hour = $hour -1;
			if ($hour == -1) {
				$hour = 23;
				$wday--;
			}
		}
		else {
			$offset = $offset +1;
			$hour = $hour +1;
			if ($hour == 24) {
				$hour = 0;
				$wday++;
			}
		}
	} 	

	my $stocks = $prefs->get('stocks');

	#Market hours
	#if ($stocks ne "" && $wday >0 && $wday <6 && $hour <18 && $hour >8) {
	if ($stocks ne '') {
		my $url = 'http://finance.yahoo.com/d/quotes.csv?s=' . $stocks . '&f=sl1d1t1c1ohgvpn&e=.csv';
		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotStocks,
							  \&gotErrorViaHTTP,
							  {caller => 'getStocks',
							   callerProc => \&getStocks,							  
							   client => $client,
							   refreshItem => $refreshItem});
		
		$log->info("async request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("Skipping stocks...");
	#	
	#	if ($hour <9 || $wday == 0 || $wday == 6) {
	#		$log->info("Out of stock info display window.");
	#	}
	#	elsif ($stocks ne '') {
	#		saveCycles('getStocks');
	#	}
	#
		refreshData(undef, $client, $refreshItem);
	}
}

sub gotStocks {  #Stock data was received
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};
	
	$log->info("got " . $http->url());

	delete $miscData{'stocks'}; #Wipe out old stock values, should we wait until the new data is stored before doing this?

	my $content = $http->content();
	my @ary=split /\n/,$content; #break large string into array

	for (@ary) {  
		if(/"(.*)",(.*),"(.*)","(.*)",(.*),(.*),(.*),(.*),(.*),(.*),"(.*)"/) {
			$miscData{'stocks'}{$1}{'ticker'} = $1;
		
			my $ticker    = $1;
			$miscData{'stocks'}{$1}{'daychartURL'} = 'http://ichart.finance.yahoo.com/t?s=' . $ticker;
			
			my $lasttrade = Slim::Utils::Misc::delimitThousands($2);
			$miscData{'stocks'}{$1}{'lasttrade'} = $lasttrade;
			
			my $lastdate  = $3;
			$miscData{'stocks'}{$1}{'lastdate'} = $3;
			
			my $lasttime  = $4;
			$miscData{'stocks'}{$1}{'lasttime'} = $4;
			
			my $change    = $5;
			$miscData{'stocks'}{$1}{'change'} = $5;

			my $open      = Slim::Utils::Misc::delimitThousands($6);
			$miscData{'stocks'}{$1}{'open'} = $open;
			
			my $high      = Slim::Utils::Misc::delimitThousands($7);
			$miscData{'stocks'}{$1}{'high'} = $high;
			
			my $low       = Slim::Utils::Misc::delimitThousands($8);
			$miscData{'stocks'}{$1}{'low'} = $low;
			
			my $prev      = $10;
			$miscData{'stocks'}{$1}{'prevclose'} = $prev;

			my $pchange   = Slim::Utils::Misc::delimitThousands($10);
			if ($10 > 0) {
				$pchange = ($5/$10)*100;
				$pchange = sprintf("%.2f%", $pchange);
			}
			$miscData{'stocks'}{$1}{'pchange'} = $pchange;

			my $volume    = $9;
			if ($volume >1000000) {
			  $volume = $volume / 1000000;
			  
			  $volume = sprintf("%.2f", $volume);
			  
			  $volume = Slim::Utils::Misc::delimitThousands($volume);
			  $volume = $volume . 'M';
			}
			else {
				$volume = Slim::Utils::Misc::delimitThousands($volume);
			}
						
			if ($ticker eq "^IXIC") {  #Volume is not reported for Nasdaq composite
				$volume = '';
			}
			$miscData{'stocks'}{$1}{'volume'} = $volume;
									
			my $name = $11;			
			$miscData{'stocks'}{$1}{'name'} = $11;
			
			my $line1 = $prefs->get('stock1format');
			my $line2 = $prefs->get('stock2format');
			
			for ($line1) {
				s/%s/$ticker/;
				s/%l/$lasttrade/;
				s/%d/$lastdate/;
				s/%t/$lasttime/;
				s/%c/$change/;
				s/%o/$open/;
				s/%h/$high/;
				s/%w/$low/;
				s/%v/$volume/;
				s/%n/$name/;
				s/%p/$prev/;
				s/%z/$pchange/;
			}
			
			for ($line2) {
				s/%s/$ticker/;
				s/%l/$lasttrade/;
				s/%d/$lastdate/;
				s/%t/$lasttime/;
				s/%c/$change/;
				s/%o/$open/;
				s/%h/$high/;
				s/%w/$low/;
				s/%v/$volume/;
				s/%n/$name/;
				s/%p/$prev/;
				s/%z/$pchange/;				
			}
			#http://content.nasdaq.com/logos/cccc.GIF
			addDisplayItem('getStocks', $line1, $line2, $showgame);
		}
	}

	refreshData(undef, $client, $refreshItem);
}

sub getWeatherMapList {  #Set up Async HTTP request for Weather Icon List
	my $timerRef = shift; #undef
	my $type = shift;
	my $errorCount = shift;

	my $url;
	if ($type eq 'Local') {
		#Reset weather map URLs since local is the top of the chain, preserve any custom
		for my $name ( keys %wetMapURLs ) {
			if ($wetMapURLs{$name}{'Type'} ne 'Custom') {
				delete $wetMapURLs{$name};
			}
		}
		
		$log->info("Beginning weather map image refresh.");
		$url = 'http://www.weather.com/outlook/travel/businesstraveler/map/' . $prefs->get('city') . '?bypassredirect=true';
	}
	elsif ($type eq 'Business Travel') {
		$url = 'http://www.weather.com/maps/activity/travel/index_large.html';
	}
	elsif ($type eq 'Vacation Planner') {
		$url = 'http://www.weather.com/maps/activity/vacationplanner/index_large.html';
	}
	elsif ($type eq 'Aviation') {
		$url = 'http://www.weather.com/maps/activity/aviation/index_large.html';
	}

	my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotWeatherMapList,
							  \&gotErrorViaHTTPmap,
							  {caller => 'getWeatherMapList',
							   errorCount => $errorCount,
							   callerProc => \&getWeatherMapList,
							   type => $type});

	$log->debug("async request: $url");
	$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
}

sub gotWeatherMapList {  #Weather icon list page was received
	my $http = shift;
	
	my $params = $http->params();
	my $type = $params->{'type'};
	
	$log->debug("got " . $http->url());
	
	my $content = $http->content();
	my @ary=split /\n/,$content; #break large string into array

	my @names;
	if ($type eq 'Local') {
		for (@ary) {  
			if(/<option  value="(.+)">(.*)<\/option>/) {
				$log->debug("$1 $2");
				$wetMapURLs{$2}{'Code'} = $1;
				$wetMapURLs{$2}{'Type'} = $type;
				push(@names, $2);
			}
		}
	}
	elsif ($type eq 'Business Travel') {
		for (@ary) {  
			if(/<OPTION VALUE="\/maps\/activity\/travel\/(.+)_large.html".*>(.*)<\/OPTION>/) {
				$log->debug("$1 $2");
				$wetMapURLs{$2}{'Code'} = $1;
				$wetMapURLs{$2}{'Type'} = $type;
				push(@names, $2);
			}
		}
	}
	elsif ($type eq 'Vacation Planner') {
		for (@ary) {  
			if(/<OPTION VALUE="\/maps\/activity\/vacationplanner\/(.+)_large.html".*>(.*)<\/OPTION>/) {
				$log->debug("$1 $2");
				$wetMapURLs{$2}{'Code'} = $1;
				$wetMapURLs{$2}{'Type'} = $type;
				push(@names, $2);
			}
		}
	}
	elsif ($type eq 'Aviation') {
		for (@ary) {  
			if(/<OPTION VALUE="\/maps\/activity\/aviation\/(.+)_large.html".*>(.*)<\/OPTION>/) {
				$log->debug("$1 $2");
				$wetMapURLs{$2}{'Code'} = $1;
				$wetMapURLs{$2}{'Type'} = $type;
				push(@names, $2);
			}
		}
	}
	
	Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + .07, \&getWeatherMapURL, \@names, 0);
}

sub getWeatherMapURL {  #Set up Async HTTP request for Weather Icon List
	my $timerObj = shift; #Should be undef
	my $names_ref = shift;
	my $errorCount = shift;

	#Get next name to find the URL for
	my $name = pop(@{$names_ref});
	
	my $url;
	if ($wetMapURLs{$name}{'Type'} eq 'Local') {
		$url = 'http://www.weather.com/outlook/travel/businesstraveler/map/' . $prefs->get('city') . '?bypassredirect=true&mapdest=' . $wetMapURLs{$name}{'Code'};
	}
	elsif ($wetMapURLs{$name}{'Type'} eq 'Business Travel') {
		$url = 'http://www.weather.com/maps/activity/travel/' . $wetMapURLs{$name}{'Code'} . '_large.html';
	}
	elsif ($wetMapURLs{$name}{'Type'} eq 'Vacation Planner') {
		$url = 'http://www.weather.com/maps/activity/vacationplanner/' . $wetMapURLs{$name}{'Code'} . '_large.html';
	}
	elsif ($wetMapURLs{$name}{'Type'} eq 'Aviation') {
		$url = 'http://www.weather.com/maps/activity/aviation/' . $wetMapURLs{$name}{'Code'} . '_large.html';
	}
	
	my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotWeatherMapURL,
							  \&gotErrorViaHTTPmap,
							  {caller => 'getWeatherMapURL',
							   callerProc => \&getWeatherMapURL,
							   errorCount => $errorCount,
							   name => $name,
							   names_ref => $names_ref});
		
	$log->debug("async request: $url");
	$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
}

sub gotWeatherMapURL {  #Weather icon with image URL page was received
	my $http = shift;
	
	my $params = $http->params();
	my $name = $params->{'name'};
	my $names_ref = $params->{'names_ref'};
		
	$log->debug("got " . $http->url());

	my $content = $http->content();
	my @ary=split /\n/,$content; #break large string into array
	my $found=0;
	
	for (@ary) {
		if(/<img name="mapImg" src="(.+)" width/) {
			$wetMapURLs{$name}{'URL'} = $1;
			$found = 1;
		}
		elsif(/<IMG NAME="mapImg" SRC="(.+)" WIDTH/) {
			$wetMapURLs{$name}{'URL'} = $1;
			$found = 1;
		}
	}

	if ($found == 0) {
		$log->warn("No image found for $name.");
	}

	#Check if there are more names to lookup
	if (scalar @{$names_ref} >0) {
		Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + .1, \&getWeatherMapURL, $names_ref);
	}
	else {
		$names_ref = undef;
		$log->debug("One chain of Icon URL lookups done.");
		#print Dumper( \%wetMapURLs );
		
		#See if there are more chain types to crawl
		if ($wetMapURLs{$name}{'Type'} eq 'Local') {
			Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + .1, \&getWeatherMapList, 'Business Travel', 0);
		}
		elsif ($wetMapURLs{$name}{'Type'} eq 'Business Travel') {
			Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + .1, \&getWeatherMapList, 'Vacation Planner', 0);
		}
		elsif ($wetMapURLs{$name}{'Type'} eq 'Vacation Planner') {
			Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + .1, \&getWeatherMapList, 'Aviation', 0);
		}
		elsif ($wetMapURLs{$name}{'Type'} eq 'Aviation') {
			my $data = {
				    'state' => 'MapRefreshSuccess'
				};
			
			$log->info("Completed weather map image refresh.");

			#Notify any plugins/applets listening that maps just refreshed
			Slim::Control::Request::notifyFromArray(undef,['SuperDateTimeState','dataRefreshState',$data]);
		}
	}
}

sub refreshSoon {
	my $client = shift;

	#Save top showing preference incase server is shut down
	if (defined $topNowShowing{$client}) {
		$prefs->client($client)->set('topNowShowing', $topNowShowing{$client});
	}
	
	#Clear previous display info
	@WETdisplayItems1 =();
	@WETdisplayItems2 =();
	
	$averages{'last'} = ''; #Make sure averages/10day will get refreshed too
	for(my $i=-1; $i<2; $i++) { #Wipe individual averages just in case new weather identifier doesnt support them
		$wetData{$i}{'average_F'} = '';
		$wetData{$i}{'average_C'} = '';
					
		$wetData{$i}{'record_F'} = '';
		$wetData{$i}{'record_C'} = '';
				
		$wetData{$i}{'record_year'} = '';
					
		$wetData{$i}{'sunrise'} = '';
		$wetData{$i}{'sunset'}  = '';
	}
	
	#Need to reload updated prefs
	@MLBteams = @{ $prefs->get('mlb') || [] };
	$refreshTracker[0] = 1; #Need to refresh MLB again
	@NBAteams = @{ $prefs->get('nba') || [] };
	$refreshTracker[1] = 1; #Need to refresh NBA again
	@NHLteams = @{ $prefs->get('nhl') || [] };
	$refreshTracker[2] = 1; #Need to refresh NHL again
	@NFLteams = @{ $prefs->get('nfl') || [] };
	@CBBteams = @{ $prefs->get('cbb') || [] };
	@CFBteams = @{ $prefs->get('cfb') || [] };
	$showtime = $prefs->get('time');
	$showgame = $prefs->get('score');
	$showactivetime = $prefs->get('atime');
	$showactivegame = $prefs->get('ascore');

	#Update 10day forecasts for C or F based on preference
	my @players = Slim::Player::Client::clients();
	for my $player (@players) {
		my @weatherformat1b = @{ $prefs->client($player)->get('weatherformat1b') || [] };
		my @weatherformat2t = @{ $prefs->client($player)->get('weatherformat2t') || [] };
		if ($prefs->get('temperature') == 1) {  #Cel
			$weatherformat1b[1] =~ s/%_5\/%_7/%_6\/%_8/;
			$prefs->client($player)->set('weatherformat1b', \@weatherformat1b);	
			$weatherformat2t[1] =~ s/%_5\/%_7/%_6\/%_8/;
			$prefs->client($player)->set('weatherformat2t', \@weatherformat2t);	
		}
		else {
			$weatherformat1b[1] =~ s/%_6\/%_8/%_5\/%_7/;
			$prefs->client($player)->set('weatherformat1b', \@weatherformat1b);		
			$weatherformat2t[1] =~ s/%_6\/%_8/%_5\/%_7/;
			$prefs->client($player)->set('weatherformat2t', \@weatherformat2t);		
		}
	}	
	
	#No need to refresh data unless there are active clients
	if ($activeClients >0) {
		Slim::Utils::Timers::killTimers(undef, \&refreshData);
		#Refresh in 8 seconds.  In case user keeps changing settings so there are less refreshes maybe.....
		Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 8, \&refreshData, $client, -1);
	}
}

sub refreshPlayerSettings {
	my $timerObj = shift; #Should be undef
	my $client = shift;

	my $prefs = preferences('plugin.superdatetime');

	my @show1icon = @{ $prefs->client($client)->get('show1icon') || [] };
	if (scalar(@show1icon) == 0) {
		if(!$client->display->isa('Slim::Display::Boom')) {
			$show1icon[0] = 1;
			$show1icon[1] = 1;
		}
		else {
			$show1icon[0] = 0;
			$show1icon[1] = 1;
		}
		$prefs->client($client)->set('show1icon', \@show1icon);
	}

	my @show13line = @{ $prefs->client($client)->get('show13line') || [] };
	if (scalar(@show13line) == 0) {
		$show13line[0] = 1;
		$show13line[1] = 1;
		$prefs->client($client)->set('show13line', \@show13line);
	}

	my @d3line1t = @{ $prefs->client($client)->get('v3line1t') || [] };
	if (scalar(@d3line1t) == 0) {
		$d3line1t[0] = '';
		$d3line1t[1] = '';
		$prefs->client($client)->set('v3line1t', \@d3line1t);
	}

	my @d3line1m = @{ $prefs->client($client)->get('v3line1m') || [] };
	if (scalar(@d3line1m) == 0) {
		$d3line1m[0] = '%z';
		$d3line1m[1] = ' %_4';
		$prefs->client($client)->set('v3line1m', \@d3line1m);
	}

	my @d3line1b = @{ $prefs->client($client)->get('v3line1b') || [] };
	if (scalar(@d3line1b) == 0) {
		$d3line1b[0] = '%x';
		$d3line1b[1] = '%_9';
		$prefs->client($client)->set('v3line1b', \@d3line1b);
	}

	my @weatherformat1b = @{ $prefs->client($client)->get('weatherformat1b') || [] };
	if (scalar(@weatherformat1b) == 0) {
		if(!$client->display->isa('Slim::Display::Boom')) {
			$weatherformat1b[0] = '%t/%h %1';
		}
		else {
			$weatherformat1b[0] = '%t %1';
		}
		$weatherformat1b[1] = '%_5/%_7';
		$prefs->client($client)->set('weatherformat1b', \@weatherformat1b);
	}
	
	my @weatherformat1t = @{ $prefs->client($client)->get('weatherformat1t') || [] };
	if (scalar(@weatherformat1t) == 0) {
		$weatherformat1t[0] = '%y: %v';
		$weatherformat1t[1] = '%_3: %_0';
		$prefs->client($client)->set('weatherformat1t', \@weatherformat1t);
	}

	my @weatherformat2b = @{ $prefs->client($client)->get('weatherformat2b') || [] };
	if (scalar(@weatherformat2b) == 0) {
		$weatherformat2b[0] = '%f  %a(%c %g)';
		$weatherformat2b[1] = '%_0';
		$prefs->client($client)->set('weatherformat2b', \@weatherformat2b);
	}

	my @weatherformat2t = @{ $prefs->client($client)->get('weatherformat2t') || [] };
	if (scalar(@weatherformat2t) == 0) {
		$weatherformat2t[0] = '%s - %S';
		$weatherformat2t[1] = '%_3: %_5/%_7';
		$prefs->client($client)->set('weatherformat2t', \@weatherformat2t);
	}

	my @d1period = @{ $prefs->client($client)->get('v1period') || [] };
	if (scalar(@d1period) == 0) {
		$d1period[0] = -1; 
		$d1period[1] = -1;
		$prefs->client($client)->set('v1period', \@d1period);
	}

	if ($prefs->client($client)->get('scroll') eq '') {
		if(!$client->display->isa('Slim::Display::Boom')) {
			$scrollType{$client} = 'Slide';
		}
		else {
			$scrollType{$client} = 'Ticker';
		}
		$prefs->client($client)->set('scroll', $scrollType{$client});
	}
	else {
		$scrollType{$client} = $prefs->client($client)->get('scroll');
	}
	
	my $fdays = $prefs->client($client)->get('fdays');
	
	if ($fdays eq '') {
		$prefs->client($client)->set('fdays', 3);
	}
	
	if ($topNowShowing{$client} <0 || $topNowShowing{$client} > $fdays +3 ) {
		$topNowShowing{$client} = 1;
		$prefs->client($client)->set('topNowShowing', 1);
	}
}

sub refreshData {
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	$refreshItem = $refreshItem + 1;
	
	if ($refreshItem == 0) { #New data refresh, weather.com
		$log->info("Data refresh in process...");

		Slim::Utils::Timers::killTimers(undef, \&stuckMonitor); #Paranoia check
		Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + (($prefs->get('refresh') * 60)*2), \&stuckMonitor, $client); #Set up stuck monitor

		my $data = {
		    'state' => 'Refreshing'
		};
		Slim::Control::Request::notifyFromArray(undef,['SuperDateTimeState','dataRefreshState',$data]);

		$errorCount = 0; #Reset network error counter for new refresh
		
		refreshPlayerSettings(undef, $client); #Didnt seem to want to refresh elsewhere

		%displayInfoBuild = (); #Paranoia, should already be empty
		%macroHash = (); #Wipe out any custom macros that have been set previously

		#Do we need to take into account $isdst???  How do we figure out if East Coast is observing if located in timezone that doesnt observe?
		my ($mday,$mon,$year,$hour, $isdst) = (gmtime(time-(60*60*4)))[3,4,5,2,8];	#Figure out EST based on GMT time
		if ($mday < 10) {
			$mday = '0' . $mday;
		}

		$mon++; #Starts at 0
		if ($mon < 10) {
			$mon = '0' . $mon;
		}
		$year = $year + 1900;
	
		$log->debug("Eastern Hour/Date:$hour/$mday");

		if ((($lastRefresh ne ($year . $mon . $mday)) && $hour >4) || $lastRefresh eq '') { #5AM EST start refreshing a new day
			@refreshTracker = ();
			#Should this be moved into their own subs.... would need separate $lastRefreshes then
			$refreshTracker[0] = 1; #Need to refresh MLB again
			$refreshTracker[1] = 1; #Need to refresh NBA again
			$refreshTracker[2] = 1; #Need to refresh NHL again
			$lastRefresh = $year.$mon.$mday;
		}

		#Update status indicator to show that a data refresh is in progress
		$status = '*';

		#Is this okay since old data is still being displayed?
		$newActiveGames = 0; #Reset active game flag for upcoming sports data refresh

		#getWeatherNow(undef, $client, $refreshItem);
		getWeatherToday(undef, $client, $refreshItem);
	}
	elsif (defined $providers{$refreshItem}) { #Dynamic provider
		$providers{$refreshItem}->(undef, $client, $refreshItem);
	}
	else {  #DONE
		if ($newActiveGames == 1) {
			$activeGames = 1;
		}
	
		$log->info("Drawing screens...");
		$log->debug("Start time:" . Time::HiRes::time());
		
		@WETdisplayItems1 = @WETdisplayItems1temp;
		@WETdisplayItems2 = @WETdisplayItems2temp;

		#Clear the temps for the next update
		@WETdisplayItems1temp = ();
		@WETdisplayItems2temp = ();

		#Refresh complete so it's safe to draw/cache icons for each up/down mode
		
		my @players = Slim::Player::Client::clients();

		#Determine time to wait between each screen drawing
		$drawEachPendingDelay = $prefs->get('drawEachDelay');
		$log->debug("drawEachPendingDelay = $drawEachPendingDelay");
		
		#Stagger the screen drawing timers so they're not blocking to other nonSDT processing
		my $cumTime = Time::HiRes::time() + .03;

		for my $player (@players) {
			#Draw default modes
			#Current 0
			$drawEachPending++;
			Slim::Utils::Timers::setTimer(undef, $cumTime, \&drawEach, $player, -1, 0);
			$cumTime = $cumTime + $drawEachPendingDelay;
			#Default 1
			$drawEachPending++;
			Slim::Utils::Timers::setTimer(undef, $cumTime, \&drawEach, $player, 0, 0);
			$cumTime = $cumTime + $drawEachPendingDelay;
			#Default 2
			$drawEachPending++;
			Slim::Utils::Timers::setTimer(undef, $cumTime, \&drawEach, $player, 1, 0);
			$cumTime = $cumTime + $drawEachPendingDelay;
			#Default 3
			$drawEachPending++;
			Slim::Utils::Timers::setTimer(undef, $cumTime, \&drawEach, $player, 2, 0);
			$cumTime = $cumTime + $drawEachPendingDelay;
			#Default 4
			$drawEachPending++;
			Slim::Utils::Timers::setTimer(undef, $cumTime, \&drawEach, $player, 3, 0);
			$cumTime = $cumTime + $drawEachPendingDelay;

			#Draw custom modes
			my @d1period = @{ $prefs->client($player)->get('v1period') || [] };

			for(my $i=2; $i < scalar @d1period; $i++) {
				$drawEachPending++;
				Slim::Utils::Timers::setTimer(undef, $cumTime, \&drawEach, $player, $d1period[$i], $i);
				$cumTime = $cumTime + $drawEachPendingDelay;
			}		
		
			#Draw 10 Day Forecasts for each player
			#Make sure we have a value in case player settings have never been set
			if ($prefs->client($player)->get('fdays') eq '') {
				$prefs->client($player)->set('fdays', 3);
			}

			for (my $i=1; $i < $prefs->client($player)->get('fdays')+1; $i++) {
				$drawEachPending++;
				Slim::Utils::Timers::setTimer(undef, $cumTime, \&drawEach, $player, 'd'.$i, 1);
				$cumTime = $cumTime + $drawEachPendingDelay;
			}		
		}
	}
}

#Called when no more icons need to be drawn
sub doneDrawing {
	my $client = shift;
	
	$log->info("Done drawing screens.");
	
	$log->debug("Finish time:" . Time::HiRes::time());		

	#Icons have been drawn, replace old display data with fresh data
	%displayInfo = %displayInfoBuild;
	%displayInfoBuild = (); #Done building, no longer needed
	
	#Make non sports/stock line data available via external API
	
	my $total = 0;
	if (defined @{$displayInfo{'cycleOrigin'}}) {
		$total = scalar @{$displayInfo{'cycleOrigin'}};
	}
	
	for(my $counter=0 ; $counter < $total; $counter++) {
		if (!($displayInfo{'cycleOrigin'}[$counter] =~ /getMLB|getNFL|getNBA|getNHL|getCBB|getCFB|getStocks|getLongWeather/)) {
			$miscData{$displayInfo{'cycleOrigin'}[$counter]}{$counter}{'line1'} = $displayInfo{'cycleItems1'}[$counter];
			$miscData{$displayInfo{'cycleOrigin'}[$counter]}{$counter}{'line2'} = $displayInfo{'cycleItems2'}[$counter];
			
			#Differentiate between long and short text
			if ($displayInfo{'cycleInts'}[$counter] eq 'L') {
				$miscData{$displayInfo{'cycleOrigin'}[$counter]}{$counter}{'type'} = 'long';
			}
			else {
				$miscData{$displayInfo{'cycleOrigin'}[$counter]}{$counter}{'type'} = 'short';
			}
		}
	}
		
	if ($status eq '*') {
		$log->info("Data refresh completed.");
		
		my $data = {
		    'state' => 'Success'
		};
		Slim::Control::Request::notifyFromArray(undef,['SuperDateTimeState','dataRefreshState',$data]);

		$status = '';
	}
	else {
		$log->warn("Data refresh completed with errors.");
		my $data = {
		    'state' => 'Errors'
		};
		Slim::Control::Request::notifyFromArray(undef,['SuperDateTimeState','dataRefreshState',$data]);
	}

	$activeGames = $newActiveGames;

	#print Dumper( \%displayLine1 );
	#print Dumper( \%displayLine2 );
	#print Dumper( \%wetData );
	#print Dumper( \%wetMapURLs );
	#print Dumper(\%displayInfo);
		
	#print Dumper( \%miscData );
	#print Dumper( \%sportsData );
	#print Dumper ( \@WETdisplayItems1);
	#print Dumper ( \@WETdisplayItems2);

	Slim::Utils::Timers::killTimers(undef, \&stuckMonitor); #Kill stuck monitor as plugin made it through the refresh
	Slim::Utils::Timers::killTimers(undef, \&refreshData); #Paranoia check
	Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + ($prefs->get('refresh') * 60), \&refreshData, $client, -1); #Set up next refresh timer
}

sub stuckMonitor {
	my $timerObj = shift; #Should be undef
	my $client = shift;
	
	$log->warn("Plugin appears to be stuck.  Forcing refresh...");
	Slim::Utils::Timers::killTimers(undef, \&refreshData); #Paranoia check
	Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 3, \&refreshData, $client, -1); #Set up next refresh timer	
}

sub getMLB {  #Set up Async HTTP request for MLB
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;

	#Do we need to take into account $isdst???  How do we figure out if East Coast is observing if located in timezone that doesnt observe?
	my ($mday,$mon,$year,$hour, $isdst) = (gmtime(time-(60*60*4)))[3,4,5,2,8];	#Figure out EST based on GMT time
	$mon++; #Starts at 0

	if (scalar(@MLBteams)>0 && $mon <12 && $mon >2 && $refreshTracker[0] !=0) { #Make sure a baseball team is chosen and its baseball season
		my $url = 'http://scores.espn.go.com/mlb/scoreboard?date=' . $lastRefresh;
		#my $url = 'http://scores.espn.go.com/mlb/scoreboard?date=20100428';
	
		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotMLB,
								  \&gotErrorViaHTTP,
								  {caller => 'getMLB',
							      	callerProc => \&getMLB,								  
								   client => $client,
								   refreshItem => $refreshItem});							  
		
		$log->info("aync request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("Skipping MLB...");
		if (scalar(@MLBteams)>0) {
			saveCycles('getMLB');
		}
		refreshData(undef, $client, $refreshItem);
	}
}

sub registerProvider {
	my $subRef = shift;
	
	my $size = (scalar keys %providers) + 1;
	
	$providers{$size} = $subRef;
}

sub addDisplayItem {
	my ($origin, $item1, $item2, $int, $expires, $time) = @_;
	
	if (!defined $expires) {
		$expires = 0;
	}

	if (!defined $time) {
		$time = Time::HiRes::time();
	}
	
	push(@{$displayInfoBuild{'cycleOrigin'}}, $origin);
	push(@{$displayInfoBuild{'cycleItems1'}}, $item1);
	push(@{$displayInfoBuild{'cycleItems2'}}, $item2);	
	push(@{$displayInfoBuild{'cycleInts'}}, $int);
	push(@{$displayInfoBuild{'cycleTimeAdded'}}, $time);
	push(@{$displayInfoBuild{'cycleTimeExpires'}}, $expires);
}

#Allows plugins to add their own % macro replacement value
sub addMacro {
	my ($macro, $value) = @_;
	$macroHash{$macro} = $value;
}

#Preserves previous display info for a given source.  Optionally a time can be specified which will be compared against the 
#cycleTimeAdded value.either before (b) or after (a) based on $ba argument.
sub saveCycles {
	my ($origin, $time, $ba) = @_;

	$log->debug("Preserving previous $origin info... $ba $time");
	
	if (exists $displayInfo{'cycleOrigin'}) {
		my $total = scalar @{$displayInfo{'cycleOrigin'}};
		for(my $counter=0 ; $counter < $total; $counter++) {
			if ($displayInfo{'cycleOrigin'}[$counter] eq $origin) {
				if (defined $time) {
					if ($ba eq 'b' && $displayInfo{'cycleTimeAdded'}[$counter] < $time) {
						addDisplayItem($origin, $displayInfo{'cycleItems1'}[$counter], $displayInfo{'cycleItems2'}[$counter], $displayInfo{'cycleInts'}[$counter], $displayInfo{'cycleTimeExpires'}[$counter], $displayInfo{'cycleTimeAdded'}[$counter]);
					}
					elsif ($ba eq 'a' && $displayInfo{'cycleTimeAdded'}[$counter] > $time) {
						addDisplayItem($origin, $displayInfo{'cycleItems1'}[$counter], $displayInfo{'cycleItems2'}[$counter], $displayInfo{'cycleInts'}[$counter], $displayInfo{'cycleTimeExpires'}[$counter], $displayInfo{'cycleTimeAdded'}[$counter]);
					}
				}
				else {
					addDisplayItem($origin, $displayInfo{'cycleItems1'}[$counter], $displayInfo{'cycleItems2'}[$counter], $displayInfo{'cycleInts'}[$counter], $displayInfo{'cycleTimeExpires'}[$counter], $displayInfo{'cycleTimeAdded'}[$counter]);
				}
			}
		}
	}			
}

#Preserves non-expired display info for a given source
sub processExpired {
	my $origin = shift;
	
	my $time = Time::HiRes::time();

	$log->debug("Preserving non-expired $origin info...");
	
	my $total = scalar @{$displayInfo{'cycleOrigin'}};
	for(my $counter=0 ; $counter < $total; $counter++) {
		if (($displayInfo{'cycleOrigin'}[$counter] eq $origin) && $displayInfo{'cycleTimeExpires'}[$counter] > $time) {
			addDisplayItem($origin, $displayInfo{'cycleItems1'}[$counter], $displayInfo{'cycleItems2'}[$counter], $displayInfo{'cycleInts'}[$counter], $displayInfo{'cycleTimeExpires'}[$counter], $displayInfo{'cycleTimeAdded'}[$counter]);
		}
	}
}

sub gotMLB {
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	delete $sportsData{'MLB'};
	$sportsData{'MLB'}{'logoURL'} = 'plugins/SuperDateTime/html/images/MLB.png';

	$refreshTracker[0] = 0;
   
	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
    
	my $tree = HTML::TreeBuilder->new; # empty tree
	
	$tree->parse($content);
	$tree->eof();
	
	my @game_divs = $tree->look_down( "_tag", "div", "class", "mod-content" );
	
	for my $game_div ( @game_divs ) {
		next unless $game_div->look_down( "_tag", "div", "class", qr{game-header} );
		#$log->error($game_div->as_HTML);
		#my @outcome = $game_div->look_down( "_tag", "li", "id", qr{statusLine1} );
		my @clock = $game_div->look_down( "_tag", "p", "id", qr{statusLine1} );
		my @teams = $game_div->look_down( "_tag", "a", "href", qr{/mlb/team/_/name/} );
		#my @scores = $game_div->look_down( "_tag", "span", "id", qr{(home|away)HeaderScore} );
		my @scores = $game_div->look_down( "_tag", "li", "class", qr{finalScore} );
		
		#$log->error('outcome' . scalar @outcome);
		#$log->error('clock' . scalar @clock . $clock[0]->as_text);
		#$log->error('teams' . scalar @teams);
		#$log->error('scores' . scalar @scores . $scores[1]->as_HTML);
		
		#if ( (scalar (@outcome) > 0) && (scalar (@clock) > 0) && (scalar (@teams) > 0) && (scalar (@scores) > 0) ) { #Make sure we got some good HTML to play with
		if ( (scalar (@clock) > 0) && (scalar (@teams) > 0) && (scalar (@scores) > 0) ) { #Make sure we got some good HTML to play with
			#my( $outcome_txt ) = $outcome[ 0 ]->content_list;
			my( $clock_time )  = $clock[ 0 ]->content_list;
			my( $away_team )   = $teams[ 0 ]->content_list;
			my( $home_team )   = $teams[ 1 ]->content_list;
			my( $away_score )  = $scores[ 1 ]->content_list;
			my( $home_score )  = $scores[ 2 ]->content_list;
		
			#$outcome_txt = ''
			#	unless defined $outcome_txt && $outcome_txt =~ /\w/;
			#$clock_time = ''
			#	unless defined $clock_time && ( $clock_time =~ /\d/ || $clock_time =~ /delay/i );

			#if( $clock_time eq '' && $outcome_txt =~ /final|delay|postpone/i ) {
			#	$clock_time = $outcome_txt;
			#}
			
			my $home_logo = $teams[1]->as_HTML;
			my $away_logo = $teams[0]->as_HTML;
			
			$home_logo =~ m/name\/(\w+)\//;		
			$home_logo = 'http://assets.espn.go.com/i/teamlogos/mlb/sml/trans/' . $1 . '.gif';
		
			$away_logo =~ m/name\/(\w+)\//;
			$away_logo = 'http://assets.espn.go.com/i/teamlogos/mlb/sml/trans/' . $1 . '.gif';

			$sportsData{'MLB'}{$home_team.$clock_time}{'homeTeam'} = $home_team;
			$sportsData{'MLB'}{$home_team.$clock_time}{'awayTeam'} = $away_team;
			$sportsData{'MLB'}{$home_team.$clock_time}{'homeLogoURL'} = $home_logo;
			$sportsData{'MLB'}{$home_team.$clock_time}{'awayLogoURL'} = $away_logo;
		
			#For now we'll just set the game logo to the home team logo
			$sportsData{'MLB'}{$home_team.$clock_time}{'gameLogoURL'} = $home_logo;
		
			#Check to see if home score is a numeric, otherwise there isn't a score yet and set to blanks
			#if( $home_score =~ /^\d/ ) {
			if( $clock_time =~ /ET$/ ) {
				$sportsData{'MLB'}{$home_team.$clock_time}{'homeScore'} ='';
				$sportsData{'MLB'}{$home_team.$clock_time}{'awayScore'} ='';
				$home_score = '';
				$away_score = '';
			}
			else {
				$sportsData{'MLB'}{$home_team.$clock_time}{'homeScore'} =$home_score;
				$sportsData{'MLB'}{$home_team.$clock_time}{'awayScore'} =$away_score;

			}
			
			$sportsData{'MLB'}{$home_team.$clock_time}{'gameTime'} = convertTime($clock_time);

			if ((teamCheck($home_team,\@MLBteams)==1) || (teamCheck($away_team,\@MLBteams)==1)) {
				displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'MLB', 'getMLB', \&shortenMLB, \%MLBmap);
			}
		} 
		else {
			$status = '-';
			$log->warn('Error parsing MLB data');
		}
	}

	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);	
}

sub teamCheck {
	my $teamToCheck  = shift;
	my $teamArrayRef = shift;

	#Get rid of any ranking, if present (college).
	if ($teamToCheck =~ /(\(\d+\)) (.+)/) {
		$teamToCheck = $2;
	}
	
  	my $endingValue = scalar(@$teamArrayRef);

	for(my $counter=0 ; $counter < $endingValue; $counter++)
	{
		if (($teamToCheck eq @$teamArrayRef[$counter]) || (@$teamArrayRef[$counter] eq '1') || (@$teamArrayRef[$counter] eq 'All') || (@$teamArrayRef[$counter] eq 'all')) {
			return 1;
		}
	}
	
	return 0;
}

sub displayLines {
	#Figure out/Format display lines
	my ($client, $gametime, $team1, $team2, $score1, $score2, $topline, $origin, $shortenRef, $iconHashRef) = @_;
	
	$gametime = convertTime($gametime);  #Clean up time display and convert to local time zone

	my $logoteam1 = '';
	my $logoteam2 = '';
	
	if ($prefs->get('teamlogos') == 0 || !defined $iconHashRef) { #No logos
		$logoteam1 = $shortenRef->($team1);
		$logoteam2 = $shortenRef->($team2) 
	}
	elsif ($prefs->get('teamlogos') == 1) { #Logo no text
		if (defined $iconHashRef->{$team1}) { #Are there logos for team1?
			$logoteam1 = $client->symbols("$origin-".$iconHashRef->{$team1});
		}
		else { #No logo available
			$logoteam1 = $shortenRef->($team1);
		}
			
		if (defined $MLBmap{$team2}) { #Are there logos for team2
			$logoteam2 = $client->symbols("$origin-".$iconHashRef->{$team2});
		}
		else { #No logo available
			$logoteam2 = $shortenRef->($team2);
		}		
	}
	else { #Logo and text
		if (defined $iconHashRef->{$team1}) { #Are there logos for team1?
			$logoteam1 = $client->symbols("$origin-".$iconHashRef->{$team1});
		}
			
		if (defined $iconHashRef->{$team2}) { #Are there logos for team2
			$logoteam2 = $client->symbols("$origin-".$iconHashRef->{$team2});
		}	
		
		$logoteam1 = $logoteam1 . $shortenRef->($team1);
		$logoteam2 = $logoteam2 . $shortenRef->($team2);
	}
		
	if ($score1 eq '' && $showgame>0) {  #upcoming game
		if ($origin eq 'getMLB') {
			$refreshTracker[0] = 1;
		}
		elsif ($origin eq 'getNBA') {
			$refreshTracker[1] = 1;
		}
		elsif ($origin eq 'getNHL') {
			$refreshTracker[2] = 1;
		}
		addDisplayItem($origin, $topline, $logoteam1 . ' @ ' . $logoteam2 . '-' . $gametime, $showgame);
	}
	elsif ($gametime eq 'F' && $showgame>0) {  #Finished game		
		addDisplayItem($origin, $topline, $logoteam1 . ' ' . $score1 . ' @ ' . $logoteam2 . ' ' . $score2 . ' -' . $gametime, $showgame);		
	}
	elsif ($gametime ne 'F' && $showactivegame >0 && $score1 ne '') { #active game
		if ($origin eq 'getMLB') {
			$refreshTracker[0] = 1;
		}
		elsif ($origin eq 'getNBA') {
			$refreshTracker[1] = 1;
		}
		elsif ($origin eq 'getNHL') {
			$refreshTracker[2] = 1;
		}		
		$newActiveGames = 1;
		addDisplayItem($origin, $topline, $logoteam1 . ' ' . $score1 . ' @ ' . $logoteam2 . ' ' . $score2 . ' -' . $gametime, $showactivegame);
	}
}

sub getNBA {  #Set up Async HTTP request for NBA
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	if (scalar(@NBAteams)>0 && $refreshTracker[1] !=0) { #Make sure a basketball team is chosen
		#my $url ='http://scores.espn.go.com/nba/scoreboard?date=20100617';
		my $url = 'http://scores.espn.go.com/nba/scoreboard?date=' . $lastRefresh;

		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotNBA,
				\&gotErrorViaHTTP,
				{caller => 'getNBA',
				callerProc => \&getNBA,														  
				client => $client,
				refreshItem => $refreshItem});

		$log->info("async request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("Skipping NBA...");
		if (scalar(@NBAteams)>0) {
			saveCycles('getNBA');
		}

		refreshData(undef, $client, $refreshItem);
	}

}

sub gotNBA {
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	delete $sportsData{'NBA'};
	$sportsData{'NBA'}{'logoURL'} = 'plugins/SuperDateTime/html/images/nba.png';

	$refreshTracker[1] = 0;
   
	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
    
	my $tree = HTML::TreeBuilder->new; # empty tree
	
	$tree->parse($content);
	$tree->eof();
	
	my @game_divs = $tree->look_down( "_tag", "div", "class", "mod-content" );

	for my $game_div ( @game_divs ) {
		next unless $game_div->look_down( "_tag", "div", "class", qr{game-header} );

		my @outcome = $game_div->look_down( "_tag", "p", "id", qr{statusLine1} );
		my @teams   = $game_div->look_down( "_tag", "span", "id", qr{TeamName} );
		my @scores  = $game_div->look_down( "_tag", "li", "class", qr{finalScore} );

		if ( (scalar (@outcome) > 0) && (scalar (@teams) > 0) && (scalar (@scores) > 0) ) { #Make sure we got some good HTML to play with		
			my( $outcome_txt ) = $outcome[ 0 ]->content_list;
			my( $away_team )   = $teams[ 0 ]->as_text;
			my( $home_team )   = $teams[ 1 ]->as_text;
			my( $away_score )  = $scores[ 1 ]->as_text;
			my( $home_score )  = $scores[ 2 ]->as_text;

			my $home_logo = $teams[1]->as_HTML;
			my $away_logo = $teams[0]->as_HTML;
		
			$home_logo =~ m/name\/(\w+)\//;
			$home_logo = 'http://assets.espn.go.com/i/teamlogos/nba/sml/trans/' . $1 . '.gif';		
			$away_logo =~ m/name\/(\w+)\//;
			$away_logo = 'http://assets.espn.go.com/i/teamlogos/nba/sml/trans/' . $1 . '.gif';

			$outcome_txt = ''
				unless defined $outcome_txt && $outcome_txt =~ /\w/;
			
			my $clock_time = $outcome_txt;

			$sportsData{'NBA'}{$home_team.$clock_time}{'homeTeam'} = $home_team;
			$sportsData{'NBA'}{$home_team.$clock_time}{'awayTeam'} = $away_team;
			$sportsData{'NBA'}{$home_team.$clock_time}{'homeLogoURL'} = $home_logo;
			$sportsData{'NBA'}{$home_team.$clock_time}{'awayLogoURL'} = $away_logo;
		
			#Check to see if home score is a numeric, otherwise there isn't a score yet and set to blanks
			if( $home_score =~ /^\d/ ) {
				$sportsData{'NBA'}{$home_team.$clock_time}{'awayScore'} = $away_score;
				$sportsData{'NBA'}{$home_team.$clock_time}{'homeScore'} = $home_score;
			}
			else {
				$sportsData{'NBA'}{$home_team.$clock_time}{'awayScore'} = '';
				$sportsData{'NBA'}{$home_team.$clock_time}{'homeScore'} = '';
				$home_score = '';
				$away_score = '';
			}
			$sportsData{'NBA'}{$home_team.$clock_time}{'gameTime'} = convertTime($clock_time);

			if ($outcome_txt eq 'Final') {
				if ((teamCheck($home_team,\@NBAteams)==1) || (teamCheck($away_team,\@NBAteams)==1)) {
					displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NBA', 'getNBA', \&shortenNBA, undef);
				}
			}
			else {
				if ((teamCheck($home_team,\@NBAteams)==1) || (teamCheck($away_team,\@NBAteams)==1)) {
					displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NBA (' . rtrim($outcome_txt) . ')', 'getNBA', \&shortenNBA, undef);
				}
			}
		} 
		else {
			$status = '-';
			$log->warn('Error parsing NBA data');
		}
	}

	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);	

}

sub rtrim($)
{
	my $string = shift;
	$string =~ s/\s+$//;
	return $string;
}

sub getCBB {  #Set up Async HTTP request for CBB
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;

	if ((scalar(@CBBteams)>0) && ($prefs->get('cbballconf') != 0)) { #Make sure a college basketball team is entered and not 'none'
 		my $url;
		#$url = 'http://sports.espn.go.com/ncb/scoreboard?confId=50&date=20051210';

 		if ($prefs->get('cbballconf') != 1000) { #Top 25
 			$url = "http://sports.espn.go.com/ncb/scoreboard?confId=".$prefs->get('cbballconf')."&cast=false";
 		}
 		else {
 			$url = 'http://sports.espn.go.com/ncb/scoreboard?date=' . $lastRefresh;
 		}

		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotCBB,
													  \&gotErrorViaHTTP,
													  {caller => 'getCBB',
							   					   callerProc => \&getCBB,													  
													   client => $client,
													   refreshItem => $refreshItem});
	
		$log->info("async request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
		else {
		$log->debug("Skipping CBB...");
		if (scalar(@CBBteams)>0) {
			saveCycles('getCBB');
			}
	
			refreshData(undef, $client, $refreshItem);
		}
	
}

sub gotCBB {
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};
   
   	delete $sportsData{'College Basketball'};
	$sportsData{'College Basketball'}{'logoURL'} = 'plugins/SuperDateTime/html/images/NCAA.png';
	
	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
	
	my $tree = HTML::TreeBuilder->new; # empty tree
		
	$tree->parse($content);
	$tree->eof();
		
	my @game_divs = $tree->look_down( "_tag", "div", "class", "mod-content" );
	
	for my $game_div ( @game_divs ) {
		next unless $game_div->look_down( "_tag", "div", "class", "game-header" );

		my @outcome = $game_div->look_down( "_tag", "div", "id", qr{statusLine2Left} );
		my @qtr     = $game_div->look_down( "_tag", "p", "id", qr{statusLine1} );
		my @clock   = $game_div->look_down( "_tag", "p", "id", qr{statusLine1} );
		my @teams   = $game_div->look_down( "_tag", "span", "id", qr{(h|a)TeamName} );
		my @scores  = $game_div->look_down( "_tag", "li", "id", qr{(home|away)HeaderScore} );
			
		my( $outcome_txt ) = $outcome[ 0 ]->as_text;
		my( $qtr_txt )     = $qtr[ 0 ]->content_list;
		my( $clock_time )  = $clock[ 0 ]->content_list;
		my( $away_team )   = $teams[ 0 ]->as_text;
		my( $home_team )   = $teams[ 1 ]->as_text;
		my( $away_score )  = $scores[ 0 ]->content_list;
		my( $home_score )  = $scores[ 1 ]->content_list;
	
		$outcome_txt = ''
			unless defined $outcome_txt && $outcome_txt =~ /\w/;
		$qtr_txt = ''
			unless defined $qtr_txt && $qtr_txt =~ /\w/;
		$clock_time = ''
			unless defined $clock_time && $clock_time =~ /\d/;
	
		if( $clock_time ne '' ) {
			$clock_time = "$clock_time";
		} elsif( $outcome_txt =~ /final/i ) {
			$clock_time = $outcome_txt;
		} else {
			$clock_time = $qtr_txt;
		}
		
		$sportsData{'College Basketball'}{$home_team.$clock_time}{'homeTeam'}  =$home_team;
		$sportsData{'College Basketball'}{$home_team.$clock_time}{'awayTeam'}  =$away_team;
			
		#Check to see if clock reflects future game time, if so there isn't a score yet and set to blanks
		if( $clock_time =~ /ET/ ) {
			$sportsData{'College Basketball'}{$home_team.$clock_time}{'homeScore'} = '';
			$sportsData{'College Basketball'}{$home_team.$clock_time}{'awayScore'} = '';
			$home_score = '';
			$away_score = '';
		}
		else {
			$sportsData{'College Basketball'}{$home_team.$clock_time}{'homeScore'} = $home_score;
			$sportsData{'College Basketball'}{$home_team.$clock_time}{'awayScore'} = $away_score;
		}
				
		$sportsData{'College Basketball'}{$home_team.$clock_time}{'gameTime'}  =convertTime($clock_time);
	
		if (($outcome_txt =~/Final/) || $outcome_txt eq '' || $outcome_txt eq 'Postponed') {
			if ((teamCheck($home_team,\@CBBteams)==1) || (teamCheck($away_team,\@CBBteams)==1)) {
				displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NCAA Basketball', 'getCBB', \&shortenCBB, undef);
			}
		}
		elsif (ref($outcome_txt) eq 'HTML::Element') { #Just 360
			if ((teamCheck($home_team,\@CBBteams)==1) || (teamCheck($away_team,\@CBBteams)==1)) {
				displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NCAA Basketball (360)', 'getCBB', \&shortenCBB, undef);
			}
		}
		else {
			if ($outcome_txt =~/\//) { #If theres a slash, then it also 360
				$outcome_txt = $outcome_txt . '360';
			}
			
			if ((teamCheck($home_team,\@CBBteams)==1) || (teamCheck($away_team,\@CBBteams)==1)) {
				displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NCAA Basketball (' . rtrim($outcome_txt) . ')', 'getCBB', \&shortenCBB, undef);
			}		
		}
	} 
	
	$tree = $tree->delete;
	
	refreshData(undef, $client, $refreshItem);	
}


sub getCFB {  #Set up Async HTTP request for college football
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	if (scalar(@CFBteams)>0 && ($prefs->get('cfballconf') != 0)) { #Make sure a team is entered and not 'none'  
		my $url;	
		#$url = 'http://sports-ak.espn.go.com/ncf/scoreboard?confId=80';

		if ($prefs->get('cfballconf') != 1000) { #Top 25
		 	$url = 'http://scores.espn.go.com/ncf/scoreboard?confId='.$prefs->get('cfballconf');
		}
		else {
			$url = 'http://scores.espn.go.com/ncf/scoreboard';
		}

		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotCFB,
											  \&gotErrorViaHTTP,
											  {caller => 'getCFB',
							   				callerProc => \&getCFB,											  
											   client => $client,
											   refreshItem => $refreshItem});
														  
		$log->info("aync request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("Skipping CFB...");
		refreshData(undef, $client, $refreshItem);
	}
}

sub gotCFB {
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	delete $sportsData{'College Football'};
  	$sportsData{'College Football'}{'logoURL'} = 'plugins/SuperDateTime/html/images/NCAA.png';
  
	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
    
	my $tree = HTML::TreeBuilder->new; # empty tree
	
	$tree->parse($content);
	$tree->eof();
	
	my @children = $tree->look_down("_tag", "div", "class", "span-4")->content_list;
	
	#$log->info("Number of children" . scalar @children);

	#Apply the time offset to get the current time to Eastern
	my $offset = $prefs->get('offset');
	my @dateArray = localtime(time + (($prefs->get('offset'))*60));
	
	my $curMonth;
	if ($dateArray[4] == 0) {
		$curMonth = 'January';
	}
	elsif ($dateArray[4] == 1) {
		$curMonth = 'February';
	}
	elsif ($dateArray[4] == 2) {
		$curMonth = 'March';
	}
	elsif ($dateArray[4] == 3) {
		$curMonth = 'April';
	}
	elsif ($dateArray[4] == 4) {
		$curMonth = 'May';
	}
	elsif ($dateArray[4] == 5) {
		$curMonth = 'June';
	}
	elsif ($dateArray[4] == 6) {
		$curMonth = 'July';
	}
	elsif ($dateArray[4] == 7) {
		$curMonth = 'August';
	}
	elsif ($dateArray[4] == 8) {
		$curMonth = 'September';
	}
	elsif ($dateArray[4] == 9) {
		$curMonth = 'October';
	}
	elsif ($dateArray[4] == 10) {
		$curMonth = 'November';
	}
	elsif ($dateArray[4] == 11) {
		$curMonth = 'December';
	}
	
	$curMonth = $curMonth . ' ' . $dateArray[3];
	$log->debug("Current Eastern day " . $curMonth);
	
	my $currentDay = 0;
	for my $child (@children) {
		if ($child->look_down( "_tag", "h4", "class", "games-date" )) {
			my $dateText = $child->as_text;
			#$log->info("DATE=$dateText");
			
			if ($dateText =~/Today\'s Games/|$dateText =~/$curMonth/) {
				$currentDay = 1; #We care about these games since they're today!
				#$log->info("CurrentDay = 1");
			}
			else {
				$currentDay = 0;
			}
		}
		if ($currentDay == 1 && $child->look_down( "_tag", "div", "class", "mod-content" )) {
			my @game_divs = $child->look_down( "_tag", "div", "class", "mod-content" );
				#$log->info("Games = " . scalar @game_divs);
	
			for my $game_div ( @game_divs ) {
				#$log->error("****Within a game");
				next unless $game_div->look_down( "_tag", "div", "class", qr{game-header} );
				
				my @outcome =  $game_div->look_down( "_tag", "p", "id", qr{statusText} );
				my @clock   =  $game_div->look_down( "_tag", "p", "id", qr{statusText} );
				my @teams   =  $game_div->look_down( "_tag", "a", "href", qr{\/team\/_\/id} );
				my @scores  =  $game_div->look_down( "_tag", "li", "id", qr{(h|a)Total} );
		
				my( $outcome_txt ) = $outcome[ 0 ]->content_list;
				my( $clock_time )  = $clock[ 0 ]->content_list;
				
				my $away_team;
				my $home_team;
				my $away_score;
				my $home_score;
				my $home_logo;
				my $away_logo;
				
				if (scalar (@teams) > 0) { #Make sure teams found
					$away_team  = $teams[ 0 ]->as_text;
					$home_team  = $teams[ 1 ]->as_text;
					#$log->error("Away $away_team Home $home_team");
					#$log->error(scalar (@scores));
					#$log->error($scores[0]->as_HTML);
					#$log->error($scores[1]->as_HTML);
					$away_score = $scores[ 0 ]->as_text;
					$home_score = $scores[ 1 ]->as_text;
					my $home_logo = $teams[1]->as_HTML;
					my $away_logo = $teams[0]->as_HTML;
				}
				else {
					$status = '-';
					$log->warn('Error parsing CFB teams');			
				}
				
				$home_logo =~ m/id\/(\d+)\//;		
				$home_logo = 'http://assets.espn.go.com/i/teamlogos/ncaa/sml/trans/' . $1 . '.gif';
		
				$away_logo =~ m/id\/(\d+)\//;
				$away_logo = 'http://assets.espn.go.com/i/teamlogos/ncaa/sml/trans/' . $1 . '.gif';

				$outcome_txt = ''
				unless defined $outcome_txt && $outcome_txt =~ /\w/;
				$clock_time = ''
				unless defined $clock_time && ( $clock_time =~ /\d/ || $clock_time =~ /delay/i );

				if( $clock_time eq '' && $outcome_txt =~ /final|delay|postpone|halftime/i ) {
					$clock_time = $outcome_txt;
					if ($clock_time =~ /Halftime/i) {
					    $clock_time = "Halftime";
				    	}
				}

				$sportsData{'College Football'}{$home_team.$clock_time}{'homeTeam'}  =$home_team;
				$sportsData{'College Football'}{$home_team.$clock_time}{'awayTeam'}  =$away_team;
				$sportsData{'College Football'}{$home_team.$clock_time}{'homeLogoURL'} = $home_logo;
				$sportsData{'College Football'}{$home_team.$clock_time}{'awayLogoURL'} = $away_logo;
			
				#Check to see if outcome shows an upcoming game time. If so clear zeros from score and set to blanks
				if( $outcome_txt !~ /ET/ ) {
					$sportsData{'College Football'}{$home_team.$clock_time}{'homeScore'} =$home_score;
					$sportsData{'College Football'}{$home_team.$clock_time}{'awayScore'} =$away_score;
				}
				else {
					$sportsData{'College Football'}{$home_team.$clock_time}{'homeScore'} = '';
					$sportsData{'College Football'}{$home_team.$clock_time}{'awayScore'} = '';
					$home_score = '';
					$away_score = '';
				}
			
				$sportsData{'College Football'}{$home_team.$clock_time}{'gameTime'}  =convertTime($clock_time);

				if ((teamCheck($home_team,\@CFBteams)==1) || (teamCheck($away_team,\@CFBteams)==1)) {
					displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NCAA Football', 'getCFB', \&shortenCFB);
				}
			} 
		}
	}
	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);	
}

sub CFBdisplayLines {
	#Figure out/Format display lines
	my ($client, $CFBgametime, $CFBteam1, $CFBteam2, $CFBscore1, $CFBscore2) = @_;

	my $rank1 = '';
	my $rank2 = '';
	
	if ($CFBteam1 =~ /(\(\d+\)) (.+)/) {
		$rank1 = $1;
		$CFBteam1 = $2;
	}

	if ($CFBteam2 =~ /(\(\d+\)) (.+)/) {
		$rank2 = $1;
		$CFBteam2 = $2;
	}

	$CFBgametime = convertTime($CFBgametime);  #Clean up time display and convert to local time zone

	#Add team icons
	my $icon1='';
	my $icon2='';
	#if (defined $CFBmap{$CFBteam1}) { #Are there icons for each team?
	#	$icon1 = $client->symbols('cfb-'.$CFBmap{$CFBteam1});
	#}
					
	#if (defined $CFBmap{$CFBteam2}) {
	#	$icon2 = $client->symbols('cfb-'.$CFBmap{$CFBteam2});
	#}

	if ($CFBscore1 eq '' && $showgame>0) {  #upcoming game
		addDisplayItem('getCFB', 'College Football', $icon1.$rank1.shortenCFB($CFBteam1) . ' @ ' . $icon2.$rank2.shortenCFB($CFBteam2) . '-' . $CFBgametime, $showgame);
	}
	elsif ($CFBgametime ne 'F' && $showactivegame >0 && $CFBscore1 ne '') { #active game
		$newActiveGames = 1;
		addDisplayItem('getCFB', 'College Football', $icon1.$rank1.shortenCFB($CFBteam1) . ' ' . $CFBscore1 . ' @ ' . $icon2.$rank2.shortenCFB($CFBteam2) . ' ' . $CFBscore2 . ' -' . $CFBgametime, $showactivegame);
	}
	else {  #Must be finished game
		addDisplayItem('getCFB', 'College Football', $icon1.$rank1.shortenCFB($CFBteam1) . ' ' . $CFBscore1 . ' @ ' . $icon2.$rank2.shortenCFB($CFBteam2) . ' ' . $CFBscore2 . ' -' . $CFBgametime, $showgame);
	}
}

sub getNHL {  #Set up Async HTTP request for NHL
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	if (scalar(@NHLteams)>0 && $refreshTracker[2] !=0) { #Make sure a hockey team is chosen  
		#my $url ='http://sports.espn.go.com/nhl/scoreboard?date=20051009';
		#my $url = 'http://sports.espn.go.com/nhl/scoreboard?date=' . $year . $mon . $mday;
		
		my $url = 'http://sports.espn.go.com/nhl/scoreboard?date=' . $lastRefresh;

		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotNHL,
														  \&gotErrorViaHTTP,
														  {caller => 'getNHL',
							   						   callerProc => \&getNHL,														  
														   client => $client,
														   refreshItem => $refreshItem});

		$log->info("aync request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("Skipping NHL...");
		if (scalar(@NHLteams)>0) {
			saveCycles('getNHL');
		}

		refreshData(undef, $client, $refreshItem);
	}

}

sub gotNHL {
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	delete $sportsData{'NHL'};
	$sportsData{'NHL'}{'logoURL'} = 'plugins/SuperDateTime/html/images/NHL.png';
	
	$refreshTracker[2] = 0;

	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
        
	my $tree = HTML::TreeBuilder->new; # empty tree
	
	$tree->parse($content);
	$tree->eof();
	
	my @game_divs = $tree->look_down( "_tag", "div", "class", "mod-content" );

	for my $game_div ( @game_divs ) {

		next unless $game_div->look_down( "_tag", "div", "id", qr{gameHeader} );

		my @outcome = $game_div->look_down( "_tag", "li", "id", qr{statusLine1} );
		my @qtr     = $game_div->look_down( "_tag", "span", "id", qr{statusLine2Left} );
		my @clock   = $game_div->look_down( "_tag", "span", "id", qr{statusLine2Right} );
		my @teams = $game_div->look_down( "_tag", "a", "href", qr{/nhl/team/_/name/} );
		my @scores  = $game_div->look_down( "_tag", "span", "id", qr{(home|away)HeaderScore} );
		
		my( $outcome_txt ) = $outcome[ 0 ]->content_list;
		my( $qtr_txt )     = $qtr[ 0 ]->content_list;
		my( $clock_time )  = $clock[ 0 ]->content_list;
		my( $away_team )   = $teams[ 0 ]->content_list;
		my( $home_team )   = $teams[ 1 ]->content_list;
		my( $away_score )  = $scores[ 0 ]->content_list;
		my( $home_score )  = $scores[ 1 ]->content_list;

		my $home_logo = $teams[1]->as_HTML;
		my $away_logo = $teams[0]->as_HTML;
		
		$home_logo =~ m/name\/(\w+)\//;
		$home_logo = 'http://assets.espn.go.com/i/teamlogos/nhl/sml/trans/' . $1 . '.gif';		
		$away_logo =~ m/name\/(\w+)\//;
		$away_logo = 'http://assets.espn.go.com/i/teamlogos/nhl/sml/trans/' . $1 . '.gif';

		$outcome_txt = ''
			unless defined $outcome_txt && $outcome_txt =~ /\w/;
		$qtr_txt = ''
			unless defined $qtr_txt && $qtr_txt =~ /\w/;
		$clock_time = ''
			unless defined $clock_time && $clock_time =~ /\d/;

		if( $clock_time ne '' ) {
			$clock_time = "$clock_time $qtr_txt";
		} elsif( $outcome_txt =~ /final/i ) {
			$clock_time = $outcome_txt;
		} else {
			$clock_time = $qtr_txt;
		}

		$sportsData{'NHL'}{$home_team.$clock_time}{'homeTeam'} = $home_team;
		$sportsData{'NHL'}{$home_team.$clock_time}{'awayTeam'} = $away_team;
		$sportsData{'NHL'}{$home_team.$clock_time}{'homeLogoURL'} = $home_logo;
		$sportsData{'NHL'}{$home_team.$clock_time}{'awayLogoURL'} = $away_logo;
		
		#Check to see if home score is a numeric, otherwise there isn't a score yet and set to blanks
		if( $home_score =~ /^\d/ ) {
			$sportsData{'NHL'}{$home_team.$clock_time}{'homeScore'} =$home_score;
			$sportsData{'NHL'}{$home_team.$clock_time}{'awayScore'} =$away_score;
		}
		else {
			$sportsData{'NHL'}{$home_team.$clock_time}{'homeScore'} = '';
			$sportsData{'NHL'}{$home_team.$clock_time}{'awayScore'} = '';
			$home_score = '';
			$away_score = '';
		}
			
		$sportsData{'NHL'}{$home_team.$clock_time}{'gameTime'}  =convertTime($clock_time);

		if ((teamCheck($home_team,\@NHLteams)==1) || (teamCheck($away_team,\@NHLteams)==1)) {
			displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NHL', 'getNHL', \&shortenNHL, undef);
		}
	} 

	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);
}

sub localizeLongWeather {
	my $string = shift;
	
	#Convert special chars
	$string = decode_entities($string);
	
	if ($string=~ /(.+ )(-?\d+)(F|s)(.*\.+)/) {
		my $tempSymbol;
		my $firstHalf;
			
		#Temperature will either be a specific number (50F) or a group (50s)
		if ($3 eq 'F') {
			$tempSymbol = '°';
		}
		else {
			$tempSymbol = 's';
		}

		if ($prefs->get('temperature') == 0) {  #Fahrenheit
			$string = $1 . $2 . $tempSymbol . $4;
		}
		else { #Celsius
			my $temp = ($2-32)*5/9;       
			$temp = int($temp + .5 * ($temp <=> 0)); #Funky round
			
			$string = $1 . $temp . $tempSymbol . $4;
		}			
	}

	if ($string =~ /(.*at )(\d+) to (\d+) mph(.*\.+)/) { #Wind portion
		my $wind;
		my $windUnit = $prefs->get('windunit');
				
		if ($windUnit == 0) { #miles/hr
			$wind = $2 . ' to ' . $3 . ' mph';
		}
		elsif ($windUnit == 1) { #km/hr
			my $wind1;
			my $wind2;
			$wind1 = $2*1.609344;
			$wind1 = int($wind1 + .5 * ($wind1 <=> 0)); #Funky round
			$wind2 = $3*1.609344;
			$wind2 = int($wind2 + .5 * ($wind2 <=> 0)); #Funky round
			$wind = $wind1 . ' to ' . $wind2 . ' km/hr';
		}
		elsif ($windUnit == 3) { #m/s
			my $wind1;
			my $wind2;
			$wind1 = $2*16.09344/36;
			$wind1 = int($wind1 + .5 * ($wind1 <=> 0)); #Funky round
			$wind2 = $3*16.09344/36;
			$wind2 = int($wind2 + .5 * ($wind2 <=> 0)); #Funky round
			$wind = $wind1 . ' to ' . $wind2 . ' m/s';
		}				
		else { #kt/hr
			my $wind1;
			my $wind2;
			$wind1 = $2/1.1515;
			$wind1 = int($wind1 + .5 * ($wind1 <=> 0)); #Funky round
			$wind2 = $3/1.1515;
			$wind2 = int($wind2 + .5 * ($wind2 <=> 0)); #Funky round
	 		$wind = $wind1 . ' to ' . $wind2 . ' kt';
		}
		
		$string = $1 . $wind . $4;
	}

	return $string;
}

sub getLongWeather {
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	my $weatherInterval = currentWeatherInterval();
	
	for (my $i = 0; $i < scalar @WETdisplayItems1; $i++) {
		#Check to see if they care to see the weather right now
		if ($weatherInterval >0) {
			if ($weatherInterval <5) {
				addDisplayItem('getLongWeather', $WETdisplayItems1[$i], $WETdisplayItems2[$i], 'L');
			}
			
			#Add to external API
			$miscData{'getLongWeather'}{$i}{'line1'} = $WETdisplayItems1[$i];
			$miscData{'getLongWeather'}{$i}{'line2'} = $WETdisplayItems2[$i];
			$miscData{'getLongWeather'}{$i}{'type'} = 'long';
		}
	}
	
	#Done
	refreshData(undef, $client, $refreshItem);
}

sub getNFL {  #Set up Async HTTP request for NFL
	my $timerObj = shift; #Should be undef
	my $client = shift;
	my $refreshItem = shift;
	
	if (scalar(@NFLteams)>0) { #Make sure a NFL team is chosen  
		my $url = 'http://sports.espn.go.com/nfl/scoreboard';
	
		my $http = Slim::Networking::SimpleAsyncHTTP->new(\&gotNFL,
												  \&gotErrorViaHTTP,
												  {caller => 'getNFL',
							   				   callerProc => \&getNFL,												  
												   client => $client,
												   refreshItem => $refreshItem});

		$log->info("aync request: $url");
		$http->get($url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0');
	}
	else {
		$log->debug("Skipping NFL...");
		refreshData(undef, $client, $refreshItem);
	}
}

sub gotNFL {
	my $http = shift;
	
	my $params = $http->params();
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	delete $sportsData{'NFL'};
	$sportsData{'NFL'}{'logoURL'} = 'plugins/SuperDateTime/html/images/nfl.png';
   
	$log->info("got " . $http->url());
	#$::d_plugins && msg("SuperDateTime: content type is " . $http->headers()->{'Content-Type'} . "\n");

	my $content = $http->content();
    
	my $tree = HTML::TreeBuilder->new; # empty tree
	
	$tree->parse($content);
	$tree->eof();
	
	my @children = $tree->look_down("_tag", "div", "class", "span-4")->content_list;
	
	#$log->info("Number of children" . scalar @children);

	#Apply the time offset to get the current time to Eastern
	my $offset = $prefs->get('offset');
	my @dateArray = localtime(time + (($prefs->get('offset'))*60));
	
	my $dayofweek;
	if ($dateArray[6] == 0) {
		$dayofweek = 'Sunday';
	}
	elsif ($dateArray[6] == 1) {
		$dayofweek = 'Monday';
	}
	elsif ($dateArray[6] == 2) {
		$dayofweek = 'Tuesday';
	}
	elsif ($dateArray[6] == 3) {
		$dayofweek = 'Wednesday';
	}
	elsif ($dateArray[6] == 4) {
		$dayofweek = 'Thursday';
	}
	elsif ($dateArray[6] == 5) {
		$dayofweek = 'Friday';
	}
	elsif ($dateArray[6] == 6) {
		$dayofweek = 'Saturday';
	}	
				
	$log->debug("Current Eastern day " . $dayofweek);
	
	my $currentDay = 0;
	for my $child (@children) {
		if ($child->look_down( "_tag", "h4", "class", "games-date" )) {
			my $dateText = $child->as_text;
			#$log->info("DATE=$dateText");
			if ($dateText =~/$dayofweek/) {
				$currentDay = 1; #We care about these games since they're today!
				#$log->info("CurrentDay = 1");
			}
			else {
				$currentDay = 0;
			}
		}
		if ($currentDay == 1 && $child->look_down( "_tag", "div", "class", "mod-content" )) {
			my @game_divs = $child->look_down( "_tag", "div", "class", "mod-content" );
			#$log->info("Games = " . scalar @game_divs);
			
			for my $game_div ( @game_divs ) {
				next unless $game_div->look_down( "_tag", "div", "class", qr{game-header} );
					
				my @outcome = $game_div->look_down( "_tag", "p", "id", qr{statusText} );
				my @clock   =  $game_div->look_down( "_tag", "p", "id", qr{statusText} );
				my @teams   =  $game_div->look_down( "_tag", "p", "class", qr{team-name} );
				my @scores  =  $game_div->look_down( "_tag", "li", "id", qr{(h|a)Total} );
					
				my( $outcome_txt ) = $outcome[ 0 ]->content_list;
				my( $clock_time )  = $clock[ 0 ]->content_list;
				my( $away_team )   = $teams[ 0 ]->as_text;
				my( $home_team )   = $teams[ 1 ]->as_text;
				my( $away_score )  = $scores[ 0 ]->content_list;
				my( $home_score )  = $scores[ 1 ]->content_list;
			
				$outcome_txt = ''
					unless defined $outcome_txt && $outcome_txt =~ /\w/;
				$clock_time = ''
					unless defined $clock_time && ( $clock_time =~ /\d/ || $clock_time =~ /delay/i );
		
				if( $clock_time eq '' && $outcome_txt =~ /final|delay|postpone|halftime/i ) {
					$clock_time = $outcome_txt;
					if ($clock_time =~ /Halftime/i) {
					    $clock_time = "Halftime";
					    }
				}
						
				$sportsData{'NFL'}{$home_team.$clock_time}{'homeTeam'}  =$home_team;
				$sportsData{'NFL'}{$home_team.$clock_time}{'awayTeam'}  =$away_team;
					
				#Check to see if outcome shows an upcoming game time. If so clear zeros from score and set to blanks
				if( $outcome_txt !~ /ET/ ) {
					$sportsData{'NFL'}{$home_team.$clock_time}{'awayScore'} =$away_score;
					$sportsData{'NFL'}{$home_team.$clock_time}{'homeScore'} =$home_score;
				}
				else {
					$sportsData{'NFL'}{$home_team.$clock_time}{'awayScore'} = '';
					$sportsData{'NFL'}{$home_team.$clock_time}{'homeScore'} = '';
					$home_score = '';
					$away_score = '';
				}
						
				$sportsData{'NFL'}{$home_team.$clock_time}{'gameTime'}  =convertTime($clock_time);
			
				if ((teamCheck($home_team,\@NFLteams)==1) || (teamCheck($away_team,\@NFLteams)==1)) {
					displayLines($client, $clock_time, $away_team, $home_team, $away_score, $home_score, 'NFL', 'getNFL', \&shortenNFL, \%NFLmap);
				}
			} 
			
		}
			#$log->info("*" . $child->as_text . "*");
			#my @test = $child->look_down( "_tag" , "h4", "class", "games-date" );
			#$log->info(scalar @test . "**GKB**");
		
	#	#my @gamedates = $elms->look_down( "_tag", "h4", "class", "games-date" );
	#	#log->info($gamedates[0]->as_text);
	}
	
	$tree = $tree->delete;

	refreshData(undef, $client, $refreshItem);	
}

sub convertTime {
	my $gametime = shift;
	$log->debug("HTML Gametime     =$gametime");
	my $hour = 0;
	my $minute = 0;
	my $ampm = '';
	my $offset = $prefs->get('offset');

	if ($gametime =~ /(\d+:\d+), (\d+).*Period/) { #Active NHL game
		$gametime = $1 . '/' . $2;
	}
	elsif (($gametime =~ /(\d+).*End/)||($gametime =~ /End (\d+)/)) { #NHL/NFL/CFB game, end of qtr/per
		$gametime = 'E'.$1;
	}
	elsif ($gametime =~ /(\D)\D+(\d+)/) { #Active MLB game, shorten inning info
		$gametime = $1 . $2;
	}
	elsif ($gametime =~ /(\d*\d+:\d\d) (\d)\w\w/) { #Active NBA/NFL game
		$gametime = $1 . '/' . $2;
	}
	elsif ($gametime =~ /(\d+):(\d+) (ot)/i) { #Time remaining in OT
		$hour = $1;
		$minute = $2;
		my $ot = uc($3);
		$gametime = $hour . ':' . $minute . " " . $ot;
	}
	elsif ($gametime =~ /(\d+):(\d+) (\w\w)/) { #Future game, convert timezone
		$hour = $1;
		$minute = $2;
		$ampm = lc($3);

		while ($offset != 0) {
			if ($offset >0) {
				$offset = $offset -1;
				$hour = $hour +1;
				if ($hour == 13) {
					$hour = 1;
				}
				elsif ($hour == 12) {
					if ($ampm eq 'am') {
						$ampm = 'pm';
					}
					else {
						$ampm = 'am';
					}
				}
			}
			else {
				$offset = $offset +1;
	        		$hour = $hour -1;
	        		if ($hour == 0) {
					$hour = 12;
				}
				elsif ($hour == 11) {
					if ($ampm eq 'am') {
						$ampm = 'pm';
					}
					else {
						$ampm = 'am';
					}
				}
			}
		} 

		#$gametime = $hour . ':' . $minute . $ampm;
		if ($ampm eq 'pm' && $hour != 12) {
			$hour = $hour + 12;
		}
		elsif ($ampm eq 'am' && $hour == 12) { #Midnight
			$hour = 0;
		}
		$gametime = Slim::Utils::DateTime::timeF(timelocal(0,$minute,$hour,1,1,2010));
  	}
  	elsif ($gametime =~ /Final.*(SO|OT)/i) { #NBA OT Final or NHL Sudden OT Final
  	    $gametime = 'F/' . $1;
  	}
	elsif ($gametime =~ /(\D)\D.*/) { #Final or Delayed MLB game
  		$gametime = $1;
	}
	$log->debug("Converted Gametime=$gametime");
	return $gametime;
}


sub shortenMLB {
  #No MLB teams need shortening?
  my $long = shift;

  return $long;
}

sub shortenNBA {
  my $long = shift;
  
  if( $long eq "Timberwolves" ) {
	  $long = "TWolves";
  } elsif( $long eq "Trail Blazers" ) {
	  $long = "TBlazers";
  }

  return $long;
}

sub shortenCBB {
	my $long = shift;
  
#	YOU CAN MODIFY THIS LIKE THE EXAMPLE BELOW TO SHORTEN YOUR TEAM NAMES...
	if ($long =~ m/^Illinois$/) { $long = 'Illini';}
	elsif ($long=~ m/^Notre Dame/) { $long = 'ND';}
	elsif ($long=~ m/^Southern Methodist/) { $long = 'SMU';}
	elsif ($long=~ m/^Ohio State/) { $long = 'OSU';}
	elsif ($long=~ m/^Washington State/) { $long = 'WSU';}
	elsif ($long=~ m/^Boston College/) { $long = 'BC';}
	elsif ($long=~ m/^Wisconsin$/) { $long = 'Wisc.';}
	elsif ($long=~ m/^Bowling Green$/) { $long = 'BGSU';}
	elsif ($long=~ m/^Brigham Young/) { $long = 'BYU';}
	elsif ($long=~ m/^Northwestern/) { $long = 'NW';}
	elsif ($long=~ m/^San Diego State/) { $long = 'SDSU';}
	elsif ($long=~ m/^San Jose State/) { $long = 'SJSU';}

	return $long;
}

sub shortenCFB {
	my $long = shift;
  
#	YOU CAN MODIFY THIS LIKE THE EXAMPLES BELOW TO SHORTEN YOUR TEAM NAMES...
	if ($long =~ m/^Illinois$/) { $long = 'Illini';}
	elsif ($long=~ m/^Notre Dame/) { $long = 'ND';}
	elsif ($long=~ m/^Southern Methodist/) { $long = 'SMU';}
	elsif ($long=~ m/^Ohio State/) { $long = 'OSU';}
	elsif ($long=~ m/^Washington State/) { $long = 'WSU';}
	elsif ($long=~ m/^Boston College/) { $long = 'BC';}
	elsif ($long=~ m/^Wisconsin$/) { $long = 'Wisc.';}
	elsif ($long=~ m/^Bowling Green$/) { $long = 'BGSU';}
	elsif ($long=~ m/^Brigham Young/) { $long = 'BYU';}
	elsif ($long=~ m/^Northwestern/) { $long = 'NW';}
	elsif ($long=~ m/^San Diego State/) { $long = 'SDSU';}
	elsif ($long=~ m/^San Jose State/) { $long = 'SJSU';}

	return $long;
}

sub shortenNHL {
	my $long = shift;
  
	if ($long =~ m/^Vancouver/) { $long = 'Canucks';}
	elsif ($long=~ m/^Edmonton/) { $long = 'Oilers';}
	elsif ($long =~ m/^New Jersey/) { $long = 'Devils';}
	elsif ($long =~ m/^NY Rangers/) { $long = 'Rangers';}
	elsif ($long =~ m/^Philadelphia/) { $long = 'Flyers';}
	elsif ($long =~ m/^NY Islanders/) { $long = 'Islanders';}
	elsif ($long =~ m/^Pittsburgh/) { $long = 'Penguins';}
	#elsif ($long =~ m/^Montreal/) { $long = 'Canadiens';}
	#elsif ($long =~ m/^Ottawa/) { $long = 'Senators';}
	elsif ($long =~ m/^Buffalo/) { $long = 'Sabres';}
	elsif ($long =~ m/^Boston/) { $long = 'Bruins';}
	#elsif ($long =~ m/^Toronto/) { $long = 'Maple Leafs';}
	#elsif ($long =~ m/^Florida/) { $long = 'Panthers';}
	#elsif ($long =~ m/^Atlanta/) { $long = 'Thrashers';}
	#elsif ($long =~ m/^Tampa Bay/) { $long = 'Lightning';}
	elsif ($long =~ m/^Washington/) { $long = 'Capitals';}
	#elsif ($long =~ m/^Carolina/) { $long = 'Hurricanes';}
	#elsif ($long =~ m/^Detroit/) { $long = 'Red Wings';}
	#elsif ($long =~ m/^Nashville/) { $long = 'Predators';}
	#elsif ($long =~ m/^Chicago/) { $long = 'Black Hawks';}
	#elsif ($long =~ m/^Columbus/) { $long = 'Blue Jackets';}
  	elsif ($long =~ m/^St. Louis/) { $long = 'Blues';}
	elsif ($long =~ m/^Minnesota/) { $long = 'Wild';}
	#elsif ($long =~ m/^Colorado/) { $long = 'Avalanche';}
	elsif ($long =~ m/^Calgary/) { $long = 'Flames';}
	elsif ($long =~ m/^Anaheim/) { $long = 'Ducks';}
	elsif ($long =~ m/^Dallas/) { $long = 'Stars';}
	elsif ($long =~ m/^Los Angeles/) { $long = 'Kings';}
	elsif ($long =~ m/^San Jose/) { $long = 'Sharks';}
	#elsif ($long =~ m/^Phoenix/) { $long = 'Coyotes';}
	
	return $long;
}

sub shortenNFL {
  my $long = shift;
  
  if ($long =~ m/^Chicago/) { $long = 'Bears';}
  elsif ($long=~ m/^Green Bay/) { $long = 'Packers';}
  elsif ($long=~ m/^Indianapolis/) { $long = 'Colts';}
  elsif ($long=~ m/^Philadelphia/) { $long = 'Eagles';}
  elsif ($long=~ m/^Pittsburgh/) { $long = 'Steelers';}
  elsif ($long=~ m/^New Orleans/) { $long = 'Saints';}
  elsif ($long=~ m/^New England/) { $long = 'Patriots';}
  elsif ($long=~ m/^San Francisco/) { $long = '49ers';}
  elsif ($long=~ m/^Jacksonville/) { $long = 'Jaguars';}
  elsif ($long=~ m/^Tennessee/) { $long = 'Titans';}
  #elsif ($long=~ m/^Tampa Bay/) { $long = 'Buccaneers';}
  elsif ($long=~ m/^Washington/) { $long = 'Redskins';}
  elsif ($long=~ m/^New York Jets/) { $long = 'Jets';}
  elsif ($long=~ m/^New York Giants/) { $long = 'Giants';}
  elsif ($long=~ m/^Cleveland/) { $long = 'Browns';}
  elsif ($long=~ m/^St. Louis/) { $long = 'Rams';}
  elsif ($long=~ m/^Kansas City/) { $long = 'Chiefs';}
  elsif ($long=~ m/^Minnesota/) { $long = 'Vikings';}
  elsif ($long=~ m/^Baltimore/) { $long = 'Ravens';}
  elsif ($long=~ m/^Buffalo/) { $long = 'Bills';}
  elsif ($long=~ m/^Houston/) { $long = 'Texans';}


  return $long;
}

sub setMode() {
	my $class  = shift;
	my $client = shift;

	$client->lines(\&lines);

	# setting this param will call client->update() frequently
	$client->modeParam('modeUpdateInterval', 1); # seconds

}

sub getFunctions {
	return {
		'up' => sub  {
			my $client = shift;
			my $button = shift;
			$client->bumpUp() if ($button !~ /repeat/);
		},
		'down' => sub  {
			my $client = shift;
			my $button = shift;
			$client->bumpDown() if ($button !~ /repeat/);;
		},
		'left' => sub  {
			my $client = shift;
			Slim::Buttons::Common::popModeRight($client);
		},
		'right' => sub  {
			my $client = shift;
			
			my $saver = Slim::Player::Source::playmode($client) eq 'play' ? 'screensaver' : 'idlesaver';
		
			if ($prefs->client($client)->get($saver) ne 'SCREENSAVER.superdatetime') {
				$prefs->client($client)->set($saver,'SCREENSAVER.superdatetime');
			} else {
				$prefs->client($client)->set($saver, $Slim::Player::Player::defaultPrefs->{$saver});
			}
		},
		'stop' => sub {
			my $client = shift;
			Slim::Buttons::Common::pushMode($client, 'SCREENSAVER.superdatetime');
		},
		'showme' => sub { #Function to force screensaver into screensaver mode
			my $client = shift;
			Slim::Buttons::Common::pushMode($client, 'SCREENSAVER.superdatetime');
		}	
	};
}

sub lines {
	my $client = shift;
	
	my $saver = Slim::Player::Source::playmode($client) eq 'play' ? 'screensaver' : 'idlesaver';
	my $line2 = $client->string('SETUP_SCREENSAVER_USE');
	my $overlay2 = Slim::Buttons::Common::checkBoxOverlay($client, $prefs->client($client)->get($saver) eq 'SCREENSAVER.superdatetime');
	
	return {
		'line'    => [ $client->string('PLUGIN_SCREENSAVER_SUPERDATETIME'), $line2 ],
		'overlay' => [ undef, $overlay2 ]
	};
}

our %screensaverSuperDateTimeFunctions = (
	'done' => sub  {
					my ($client, $funct, $functarg) = @_;
					Slim::Buttons::Common::popMode($client);
					$client->update();
					#pass along ir code to new mode if requested
					if (defined $functarg && $functarg eq 'passback') {
						Slim::Hardware::IR::resendButton($client);
					}
	},
	'up' => sub  {
		my $client = shift;
		
		#$weathershowing{$client} = 1; #Reset weather showing in case up was hit while displaying weather
		$weathershowing{$client} = (); #Reset weather showing in case up was hit while displaying weather
		
		if ($scrollType{$client} eq 'Ticker') { #Set flag to reset out of ticker mode
			$killTicker{$client} = 1;
		}
		
		if ($nowshowing{$client}{'itemNum'} == 0) { #Is the time currently showing?
			if($topNowShowing{$client} == (scalar @{$displayInfo{$client}{'TOPdisplayItems1'}}-1)) {
				$topNowShowing{$client} = 0;
			}
			else {
				$topNowShowing{$client}++;
			}
		}
		else {
			$nowshowing{$client}{'itemNum'} = 0; #Show the time
		}
		
		killClientTimers($client);
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 10, \&nextDisplayItem);
				
		$client->update(); #Refresh the display
	},
	'down' => sub  {
		my $client = shift;
		
		#$weathershowing{$client} = 1; #Reset weather showoing incase down was hit while displaying weather
		$weathershowing{$client} = (); #Reset weather showing in case down was hit while displaying weather

		if ($scrollType{$client} eq 'Ticker') { #Set flag to reset out of ticker mode
			$killTicker{$client} = 1;
		}
		
		if ($nowshowing{$client}{'itemNum'} == 0) { #Is the time currently showing?
			if($topNowShowing{$client} == 0) {
				$topNowShowing{$client} = scalar @{$displayInfo{$client}{'TOPdisplayItems1'}}-1;
			}
			else {
				$topNowShowing{$client}--;
			}
		}
		else {
			$nowshowing{$client}{'itemNum'} = 0; #Show the time
		}
		
		killClientTimers($client);			
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 10, \&nextDisplayItem);	
		
		$client->update(); #Refresh the display
	},
	'down.hold' => sub  {
		my $client = shift;
		
		$weathershowing{$client} = 1; #Reset weather showing in case up was hit while displaying weather
		
		if ($scrollType{$client} eq 'Ticker') { #Set flag to reset out of ticker mode
			$killTicker{$client} = 1;
		}
		
		if ($nowshowing{$client}{'itemNum'} == 0) { #Is the time currently showing?
			$topNowShowing{$client} = 0;
		}
		else {
			$nowshowing{$client}{'itemNum'} = 0; #Show the time
		}
		
		killClientTimers($client);
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 10, \&nextDisplayItem);
				
		$client->update(); #Refresh the display
	},	
	'refresh' => sub  {
		my $client = shift;

		$client->showBriefly( {
			line => ['Refreshing data...']
		},
		{
			scroll => 1,
			block  => 1,
		} );		

		Slim::Utils::Timers::killTimers(undef, \&refreshData);
		$averages{'last'} = ''; #Make sure averages/10day will get refreshed too
		refreshData(undef, $client, -1);
	},	
	'wnext' => sub  {
		my $client = shift;

		if (scalar @WETdisplayItems2 >0) { #Make sure there are some long forecasts to show
			killClientTimers($client);
			nextWeatherItem($client,1);
		}
		else {
			$client->bumpLeft();
		}
	},
	'wprev' => sub  {
		my $client = shift;
		
		if (scalar @WETdisplayItems2 >0) { #Make sure there are some long forecasts to show
			killClientTimers($client);
			nextWeatherItem($client,-1);
		}
		else {
			$client->bumpRight();
		}
	},	
	'right' => sub  {
		my $client = shift;
		
		if (totalGames() >0) { #Are there display items?
			killClientTimers($client);
			nextDisplayItem($client);
		}
		else {
			$client->bumpLeft();
		}
		
	},	
	'left' => sub  {
		my $client = shift;

		if (totalGames() >0) { #Are there display items?
			killClientTimers($client);
			prevDisplayItem($client);
		}
		else {
			$client->bumpRight();
		}
	},
	'size.hold' => sub  {
		my $client = shift;
		if ($client->power()) { #Client power is on
			Slim::Buttons::Common::popModeRight($client); #Bring client back to where they were b4 screensaver
		}
	},	
	
);

sub currentWeatherInterval {
	if (scalar @WETdisplayItems2 > 0) {
		my $lweather = $prefs->get('lweather');
		if ($lweather == 4) {
			return 1;
		}
		elsif ($lweather == 5) {
			return 5;
		}
		elsif ($activeGames == 1 && $lweather == 2) {
			return 1;
		}
		elsif ($activeGames == 0 && $lweather == 3) {
			return 1;
		}
		else {
			return 0;
		}
	}
	else {
		return 0;
	}
}

sub totalGames {
	my $total = 0;
	
	if (defined $displayInfo{'cycleItems1'}) {
		$total = scalar @{$displayInfo{'cycleItems1'}};
	}

	return $total;	
}

sub getScreensaverSuperDatetime {

	return \%screensaverSuperDateTimeFunctions;
}

sub setScreensaverSuperDateTimeMode() {
	my $client = shift;
	
	my $key;
	my $value;
	
	$killTicker{$client} = 0;
	
	if( $client && $client->isa( "Slim::Player::Squeezebox2")) {
		while (($key, $value) = each(%NFLmap)){
			Slim::Display::Graphics::setCustomChar( 'getNFL-'.$value, chr(hex $value), 'nfl.2' );
		}
	
		while (($key, $value) = each(%MLBmap)){
			Slim::Display::Graphics::setCustomChar( 'getMLB-'.$value, chr(hex $value), 'mlb.2' );
		}
	
		#Add 'special' character for spacing
		Slim::Display::Graphics::setCustomChar( 'getMLB-41', chr(hex 41), 'mlb.2' );
	}
	
	$activeClients++;

	#Set default for top line per client
	if ($prefs->client($client)->get('topNowShowing') ne '') {
		$topNowShowing{$client} = $prefs->client($client)->get('topNowShowing');
	}
	else {
		$topNowShowing{$client} = 1;
		$prefs->client($client)->set('topNowShowing', 1);
	}

	refreshPlayerSettings(undef, $client);

	if ($activeClients == 1) {
		Slim::Utils::Timers::killTimers(undef, \&refreshData); #Just in case there's a rogue timer
		Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 6, \&refreshData, $client, -1);
	}

	$nowshowing{$client}{'itemNum'} = 0; #Start on time display
	Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 10, \&nextDisplayItem);
			
	$client->lines(\&screensaverSuperDateTimelines);
	
	#Slim::Utils::Timers::listTimers();
	# setting this param will call client->update() frequently
	$client->modeParam('modeUpdateInterval', 1); # seconds #7.0

	#Graphical forecasts code...
	# get display size for player if at least Squeezebox2
	if( $client && $client->isa( "Slim::Player::Squeezebox2")) {
		$xmax{$client} = $client->display()->displayWidth();
		$ymax{$client} = $client->display()->bytesPerColumn() * 8;
		
		$log->debug("Found graphic display $xmax{$client} x $ymax{$client} ($client)");
	}
	# only use text on SqueezeboxG and SLIMP3
	else {
		$xmax{$client} = 0;
		$ymax{$client} = 0;
	}
		
	if (scalar $displayInfo{$client}{'forecastG'}==0 && ($client->display->vfdmodel() eq Slim::Display::Squeezebox2->vfdmodel())) {  #Only set the weather channel logo the first time
		clearCanvas($client); #Show weatherchannel logo at startup
		drawIcon($client,29,$ymax{$client}-1,$TWClogo);;
	   	$displayInfo{$client}{'forecastG'}[0] = getFramebuf($client,75); #75 gfx width
	   	$displayInfo{$client}{'forecastG'}[1] = $displayInfo{$client}{'forecastG'}[0];
	   	$displayInfo{$client}{'forecastG'}[2] = $displayInfo{$client}{'forecastG'}[0];
	   	$displayInfo{$client}{'forecastG'}[3] = $displayInfo{$client}{'forecastG'}[0];
	}
}

sub leaveScreensaverSuperDateTimeMode {
	my $client = shift;
	
	#Save top showing preference incase server is shut down
	$prefs->client($client)->set('topNowShowing', $topNowShowing{$client});
	
	$activeClients--;
	#$::d_plugins && msg("SuperDateTime: LEAVING Active Clients: " . $activeClients . "\n");
	
	if ($activeClients == 0) {
		Slim::Utils::Timers::killTimers(undef, \&refreshData);
	}
	
	killClientTimers($client);
	Slim::Utils::Timers::killTimers($client, \&_flashAlarm);
}

sub gotErrorViaHTTP {
	my $http = shift;
	my $params = $http->params();
	my $caller = $params->{'caller'};
	my $callerProc = $params->{'callerProc'};
	my $client = $params->{'client'};
	my $refreshItem = $params->{'refreshItem'};

	$log->warn("error getting " . $http->url());
	$log->warn($http->error());
	$errorCount++;

	if ($errorCount >10) {
		$log->warn("Network error count reached during $caller.");
		$status = '?';
		saveCycles($caller);
		refreshData(undef, $client, $refreshItem);
	}
	elsif ($caller eq "getAverages") {#Special case
		$log->info("Trying getAverages again.");
		getAverages($params->{'dayNum'}, $client, $refreshItem);
	}
	elsif (defined $callerProc) {
		$log->info("Trying $caller again.");	
		Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 3, $callerProc, $client, $refreshItem);
	}
}

sub gotErrorViaHTTPmap {
	my $http = shift;
	my $params = $http->params();

	my $caller = $params->{'caller'};
	my $callerProc = $params->{'callerProc'};
	my $errorCount = $params->{'errorCount'} + 1;
		
	$log->warn("error getting " . $http->url() . " error count at $errorCount");
	$log->warn($http->error());

	if ($errorCount >= $prefs->get('errorCountMax')) {
		$log->warn("Network error count reached during $caller.");
	}
	elsif (defined $callerProc) {
		if ($caller eq 'getWeatherMapList') {
			my $type = $params->{'type'};	
			$log->info("Trying $caller $type again.");
			Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 3, \&getWeatherMapList, $type, $errorCount);
		}
		elsif ($caller eq 'getWeatherMapURL') {
			my $name = $params->{'name'};
			my $names_ref = $params->{'names_ref'};

			#Put name back onto stack so it's tried again
			push(@{$names_ref}, $name);

			$log->info("Trying $caller $name again.");
			Slim::Utils::Timers::setTimer(undef, Time::HiRes::time() + 3, $callerProc, $names_ref, $errorCount);
		}
	}
}

sub nextWeatherItem {
	my $client = shift;
	my $caller = shift;
	
	$killTicker{$client} = 3;

	if (defined $weathershowing{$client}) {
		if ($caller == -1) {
			if ($weathershowing{$client} == 1) {
				$weathershowing{$client} = scalar @WETdisplayItems1;
			}
			else {
				$weathershowing{$client}--;
			}
		}
		else {
			if ($weathershowing{$client} == scalar @WETdisplayItems1) {
				$weathershowing{$client} = 1;
			}
			else {
				$weathershowing{$client}++;
			}
		}
	}
	else {
		if ($caller == -1) {
			$weathershowing{$client} = scalar @WETdisplayItems1;
		}
		else {
			$weathershowing{$client} = 1;
		}
	}
	#*********This needs to be checked!!!!!!!!!
	#$displayLine1{$client} = $displayInfo{$client}{'TOPdisplayItems1'}[$weathershowing{$client}];
	$displayLine1{$client} = $WETdisplayItems1[$weathershowing{$client}-1];
	$displayLine2{$client} = $WETdisplayItems2[$weathershowing{$client}-1];
	$nowshowing{$client}{'itemNum'} = -1; #Don't display the time...

	if ($weathershowing{$client} == scalar @WETdisplayItems1) {
		#Need to give time for display lines to be called (+2)
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 2, \&setWeatherTimer,2);
	}
	else {
		#Need to give time for display lines to be called (+2)
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 2, \&setWeatherTimer,1);
	}

	#Update display
	if ($scrollType{$client} eq 'Basic') {
		$client->update(); #Refresh the display
	}
	else {
		if ($caller == -1) {
			if ($client->display->hasScreen2()) {
				my $prevHash = $client->curDisplay();
				delete $prevHash->{'screen1'};
					
				my $hash = $client->curLines();
				delete $hash->{'screen1'};
				$client->pushRight($prevHash, $hash);
			}
			else {
				$client->pushRight();
			}
		}
		else {
			if ($client->display->hasScreen2()) {
				my $prevHash = $client->curDisplay();
				delete $prevHash->{'screen1'};
					
				my $hash = $client->curLines();
				delete $hash->{'screen1'};
				$client->pushLeft($prevHash, $hash);
			}
			else {
				$client->pushLeft();
			}
		}
	}	
}

sub nextDisplayItem {
	my $client = shift;
	my $timerInterval = 0;
	$nowshowing{$client}{'justify'} = 'center'; #Default

	if ($nowshowing{$client}{'itemNum'} < 0) {#Showing weather
		$nowshowing{$client}{'itemNum'} = 0;
		$timerInterval = $showtime;
	}
	elsif (defined($displayInfo{'cycleItems1'}[$nowshowing{$client}{'itemNum'}])) {
		$displayLine1{$client} = $displayInfo{'cycleItems1'}[$nowshowing{$client}{'itemNum'}];
		$displayLine2{$client} = $displayInfo{'cycleItems2'}[$nowshowing{$client}{'itemNum'}];
		$timerInterval = $displayInfo{'cycleInts'}[$nowshowing{$client}{'itemNum'}];
		
		#Special logic to left justify text so that it scrolls
		if ($timerInterval eq 'L') {
			$timerInterval = 5; #Set a min to show in case it's less than a full line of text, make this configurable or L5 (left 5sec minimum)Make sure at least 3seconds???
			$nowshowing{$client}{'justify'} = 'line';
		}

		$nowshowing{$client}{'itemNum'}++;
	}
	else { #TIME
		$nowshowing{$client}{'itemNum'} = 0;
		
		if (($activeGames == 1) && ($showactivetime == 0)) { #Don't show time when active games
			return nextDisplayItem($client);
		}
		#This probably needs to be re-evaluated...
		elsif ((($activeGames == 0) && ($showtime == 0)) && #Don't show time when no active games
				((totalGames() + scalar @WETdisplayItems2) >0)) #make sure there are some games to show
		{ 
			return nextDisplayItem($client);
		}
		else { #Show the time
			if ($activeGames == 0) {
				$timerInterval = $showtime;
			}
			else {
				$timerInterval = $showactivetime;
			}
		}		
	}
		
	if ($scrollType{$client} eq 'Ticker' && $killTicker{$client} == 0) {
		my $tickerScreen;
		if ($client->display->hasScreen2()) {
			$tickerScreen = 2;
		}
		else {
			$tickerScreen = 1;
		}
		
		my ($complete, $queue) = $client->scrollTickerTimeLeft($tickerScreen);
		if ($nowshowing{$client}{'itemNum'} == 0) {  #NEED TO ONLY OCCUR IF TICKER MODE
			#Why do we include timerinterval in this???
			Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + $timerInterval + $complete, \&nextDisplayItem);
		}
	}
   else {
		#Make sure there are items besides the time showing
		if (totalGames() >0) {
			#Update display
			if ($scrollType{$client} eq 'Basic') {
				$client->update(); #Refresh the display
			}
			else {				
				if ($client->display->hasScreen2()) {
					my $prevHash = $client->curDisplay();
					delete $prevHash->{'screen1'};
					
					my $hash = $client->curLines();
					delete $hash->{'screen1'};
					$client->pushLeft($prevHash, $hash);
				}
				else {
					$client->pushLeft();
				}				
			}
		}

		if ($nowshowing{$client}{'itemNum'} < 0) { #Weather forecast
			#Need to give time for display lines to be called (+2)
			Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 2.5, \&setWeatherTimer);
		}
		elsif ($nowshowing{$client}{'justify'} eq 'line'){
			#Want to give enough time to text to scroll, but have to set a timer to wait for it to actually start scrolling
			#Should we add a min check for anything or just pass in what they specify as the minimum???
			Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 2.5, \&setLongTextTimer);
		}
		else {
			Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + $timerInterval, \&nextDisplayItem);
		}
	}

	$killTicker{$client} = 0;
}

sub setWeatherTimer {
	#This creates a timer to set the nextDisplayItem timer for a weather forecast.
	#This is necessary because display length is based on how long it takes to scroll...
	my $client = shift;
	my $caller = shift;
	
	my $tickerScreen;
	if ($client->display->hasScreen2()) {
		$tickerScreen = 2;
	}
	else {
		$tickerScreen = 1;
	}	
	my ($complete, $queue) = $client->scrollTickerTimeLeft($tickerScreen);
	
	if ($caller == 1) { #User viewing weather via fast forward/reverse buttons
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + $complete + preferences('server')->client($client)->get('scrollPause'), \&nextWeatherItem);
	}
	elsif ($caller == 2) { #User viewing weather via fast forward/reverse buttons and at last item
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + $complete + preferences('server')->client($client)->get('scrollPause'), \&nextDisplayItem);
	}
	else { #Viewing weather forecast via left/right buttons or regular display intervals
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + $complete + preferences('server')->client($client)->get('scrollPause'), \&nextDisplayItem);
	}
}

sub setLongTextTimer {
	#This creates a timer to set the nextDisplayItem timer for a long text item
	#This is necessary because display length is based on how long it takes to scroll...
	my $client = shift;
	
	my $tickerScreen;
	if ($client->display->hasScreen2()) {
		$tickerScreen = 2;
	}
	else {
		$tickerScreen = 1;
	}	
	
	my ($complete, $queue) = $client->scrollTickerTimeLeft($tickerScreen);
	#Need to add some logic for min length
	Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + $complete + preferences('server')->client($client)->get('scrollPause'), \&nextDisplayItem);
}

#Used during ticker display mode to set the top display line to the text at halfway point
sub topLineSet {

	my $client = shift;
	my $topLine = shift;
	
	$tickline1{$client} = $topLine;	
}

sub prevDisplayItem {
	my $client = shift;
	my $timerInterval;

	$nowshowing{$client}{'justify'} = 'center'; #Default

	if ($nowshowing{$client}{'itemNum'} == 0) {
		if (defined($displayInfo{'cycleItems1'})) {
			$nowshowing{$client}{'itemNum'} = scalar @{$displayInfo{'cycleOrigin'}};
			$displayLine1{$client} = $displayInfo{'cycleItems1'}[$nowshowing{$client}{'itemNum'}-1];
			$displayLine2{$client} = $displayInfo{'cycleItems2'}[$nowshowing{$client}{'itemNum'}-1];
			$timerInterval = $displayInfo{'cycleInts'}[$nowshowing{$client}{'itemNum'}-1];

			#Special logic to left justify text so that it scrolls
			if ($timerInterval eq 'L') {
				$timerInterval = 5; #Set a min to show in case it's less than a full line of text, make this configurable or L5 (left 5sec minimum)Make sure at least 3seconds???
				$nowshowing{$client}{'justify'} = 'line';
			}
		}
		else {
			$timerInterval = 10;
		}
	}
	elsif ($nowshowing{$client}{'itemNum'} <= 1) {
		$nowshowing{$client}{'itemNum'} = 0;
		
		if ($activeGames == 0) {
			$timerInterval = $showtime;
		}
		else {
			$timerInterval = $showactivetime;
		}								
	}
	else {
		$nowshowing{$client}{'itemNum'}--;
		$displayLine1{$client} = $displayInfo{'cycleItems1'}[$nowshowing{$client}{'itemNum'}-1];
		$displayLine2{$client} = $displayInfo{'cycleItems2'}[$nowshowing{$client}{'itemNum'}-1];
		$timerInterval = $displayInfo{'cycleInts'}[$nowshowing{$client}{'itemNum'}-1];	

		#Special logic to left justify text so that it scrolls
		if ($timerInterval eq 'L') {
			$timerInterval = 5; #Set a min to show in case it's less than a full line of text, make this configurable or L5 (left 5sec minimum)Make sure at least 3seconds???
			$nowshowing{$client}{'justify'} = 'line';
		}
	}

	#Update display
	if ($scrollType{$client} eq 'Basic') {
		$client->update(); #Refresh the display
	}
	else {
		if ($client->display->hasScreen2()) {
			my $hash = screensaverSuperDateTimelines($client);
			delete $hash->{'screen1'};
			#my $curHash = $client->curDisplay();
			#delete $curHash->{'screen2'};
			$client->pushRight(undef, $hash);
		}
		else {
			$client->pushRight();
		}
	}

	if ($nowshowing{$client}{'itemNum'} < 0) { #Weather forecast
		#Need to give time for display lines to be called (+2)
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 2, \&setWeatherTimer);
	}
	elsif ($nowshowing{$client}{'justify'} eq 'line'){
		#Want to give enough time to text to scroll, but have to set a timer to wait for it to actually start scrolling
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 2.5, \&setLongTextTimer);
	}	
	else {
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + $timerInterval, \&nextDisplayItem);
	}
}

sub killClientTimers {
	my $client = shift;

	Slim::Utils::Timers::killTimers($client, \&nextWeatherItem);
	Slim::Utils::Timers::killTimers($client, \&setWeatherTimer);
	Slim::Utils::Timers::killTimers($client, \&nextDisplayItem);
	Slim::Utils::Timers::killTimers($client, \&setLongTextTimer);
	Slim::Utils::Timers::killTimers($client, \&topLineSet);
}

sub clearCanvas {
	my $client = shift;

	for( my $xi = 0; $xi < $xmax{$client}; $xi++) {
		for( my $yi = 0; $yi < $ymax{$client}; $yi++) {
			$hashDisp{$client}[$xi][$yi] = 0;
		}
	}
}

sub drawIcon {
	my $client = shift;
	my $xpos = shift;
	my $ypos = shift;
	my $icon = shift;

	#$::d_plugins && Slim::Utils::Misc::msg("SuperDateTime-Icon ($xpos,$ypos): $icon\n");
	if ($xmax{$client} && $ymax{$client}) {
		my $firstline = 1;
		my $xs = $xpos < 0 ? 0 : $xpos;
		my $yi = $ypos > $ymax{$client} ? $ymax{$client} : $ypos;
		for my $line (split('\n',$icon)) {
			# first line must be skipped (empty)
			if ($firstline) {
				$firstline = 0;
				next;
			}
			chomp $line;
			for( my $xi = $xs; $xi < length($line)+$xs && $xi < $xmax{$client} && $yi >= 0; $xi++) {
				if (substr($line,$xi-$xs,1) eq "*") {
					$hashDisp{$client}[$xi][$yi] = 1;
				}
			}
			$yi--;
		}
	}
}

sub drawText {
	my $client = shift;
	my $xpos = shift;
	my $ypos = shift;
	my $text = shift;

	#$::d_plugins && Slim::Utils::Misc::msg("SuperDateTime-Text ($xpos,$ypos): $text\n");
	if ($xmax{$client} && $ymax{$client}) {
		for (my $ci = 0; $ci < length($text); $ci++) {
			my $c = substr($text,$ci,1);
			my $firstline = 1;
			my $xs = $xpos < 0 ? 0 : $xpos + $ci*6;
			my $yi = $ypos > $ymax{$client} ? $ymax{$client} : $ypos;
			for my $line (split('\n',$Charset[$Codepage{$c}])) {
				# first line must be skipped (empty)
				if ($firstline) {
					$firstline = 0;
					next;
				}
				chomp $line;
				for( my $xi = $xs; $xi < length($line)+$xs && $xi < $xmax{$client} && $yi >= 0; $xi++) {
					if (substr($line,$xi-$xs,1) eq "*") {
						$hashDisp{$client}[$xi][$yi] = 1;
					}
				}
				$yi--;
			}
		}
	}
}

# convert %hashDisp into line framebuffer format
sub getFramebuf {
	my $client = shift;
	my $width = shift;
	my $line1 = "";
	
	for( my $x = 0; $x < $width && $x < $xmax{$client}; $x++) {
		my $byte;
		for( my $y = $ymax{$client}; $y > 0; $y -= 8) {
			$byte = ($hashDisp{$client}[$x][$y-1] << 7)
			      + ($hashDisp{$client}[$x][$y-2] << 6)
			      + ($hashDisp{$client}[$x][$y-3] << 5)
			      + ($hashDisp{$client}[$x][$y-4] << 4)
			      + ($hashDisp{$client}[$x][$y-5] << 3)
			      + ($hashDisp{$client}[$x][$y-6] << 2)
			      + ($hashDisp{$client}[$x][$y-7] << 1)
			      +  $hashDisp{$client}[$x][$y-8];
			$line1 .= pack("C", $byte);
		}
	}
	return $line1;
}

sub screensaverSuperDateTimelines {
	my $client = shift;
	my $args   = shift;
	
	my $bottomPad = '';
	
	my $flash  = $args->{'flash'}; # set when called from animation callback
	
	my $narrow = $client->display->isa('Slim::Display::Boom');
	my $currentAlarm = Slim::Utils::Alarm->getCurrentAlarm($client);
	my $nextAlarm = Slim::Utils::Alarm->getNextAlarm($client);
	# show alarm symbol if active or set for next 24 hours
	my $alarmOn = defined $currentAlarm || ( defined $nextAlarm && ($nextAlarm->nextDue - time < 86400) );
	$overlay{$client} = undef;
	if ($alarmOn && !$flash) {
		if (defined $currentAlarm && $currentAlarm->snoozeActive) {
			$overlay{$client} = $client->symbols('sleep');
		} else {
			$overlay{$client} = $client->symbols('bell');
			# Include the next alarm time in the overlay if there's room
			if (!$narrow && !defined $currentAlarm) {
				# Remove seconds from alarm time
				my $timeStr = Slim::Utils::DateTime::timeF($nextAlarm->time % 86400, $prefs->client($client)->timeformat, 1);
				$timeStr =~ s/(\d?\d\D\d\d)\D\d\d/$1/;
				$overlay{$client} .=  " $timeStr";
			}
		}
	}

	my $s2line1;
	my $s2line2;

	my $lastTicker = 0; #Flag set to indicate showing last ticker item
	my $hash;

	if ($nowshowing{$client}{'itemNum'} == 0 || ($client->display->hasScreen2())) { #Show time and temperature	
		my $time;
		if (defined($Plugins::FuzzyTime::Plugin::apiVersion)) {
			$time = Plugins::FuzzyTime::Public::timeF($client,undef,preferences('plugin.datetime')->get('timeformat'));
		}
		else {
			#$time = Slim::Utils::DateTime::timeF(undef, preferences('plugin.datetime')->get('timeformat'));
			$time = $client->timeF();
		}
					
		if (defined($displayInfo{$client}{'TOPdisplayItems1'}[$topNowShowing{$client}])) { #Show next forecast
			#Figure out how much extra spacing is necessary from the 3line text to the lower line		
			my $max;
			if ($displayInfo{$client}{'CharLen2'}[$topNowShowing{$client}] > $displayInfo{$client}{'CharLen3'}[$topNowShowing{$client}]) {
				$max = $displayInfo{$client}{'CharLen2'}[$topNowShowing{$client}];
			}
			else {
				$max = $displayInfo{$client}{'CharLen3'}[$topNowShowing{$client}];
			}
		
			#If they're using a large font, include top line in maximum for spacing
			if ($client->textSize() == 2) { #Large text
				if ($displayInfo{$client}{'CharLen1'}[$topNowShowing{$client}] > $max) {
					$max = $displayInfo{$client}{'CharLen1'}[$topNowShowing{$client}];
				}
			}
			
			if ($max >2) {
				$max = $max - 1;
			}
					
			#Create a text string with the proper number of blank spaces		
			for (my $count=1; $count< $max; $count++)
			{
				$bottomPad = $bottomPad . $client->symbols("getMLB-41");
			}

			if ($displayInfo{$client}{'hasIcon'}[$topNowShowing{$client}] == 1) {
				$bottomPad = ' ' . $bottomPad . $client->symbols("getMLB-41"). $client->symbols("getMLB-41") . $client->symbols("getMLB-41") . $client->symbols("getMLB-41") . $client->symbols("getMLB-41");
			}
	
			$s2line1 = $displayInfo{$client}{'TOPdisplayItems1'}[$topNowShowing{$client}];
			$s2line1 =~ s/%1/$time/;
			$s2line2 = $bottomPad . $displayInfo{$client}{'BOTdisplayItems1'}[$topNowShowing{$client}];
			$s2line2 =~ s/%1/$time/;
			
			if ($nowshowing{$client}{'itemNum'} == 0) {
				$displayLine1{$client} = $s2line1;
				$displayLine2{$client} = $s2line2;
			}
		}
		else { #Show the time/date
			#$displayLine1{$client} = Slim::Utils::DateTime::longDateF(undef, preferences('plugin.datetime')->get('dateformat'));
			$displayLine1{$client} = $client->longDateF();
			$displayLine2{$client} = $time;
			$s2line1 = $displayLine1{$client};
			$s2line2 = $displayLine2{$client};
		}
	}

	if ($scrollType{$client} eq 'Ticker' && $killTicker{$client} !=3) { #TICKERS
		my $tickerScreen;
		if ($client->display->hasScreen2()) {
			$tickerScreen = 2;
		}
		else {
			$tickerScreen = 1;
		}		
		my ($complete, $queue) = $client->scrollTickerTimeLeft($tickerScreen);
		#$log->debug("Q:$queue C:$complete $nowshowing{$client}{'itemNum'} $displayLine1{$client} Kill:$killTicker{$client}");

		#Slim::Utils::Timers::listTimers();
		if ($nowshowing{$client}{'itemNum'} == 0) { #Time
			if ($complete == 0 || $killTicker{$client} == 1) { #Show the time
				$killTicker{$client} = 0; #Reset kill ticker in case it's toggeled
				#$::d_plugins && msg("SuperDateTime: *A* ". $nowshowing{$client}{'itemNum'} ." Show Time\n");
				if ($bottomPad ne '') {
					$hash = {
						'overlay' => [$overlay{$client} . $status, undef],
						'center'  => [$displayLine1{$client}, $displayLine2{$client}],
						# It's incorrect to center the bottom line, but if I don't and the text is larger than what will fit
						# on the screen SC will start to scroll it, which totally messes the ticker logic up because it will
						# think there's an active ticker when it's actually just the time display.
						#'center'  => [$displayLine1{$client}, undef],
						#'line'    => [ undef, $displayLine2{$client} ],			
					};
				}
				else {
					$hash = { #No icon or 3line so center everything
						'overlay' => [ $overlay{$client} . $status, undef ],
						'center'  => [ $displayLine1{$client}, $displayLine2{$client} ],
					};
				}
			}
			else { #Last ticker item still displaying
				$lastTicker = 1;
				#$log->debug("*C* $nowshowing{$client}{'itemNum'} Last Ticker Still Displaying");
				$hash = {
					'overlay'  => [ $overlay{$client} . $status, undef],
					'center'   => [ $tickline1{$client}, undef ],
					'ticker'   => [ undef, undef ],
				};
			}
		}	
		elsif ($queue <1 && $complete >0) { #Queue empty, item is still showing
			nextDisplayItem($client);
			if ($nowshowing{$client}{'itemNum'} != 0) { #Add item to ticker
				#$log->debug("*B* $nowshowing{$client}{'itemNum'} Add item to ticker");

				Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + ($complete*.5), \&topLineSet, $displayLine1{$client});
						
				$hash = { 
					'overlay' => [ $overlay{$client} . $status, undef ],
					'center'  => [ $tickline1{$client}, undef ],
					'ticker'  => [ undef, $displayLine2{$client} ],
				};
			}
			else { #Last ticker item about to show time
				#$log->error("*D* ". $nowshowing{$client}{'itemNum'} ." Last ticker item about to show time.");
				$lastTicker = 1;
				$hash = {
					'overlay' => [ $overlay{$client} . $status, undef ],
					'center'  => [ $tickline1{$client}, undef ],
					'ticker'  => [ undef, undef ],
				};		
			}
		}
		elsif ($complete > 0) { #Showing a ticker item
			#$log->debug("*E* ". $nowshowing{$client}{'itemNum'} ." Showing a ticker item.");
			$hash = {
				'overlay' => [ $overlay{$client} . $status, undef ],
				'center'  => [ $tickline1{$client}, undef ],
				'ticker'  => [ undef, undef ],
			};
		}
		else {  #Add first ticker item
			#$::d_plugins && msg("SuperDateTime: *F* ". $nowshowing{$client}{'itemNum'} ." Add first item to ticker.\n");
			$tickline1{$client} = $displayLine1{$client};
				$hash = {
					'overlay' => [ $overlay{$client} . $status, undef ],
					'center'  => [ $tickline1{$client}, undef ],
					'ticker'  => [ undef, $displayLine2{$client} ],
				};
		}
	}
	else {  #BASIC OR SLIDE
		#$log->error("***$client set to:".$nowshowing{$client}{'justify'});
		if ($client->textSize() != 2) { #Not large text
			if ($nowshowing{$client}{'itemNum'} == 0 &&  $bottomPad ne '') { #Time with special spacing				
				$hash = {
					'overlay' => [ $overlay{$client} . $status, undef ],
					'center'  => [ $displayLine1{$client}, undef ],
					'line'    => [ undef, $displayLine2{$client} ],						    
				};
			}
			elsif ($nowshowing{$client}{'itemNum'} == 0) { #Time without special spacing
				$hash = {
					'overlay' => [ $overlay{$client} . $status, undef ],
					'center'  => [ $displayLine1{$client}, $displayLine2{$client} ],						    
				};
			}			
			elsif ($nowshowing{$client}{'itemNum'} < 0) { #Weather with scrolling
				$hash = {
					'overlay' => [ $overlay{$client} . $status ],
					'center'  => [ $displayLine1{$client} ],
					'line'    => [ undef, $displayLine2{$client} ],
				};
			}
			else {
				if ($nowshowing{$client}{'justify'} eq 'line') {
					$hash = {  #Game left justify text to allow for scrolling
						'overlay' => [ $overlay{$client} . $status, undef ],
						'center'  => [ $displayLine1{$client}, undef ],
						'line'    => [ undef, $displayLine2{$client} ],
					};				
				}
				else {
					$hash = {  #Game center text
						'overlay' => [ $overlay{$client} . $status, undef ],
						'center'  => [ $displayLine1{$client}, $displayLine2{$client} ],
					};
				}
			} 
	   } #End of not large text
	   else { #Large text
	   	if ($nowshowing{$client}{'itemNum'} == 0) { #Time
					$hash = {
						'overlay' => [ undef, $overlay{$client} . $status ],
						'center'  => [ undef, $displayLine2{$client}],
					};
			}
			else { #Sport scores/stocks in large text
				$hash = {
					'overlay' => [ undef, $overlay{$client} . $status ],
					$nowshowing{$client}{'justify'} => [ undef, $displayLine2{$client}],
				};
			}
	   }
	}
	
	my $dispHash;
	if ($client->display->hasScreen2()) { #Dual screens
		my $time;
		if (defined($Plugins::FuzzyTime::Plugin::apiVersion)) {
			$time = Plugins::FuzzyTime::Public::timeF($client,undef,preferences('plugin.datetime')->get('timeformat'));
		}
		else {
			#$time = Slim::Utils::DateTime::timeF(undef, preferences('plugin.datetime')->get('timeformat'));
			$time = $client->timeF();
		}
				
		my $timeHash;
		if ($bottomPad ne '') { #Time with special spacing				
			$timeHash = {
				'center' => [ $s2line1, undef ],
				'line'   => [ undef, $s2line2 ],
			};
		}
		else {
			$timeHash = {
				'center'  => [ $s2line1, $s2line2 ],
			};		
		}

		if ($nowshowing{$client}{'itemNum'} != 0 || $lastTicker == 1) { #Not time
			$dispHash->{'screen2'} = $hash;
		}
		else {
			my $line1 = $displayInfo{$client}{'TOPdisplayItems2'}[$topNowShowing{$client}];
			$line1 =~ s/%1/$time/; #Add the time if its included
			
			my $line2 = $displayInfo{$client}{'BOTdisplayItems2'}[$topNowShowing{$client}];
			$line2 =~ s/%1/$time/; #Add the time if its included
			
			my $screen2;
			if ($client->textSize() != 2) { #Not large text
				$screen2 = {
						'overlay' => [ $overlay{$client} . $status, undef ],
						'center'  => [ $line1, $line2 ],
				};
			}
			else {
				$screen2 = {
					'overlay' => [ undef, $overlay{$client} . $status ],
					'center'  => [ $line1, $line2 ],
				};
			}
			
			$dispHash->{'screen2'} = $screen2;
		}
		
		if ($xmax{$client} && $ymax{$client}) {
			$timeHash->{'bits'} = $displayInfo{$client}{'forecastG'}[$topNowShowing{$client}];
		}
		$dispHash->{'screen1'} = $timeHash;
	}
	else { #Single screen
		$hash->{'fonts'} = { 'graphic-280x16'  => { 'overlay' => [ 'small.1' ]},
								   'graphic-320x32'  => { 'overlay' => [ 'standard.1' ]},
								   'text' =>            { 'displayoverlays' => 1 },
								 };

		if ($xmax{$client} && $ymax{$client} && $nowshowing{$client}{'itemNum'} == 0 && $lastTicker == 0) {
			$hash->{'bits'} = $displayInfo{$client}{'forecastG'}[$topNowShowing{$client}];
		}
		$dispHash->{'screen1'} = $hash;
	}
	
	if ($currentAlarm && !$flash) {
		# schedule another update to remove the alarm symbol during alarm
		Slim::Utils::Timers::setTimer($client, Time::HiRes::time + 0.5, \&_flashAlarm);
	}
	
	return $dispHash;		
}

sub _flashAlarm {
	my $client = shift;
	
	$client->update( screensaverSuperDateTimelines($client, { flash => 1 }) );
}

sub cliQuery {
	my $request = shift;
 	my $client = $request->client();

	#Get mode param
	my $mode = $request->getParam('_mode');
	
	$log->debug("Inside CLI request: $mode");
	
	if ($mode eq 'all') {
		$request->addResult( "wetData", \%wetData );
		$request->addResult( "sportsData", \%sportsData );
		$request->addResult( "miscData", \%miscData );
	}
	elsif ($mode eq 'sports') {
		$request->addResult( "sportsData", \%sportsData );	
	}
	elsif ($mode eq 'selsports') {	
		my %selSportsData = ();

		for my $sport ( keys %sportsData ) {
			for my $game ( keys %{ $sportsData{$sport} } ) {
			        #Skip the sport logos as they're not actually games
				if($game eq 'logoURL') {
			            $selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
			            next;
			        }
				
				#Use dynamic var names instead?
				if ($sport eq 'MLB' && (scalar @MLBteams >0)) {
					if ((teamCheck($sportsData{$sport}{$game}{'homeTeam'},\@MLBteams)==1) || (teamCheck($sportsData{$sport}{$game}{'awayTeam'},\@MLBteams)==1)) {
						$selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
					}
				}
				elsif ($sport eq 'NBA' && (scalar @NBAteams >0)) {
					if ((teamCheck($sportsData{$sport}{$game}{'homeTeam'},\@NBAteams)==1) || (teamCheck($sportsData{$sport}{$game}{'awayTeam'},\@NBAteams)==1)) {
						$selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
					}
				}
				elsif ($sport eq 'NFL' && (scalar @NFLteams >0)) {
					if ((teamCheck($sportsData{$sport}{$game}{'homeTeam'},\@NFLteams)==1) || (teamCheck($sportsData{$sport}{$game}{'awayTeam'},\@NFLteams)==1)) {
						$selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
					}
				}
				elsif ($sport eq 'NHL' && (scalar @NHLteams >0)) {
					if ((teamCheck($sportsData{$sport}{$game}{'homeTeam'},\@NHLteams)==1) || (teamCheck($sportsData{$sport}{$game}{'awayTeam'},\@NHLteams)==1)) {
						$selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
					}
				}
				elsif ($sport eq 'CBB' && (scalar @CBBteams >0)) {
					if ((teamCheck($sportsData{$sport}{$game}{'homeTeam'},\@CBBteams)==1) || (teamCheck($sportsData{$sport}{$game}{'awayTeam'},\@CBBteams)==1)) {
						$selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
					}
				}
				elsif ($sport eq 'CFB' && (scalar @CFBteams >0)) {
					if ((teamCheck($sportsData{$sport}{$game}{'homeTeam'},\@CFBteams)==1) || (teamCheck($sportsData{$sport}{$game}{'awayTeam'},\@CFBteams)==1)) {
						$selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
					}
				}
				else { #Custom sport
					$selSportsData{$sport}{$game} = $sportsData{$sport}{$game};
				}
			}
			#print Dumper( \%selSportsData );
    		}

		$request->addResult( "selsports", \%selSportsData );	
	}	
	elsif ($mode eq 'weather') {
		$request->addResult( "wetData", \%wetData );
	}
	elsif ($mode eq 'wetmapURL') {
		$request->addResult( "wetmapURL", \%wetMapURLs );
	}
	elsif ($mode eq 'misc') {
		$request->addResult( "miscData", \%miscData );
	}
	else {
		$log->warn("Unknown CLI request: $mode");
	}

	$request->setStatusDone();
}

sub macroString {
	my $request = shift;
 	my $client = $request->client();

	$log->debug("Inside CLI request macroString");

	my $format = $request->getParam('format');
	my $period = $request->getParam('period');
		
	#Default period to 0 if not provided
	if (!defined $period) {$period = -1;}
	$log->debug("Incoming string: $format Period: $period");
	my $macroString = replaceMacrosPer($format, $period, $client);
	
	$log->debug("Outgoing string: $macroString");
	$request->addResult( "macroString", $macroString );

	$request->setStatusDone();
}

sub sdtVersion {
	my $request = shift;
 	my $client = $request->client();

	$log->debug("Inside CLI request sdtVersion");
		
        $request->addResult( "sdtVersion", $VERSION );

	$request->setStatusDone();
}

sub wetMapURLHash {
	my $type = shift;
	
	my %wetMapURLsType = ();

	for my $name ( keys %wetMapURLs ) {
		if ($wetMapURLs{$name}{'Type'} eq $type) {
			$wetMapURLsType{$name} = $type;
		}
	}

	return \%wetMapURLsType;
}

#External API to add a custom weather map
sub addCustomWeatherMap {
	my $name = shift;
	my $URL = shift;
	my $code = shift; #Code isn't very important for custom maps
	
	#For now won't check to ensure a non-custom map isn't being updated to allow overloading
	
	$wetMapURLs{$name}{'Type'} = 'Custom';
	$wetMapURLs{$name}{'Code'} = $code;
	$wetMapURLs{$name}{'URL'} = $URL;

	my $data = {
	    'state' => 'MapRefreshSuccess'
	};
			
	$log->debug('Custom weather map $name added.');
	#Notify any plugins/applets listening that maps updated
	Slim::Control::Request::notifyFromArray(undef,['SuperDateTimeState','dataRefreshState',$data]);
}

#External API to remove a custom weather map
sub delCustomWeatherMap {
	my $name = shift;

	if ($wetMapURLs{$name}{'Type'} eq 'Custom') {
		delete $wetMapURLs{$name};	
		
		my $data = {
		    'state' => 'MapRefreshSuccess'
		};
			
		$log->debug('Custom weather map $name deleted.');
		#Notify any plugins/applets listening that maps updated
		Slim::Control::Request::notifyFromArray(undef,['SuperDateTimeState','dataRefreshState',$data]);
	}
	else {
		$log->warn('Unable to delete non-custom' . $name . 'weather map.');
	}
}

#External API to add a custom sport score
#Should only be called during a dataRefresh
sub addCustomSportScore(\%) {
	my $params = shift;
	
	$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'gameTime'} = $params->{'gameTime'};
	$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'homeTeam'} = $params->{'homeTeam'};
	$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'homeScore'} = $params->{'homeScore'};
	$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'awayTeam'} = $params->{'awayTeam'};
	$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'awayScore'} = $params->{'awayScore'};
	
	if (defined $params->{'gameLogoURL'}) {
		$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'gameLogoURL'} = $params->{'gameLogoURL'};
	}

	if (defined $params->{'homeLogoURL'}) {
		$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'homeLogoURL'} = $params->{'homeLogoURL'};
	}
	
	if (defined $params->{'awayLogoURL'}) {
		$sportsData{$params->{'sport'}}{$params->{'gameID'}}{'awayLogoURL'} = $params->{'awayLogoURL'};
	}
}

#External API to add an icon for a custom sport
sub addCustomSportLogo {
	my $sport = shift;
	my $imgURL = shift;

	$sportsData{$sport}{'logoURL'} = $imgURL;
}

#External API to remove all sports scores and icon for a particular custom sport
#Should only be called during a dataRefresh
sub delCustomSport {
	my $sport = shift;
	
	delete $sportsData{$sport};
}

#External API to remove sports scores for a particular custom sport
#Should only be called during a dataRefresh
sub delCustomSportScore {
	my $sport = shift;
	my $gameID = shift;
	
	delete $sportsData{$sport}{$gameID};
}

#External API to add a custom display text by hash ref
#Should only be called during a dataRefresh
sub addCustomDisplayItemHash {
	my $group = shift;
	my $itemID = shift;
	my $itemHash_ref = shift;
	
	#Copy item hash into a new hash
	my %hash = %$itemHash_ref;

	$miscData{$group}{$itemID} = \%hash;
}

#External API to remove all display items for a custom group
#Should only be called during a dataRefresh
sub delCustomDisplayGroup {
	my $group = shift;
	
	delete $miscData{$group};
}

#External API to remove display items for a particular custom group
#Should only be called during a dataRefresh
sub delCustomDisplayGroupItem {
	my $group = shift;
	my $itemID = shift;
	
	delete $miscData{$group}{$itemID};
}



1;

__END__

# Local Variables:
# tab-width:4
# indent-tabs-mode:t
# End:
