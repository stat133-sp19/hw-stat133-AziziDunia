
## Data `nba2018-playerrs.csv`

Here's the description of the data variables:

- `period`: an NBA game is divided in 4 periods of 12 mins each. For example, a value
for period = 1 refers to the first period (the first 12 mins of the game).
- `minutes_remaining` and `seconds_remaining` have to do with the amount of time in
minutes and seconds, respectively, that remained to be played in a given period.
- `shot_made_flag` indicates whether a shot was made (y) or missed (n).
- `action_type` has to do with the basketball moves used by players, either to pass by
defenders to gain access to the basket, or to get a clean pass to a teammate to score a
two pointer or three pointer.
- `shot_type` indicates whether a shot is a 2-point field goal, or a 3-point field goal.
- `shot_distance`: distance to the basket (measured in feet).
- `x` and `y` refer to the court coordinates (measured in inches) where a shot occurred .

- `player`: name of the player.
- `team`: team name abbreviation (there are 32 teams).
- `position`: player position.
- `height`: hieght of player measured in inches.
- `weight`: weight of player measured in pounds.
- `age`: age of player measured in years.
- `experience`: years of experience in the NBA.
- `college`: college name.
- `salary`: salary (in dollars).
- `games`: number of games played during the regular season (max of 82 games).
- `minutes`: total number of minutes played during the regular season.
- `points`: total scored points.
- `points3`: number of 3-point field goals, worth 3 points each.
- `points2`: number of 2-point field goals, worth 2 points each.
- `points1`: number of free throws, worth 1 point each.


There are five types of player positions (see [wikipedia](https://en.wikipedia.org/wiki/Basketball_positions) for more details):

+ `PG`: point guard
+ `SG`: shooting guard
+ `SF`: small forward
+ `PF`: power forward
+ `C`: center

The values in `points` result from adding all scored points:

```r
points1 + (2 * points2) + (3 * points3)
```
