-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2018 at 11:30 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vesit`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `main_event_id` double NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `seed` int(11) NOT NULL DEFAULT '0',
  `gender` varchar(5) NOT NULL,
  `event_type` varchar(10) NOT NULL,
  `details` varchar(3000) NOT NULL,
  `max_participate` int(11) NOT NULL,
  `teams_in_one_match` int(11) NOT NULL,
  `eventhead` varchar(50) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `main_event_id`, `event_name`, `seed`, `gender`, `event_type`, `details`, `max_participate`, `teams_in_one_match`, `eventhead`) VALUES
(20, 1518253481807, 'Carrom Boys', 0, 'M', 'Indoor', 'Fouls\nWhen a player commits a foul, the turn comes to an end immediately and a penalty is incurred.  The penalty is that one pocketed piece is returned to the board by the opponent anywhere within the main circle.  Any other pieces requiring to be returned to the board are also placed within the main circle by the opponent.  It is normal for pieces to be positioned in order to confer an advantage for the opponent.\n\nA foul is recorded in the following situations:\n\nThe striker is pocketed.\nThe striker or any other piece leaves the board.\nA player pockets an opponent\'s piece.  If the Queen was also pocketed, it is returned to the centre by the opponent together with the penalty piece.  Any other pieces pocketed in the same strike remain pocketed. \nA player pockets the final opponent\'s piece.  Regardless of whether the Queen has been covered, the opponent\'s piece is returned to the centre in addition to the penalty piece.\nA player pockets the final piece before the Queen has been covered.  In this case both the pocketed piece and a penalty piece are returned to the centre.\nA player contravenes the rules for striking.\nA player touches any piece in play, other than the striker.\nThe first player to strike fails to break the counters in three attempts.\nWhere a penalty is incurred but no pocketed pieces exist to return, the penalty is \"owed\" until a piece becomes available.  If a penalty is owed, when a piece becomes available due to being pocketed, the piece is returned to the centre by the opponent at the end of the turn.  Should the opponent forget to do this before the start of the next turn, any owed penalties are lost.', 3, 2, 'none'),
(21, 1518253481807, 'Carrom Girls', 0, 'F', 'Indoor', 'Fouls\nWhen a player commits a foul, the turn comes to an end immediately and a penalty is incurred.  The penalty is that one pocketed piece is returned to the board by the opponent anywhere within the main circle.  Any other pieces requiring to be returned to the board are also placed within the main circle by the opponent.  It is normal for pieces to be positioned in order to confer an advantage for the opponent.\n\nA foul is recorded in the following situations:\n\nThe striker is pocketed.\nThe striker or any other piece leaves the board.\nA player pockets an opponent\'s piece.  If the Queen was also pocketed, it is returned to the centre by the opponent together with the penalty piece.  Any other pieces pocketed in the same strike remain pocketed. \nA player pockets the final opponent\'s piece.  Regardless of whether the Queen has been covered, the opponent\'s piece is returned to the centre in addition to the penalty piece.\nA player pockets the final piece before the Queen has been covered.  In this case both the pocketed piece and a penalty piece are returned to the centre.\nA player contravenes the rules for striking.\nA player touches any piece in play, other than the striker.\nThe first player to strike fails to break the counters in three attempts.\nWhere a penalty is incurred but no pocketed pieces exist to return, the penalty is \"owed\" until a piece becomes available.  If a penalty is owed, when a piece becomes available due to being pocketed, the piece is returned to the centre by the opponent at the end of the turn.  Should the opponent forget to do this before the start of the next turn, any owed penalties are lost.', 3, 2, 'none'),
(22, 1518253481807, 'Carrom Boys Seed 1', 1, 'M', 'Indoor', 'Fouls\nWhen a player commits a foul, the turn comes to an end immediately and a penalty is incurred.  The penalty is that one pocketed piece is returned to the board by the opponent anywhere within the main circle.  Any other pieces requiring to be returned to the board are also placed within the main circle by the opponent.  It is normal for pieces to be positioned in order to confer an advantage for the opponent.\n\nA foul is recorded in the following situations:\n\nThe striker is pocketed.\nThe striker or any other piece leaves the board.\nA player pockets an opponent\'s piece.  If the Queen was also pocketed, it is returned to the centre by the opponent together with the penalty piece.  Any other pieces pocketed in the same strike remain pocketed. \nA player pockets the final opponent\'s piece.  Regardless of whether the Queen has been covered, the opponent\'s piece is returned to the centre in addition to the penalty piece.\nA player pockets the final piece before the Queen has been covered.  In this case both the pocketed piece and a penalty piece are returned to the centre.\nA player contravenes the rules for striking.\nA player touches any piece in play, other than the striker.\nThe first player to strike fails to break the counters in three attempts.\nWhere a penalty is incurred but no pocketed pieces exist to return, the penalty is \"owed\" until a piece becomes available.  If a penalty is owed, when a piece becomes available due to being pocketed, the piece is returned to the centre by the opponent at the end of the turn.  Should the opponent forget to do this before the start of the next turn, any owed penalties are lost.', 1, 2, 'none'),
(23, 1518253481807, 'Carrom Boys Seed 2', 1, 'M', 'Indoor', 'Fouls\nWhen a player commits a foul, the turn comes to an end immediately and a penalty is incurred.  The penalty is that one pocketed piece is returned to the board by the opponent anywhere within the main circle.  Any other pieces requiring to be returned to the board are also placed within the main circle by the opponent.  It is normal for pieces to be positioned in order to confer an advantage for the opponent.\n\nA foul is recorded in the following situations:\n\nThe striker is pocketed.\nThe striker or any other piece leaves the board.\nA player pockets an opponent\'s piece.  If the Queen was also pocketed, it is returned to the centre by the opponent together with the penalty piece.  Any other pieces pocketed in the same strike remain pocketed. \nA player pockets the final opponent\'s piece.  Regardless of whether the Queen has been covered, the opponent\'s piece is returned to the centre in addition to the penalty piece.\nA player pockets the final piece before the Queen has been covered.  In this case both the pocketed piece and a penalty piece are returned to the centre.\nA player contravenes the rules for striking.\nA player touches any piece in play, other than the striker.\nThe first player to strike fails to break the counters in three attempts.\nWhere a penalty is incurred but no pocketed pieces exist to return, the penalty is \"owed\" until a piece becomes available.  If a penalty is owed, when a piece becomes available due to being pocketed, the piece is returned to the centre by the opponent at the end of the turn.  Should the opponent forget to do this before the start of the next turn, any owed penalties are lost.', 1, 2, 'none'),
(24, 1518253481807, 'Carrom Girls Seed 1', 2, 'F', 'Indoor', 'Fouls\nWhen a player commits a foul, the turn comes to an end immediately and a penalty is incurred.  The penalty is that one pocketed piece is returned to the board by the opponent anywhere within the main circle.  Any other pieces requiring to be returned to the board are also placed within the main circle by the opponent.  It is normal for pieces to be positioned in order to confer an advantage for the opponent.\n\nA foul is recorded in the following situations:\n\nThe striker is pocketed.\nThe striker or any other piece leaves the board.\nA player pockets an opponent\'s piece.  If the Queen was also pocketed, it is returned to the centre by the opponent together with the penalty piece.  Any other pieces pocketed in the same strike remain pocketed. \nA player pockets the final opponent\'s piece.  Regardless of whether the Queen has been covered, the opponent\'s piece is returned to the centre in addition to the penalty piece.\nA player pockets the final piece before the Queen has been covered.  In this case both the pocketed piece and a penalty piece are returned to the centre.\nA player contravenes the rules for striking.\nA player touches any piece in play, other than the striker.\nThe first player to strike fails to break the counters in three attempts.\nWhere a penalty is incurred but no pocketed pieces exist to return, the penalty is \"owed\" until a piece becomes available.  If a penalty is owed, when a piece becomes available due to being pocketed, the piece is returned to the centre by the opponent at the end of the turn.  Should the opponent forget to do this before the start of the next turn, any owed penalties are lost.', 1, 2, 'none'),
(25, 1518253481807, 'Carrom Girls Seed 2', 2, 'F', 'Indoor', 'Fouls\nWhen a player commits a foul, the turn comes to an end immediately and a penalty is incurred.  The penalty is that one pocketed piece is returned to the board by the opponent anywhere within the main circle.  Any other pieces requiring to be returned to the board are also placed within the main circle by the opponent.  It is normal for pieces to be positioned in order to confer an advantage for the opponent.\n\nA foul is recorded in the following situations:\n\nThe striker is pocketed.\nThe striker or any other piece leaves the board.\nA player pockets an opponent\'s piece.  If the Queen was also pocketed, it is returned to the centre by the opponent together with the penalty piece.  Any other pieces pocketed in the same strike remain pocketed. \nA player pockets the final opponent\'s piece.  Regardless of whether the Queen has been covered, the opponent\'s piece is returned to the centre in addition to the penalty piece.\nA player pockets the final piece before the Queen has been covered.  In this case both the pocketed piece and a penalty piece are returned to the centre.\nA player contravenes the rules for striking.\nA player touches any piece in play, other than the striker.\nThe first player to strike fails to break the counters in three attempts.\nWhere a penalty is incurred but no pocketed pieces exist to return, the penalty is \"owed\" until a piece becomes available.  If a penalty is owed, when a piece becomes available due to being pocketed, the piece is returned to the centre by the opponent at the end of the turn.  Should the opponent forget to do this before the start of the next turn, any owed penalties are lost.', 1, 2, 'none'),
(26, 1518254008681, 'Table Tennis Boys', 0, 'M', 'Indoor', 'A set is when one of the players or pairs first score 11 points. In the event that both players/pairs score 10 points, a set is be won by the first player/pair to gain a 2-point lead. A full match is won when a player or pair wins the best of any odd number of sets (3,5,7).\n\nA point is scored when:\n1. an opponent fails to make a correct service,\n2. an opponent fails to make a return,\n3. the ball touches any part of an opponent’s body,\n4. an opponent strikes the ball twice in succession,\n5. if an opponent, or anything an opponent wears, touches the playing surface or net during play,\n6. if a doubles opponent strikes the ball out of the sequence established by the first server and first receiver.', 3, 2, 'none'),
(27, 1518254008681, 'Table Tennis Girls', 0, 'F', 'Indoor', 'A set is when one of the players or pairs first score 11 points. In the event that both players/pairs score 10 points, a set is be won by the first player/pair to gain a 2-point lead. A full match is won when a player or pair wins the best of any odd number of sets (3,5,7).\n\nA point is scored when:\n1. an opponent fails to make a correct service,\n2. an opponent fails to make a return,\n3. the ball touches any part of an opponent’s body,\n4. an opponent strikes the ball twice in succession,\n5. if an opponent, or anything an opponent wears, touches the playing surface or net during play,\n6. if a doubles opponent strikes the ball out of the sequence established by the first server and first receiver.', 3, 2, 'none'),
(28, 1518254008681, 'Table Tennis Boys Seed 1', 1, 'M', 'Indoor', 'A set is when one of the players or pairs first score 11 points. In the event that both players/pairs score 10 points, a set is be won by the first player/pair to gain a 2-point lead. A full match is won when a player or pair wins the best of any odd number of sets (3,5,7).\n\nA point is scored when:\n1. an opponent fails to make a correct service,\n2. an opponent fails to make a return,\n3. the ball touches any part of an opponent’s body,\n4. an opponent strikes the ball twice in succession,\n5. if an opponent, or anything an opponent wears, touches the playing surface or net during play,\n6. if a doubles opponent strikes the ball out of the sequence established by the first server and first receiver.', 1, 2, 'none'),
(29, 1518254008681, 'Table Tennis Boys Seed 2', 1, 'M', 'Indoor', 'A set is when one of the players or pairs first score 11 points. In the event that both players/pairs score 10 points, a set is be won by the first player/pair to gain a 2-point lead. A full match is won when a player or pair wins the best of any odd number of sets (3,5,7).\n\nA point is scored when:\n1. an opponent fails to make a correct service,\n2. an opponent fails to make a return,\n3. the ball touches any part of an opponent’s body,\n4. an opponent strikes the ball twice in succession,\n5. if an opponent, or anything an opponent wears, touches the playing surface or net during play,\n6. if a doubles opponent strikes the ball out of the sequence established by the first server and first receiver.', 1, 2, 'none'),
(30, 1518254008681, 'Table Tennis Girls Seed 1', 2, 'F', 'Indoor', 'A set is when one of the players or pairs first score 11 points. In the event that both players/pairs score 10 points, a set is be won by the first player/pair to gain a 2-point lead. A full match is won when a player or pair wins the best of any odd number of sets (3,5,7).\n\nA point is scored when:\n1. an opponent fails to make a correct service,\n2. an opponent fails to make a return,\n3. the ball touches any part of an opponent’s body,\n4. an opponent strikes the ball twice in succession,\n5. if an opponent, or anything an opponent wears, touches the playing surface or net during play,\n6. if a doubles opponent strikes the ball out of the sequence established by the first server and first receiver.', 1, 2, 'none'),
(31, 1518254008681, 'Table Tennis Girls Seed 2', 2, 'F', 'Indoor', 'A set is when one of the players or pairs first score 11 points. In the event that both players/pairs score 10 points, a set is be won by the first player/pair to gain a 2-point lead. A full match is won when a player or pair wins the best of any odd number of sets (3,5,7).\n\nA point is scored when:\n1. an opponent fails to make a correct service,\n2. an opponent fails to make a return,\n3. the ball touches any part of an opponent’s body,\n4. an opponent strikes the ball twice in succession,\n5. if an opponent, or anything an opponent wears, touches the playing surface or net during play,\n6. if a doubles opponent strikes the ball out of the sequence established by the first server and first receiver.', 1, 2, 'none'),
(33, 1518254159771, 'Volleyball', 0, 'M', 'Outdoor', '6 players on the floor at any one time - 3 in the front row and 3 in the back row\nMaximum of 3 hits per side\nPoints are made on every serve for wining team of rally (rally-point scoring).\nPlayer may not hit the ball twice in succession. (A block is not considered a hit.)\nBall may be played off the net during a volley and on a serve.\nA ball hitting a boundary line is in.\nA ball is out if it hits an antennae, the floor completely outside the court, any of the net or cables outside the antennae, the referee stand or pole, the ceiling above a non-playable area.\nIt is legal to contact the ball with any part of a player’s body.\nIt is illegal to catch, hold or throw the ball.\nA player cannot block or attack a serve from on or inside the 10-foot line.\nAfter the serve, front-line players may switch positions at the net.\nMatches are made up of sets; the number depends on level of play. 3-set matches are 2 sets to 25 points and a third set to 15. Each set must be won by two points. The winner is the first team to win 2 sets. 5-set matches are 4 sets to 25 points and fifth set to 15. The team must win by 2 unless tournament rules dictate otherwise. The winner is the first team to win three sets.', 6, 2, 'none'),
(34, 1518254721295, 'Cricket', 0, 'M', 'Outdoor', 'There are a number of different ways a batsman can be given out in the game of cricket. When a bowler gets a batsman out it is said that the bowler gets a “wicket”. Following are the different ways a batsman can be given out according to the rules of cricket:\n\nBowled – Cricket rules state that if the ball is bowled and hits the striking batsman’s wickets the batsman is given out (as long as at least one bail is removed by the ball). It does not matter whether the ball has touched the batsman’s bat, gloves, body or any other part of the batsman. However the ball is not allowed to have touched another player or umpire before hitting the wickets.\nCaught – Cricket rules state that if a batsman hits the ball or touches the ball at all with his bat or hand/glove holding the bat then the batsman can be caught out. This is done by the fielders, wicket keeper or bowler catching the ball on the full (before it bounces). If this is done then cricket rules state the batsman is out.\nLeg Before Wicket (LBW) – If the ball is bowled and it hits the batsman first without the bat hitting it then an LBW decision is possible. However for the umpire to give this out he must first look at some of the factors stated in the cricket rules. The first thing the umpire need to decide is would the ball have hit the wickets if the batsman was not there. If his answer to this is yes and the ball was not pitched on the leg side of the wicket he can safely give the batsman out. However if the ball hits the batsman outside the line of off stump while he was attempting to play a stroke then he is not out.\nStumped – A batsman can be given out according to cricket rules when the wicketkeeper puts down his wicket while he is out of his crease and not attempting a run (if he is attempting a run it would be a runout).\nRun Out – Cricket rules state that a batsman is out if no part of his bat or body is grounded behind the popping crease while the ball is in play and the wicket is fairly put down by the fielding side.\nHit Wicket – Cricket rules specify that if a batsman hits his wicket down with his bat or body after the bowler has entered his delivery stried and the ball is in play then he is out. The striking batsman is also out if he hits his wicket down while setting off for his first run.\nHandled The Ball – Cricket rules allow the batsman to be given out if he willingly handles the ball with the hand that is not touching the bat without the consent of the opposition.\nTimed Out – An incoming batsman must be ready to face a ball or be at the non strikers end with his partner within three minutes of the outgoing batsman being dismissed. If this is not done the incoming batsman can be given out.\nHit The Ball Twice – Cricket rules state that if a batsman hits a ball twice other than for the purpose of protecting his wicket or with consent from the opposition he is out.\nObstructing The Field – A batsman is out if he willingly obstructs the opposition by word or action', 5, 2, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `event_head`
--

CREATE TABLE `event_head` (
  `row_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `game_id` int(11) NOT NULL,
  `start_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_id` int(11) DEFAULT NULL,
  `event_head_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gameteammapping`
--

CREATE TABLE `gameteammapping` (
  `game_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `rowid` int(11) NOT NULL,
  `schedule_id` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logindetails`
--

CREATE TABLE `logindetails` (
  `user_id` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `userpassword` varchar(50) DEFAULT NULL,
  `rolename` varchar(10) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `contact` varchar(12) DEFAULT NULL,
  `classroom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logindetails`
--

INSERT INTO `logindetails` (`user_id`, `username`, `userpassword`, `rolename`, `gender`, `contact`, `classroom`) VALUES
('aaditya.kulkarni@ves.ac.in', 'Aaditya Kulkarni', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9022298522', 'd4'),
('aakash.bhangale@ves.ac.in', 'Aakash Bhangale', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9004344473', 'd3'),
('aakash.patil@ves.ac.in', 'Aakash Patil', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '7276547998', 'd2c'),
('aamirkhalid.khan@ves.ac.in', 'AAMIR KHAN', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9869686622', 'd19c'),
('aarti.raghani@ves.ac.in', 'Aarti Raghani', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '8007312071', 'd12'),
('aarzu.shaha@ves.ac.in', 'aarzu shaha', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '8286593871', 'd18'),
('abhijeet.bhattacharya@ves.ac.in', 'Abhijeet	Bhattacharya', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9960798718', 'd13'),
('abhijith.nair@ves.ac.in', 'ABHIJITH	NAIR', 'caf86bdd8c3f7b30eea5bf58eddd5098a53c2622', 'normal', 'm', '9969288530', 'd5'),
('abhinav.sridhar@ves.ac.in', 'Abhinav Sridhar', 'e249d815e03f86cdbfb1a1c93e4bd3bd9619d7ce', 'normal', 'm', '9619428749', 'd3'),
('abhinav.valecha@ves.ac.in', 'abhinav valecha', 'e4122ac15d45a44320bdc1dd61041e13a51c54c9', 'normal', 'm', '9890848579', 'd18'),
('abhinav.verma@ves.ac.in', 'abhinav verma', '2f36787491bd48f5218d9f548d6ee38f05405b4d', 'normal', 'm', '7021918191', 'd17c'),
('abhishek.basalge@ves.ac.in', 'Abhishek Basalge', '2637f1c47a1c499a9c6dc36a3977decc9bf0bf7a', 'normal', 'm', '9594526339', 'd7'),
('abhishek.chaube@ves.ac.in', 'abhishek chaube', '89816ab1a827fac63ca988e0d20fd75b043fad85', 'normal', 'm', '8976626703', 'd17c'),
('abhishek.gurav@ves.ac.in', 'Abhishek Gurav', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9870580234', 'd13'),
('abhishek.kuvar@ves.ac.in', 'Abhishek Kuvar', '7c8d1a8174b2c481cc94f556df6dc88ee7425bf0', 'normal', 'm', '7506698934', 'd14C'),
('abhishek.nambiar@ves.ac.in', 'abhishek nambiar', '111d5a16f1044e6428c244a01a315df59e16bc15', 'normal', 'm', '9004361769', 'd9c'),
('abhishek.nemade@ves.ac.in', 'Abhishek Nemade', 'dc3d486837d299dd809bf00315fb0e8e0cb03bf6', 'normal', 'm', '9769047167', 'd14'),
('abhishek.patil6@ves.ac.in', 'Abhishek Patil', 'ded6990b573696c8b8ae1ff500358d2df4e25623', 'normal', 'm', '8689856000', 'd14'),
('abhishek.patil@ves.ac.in', 'Abhishek Patil', '1c718aabee594c2e4aaf45dd03f67ef45eafc82a', 'normal', 'm', '9820188335', 'd12'),
('abhishekkumar.mehta@ves.ac.in', 'Abhishek	 Mehta', '7740cfd013a5245f68e6479c0e2f84c6f114fb5f', 'normal', 'm', '9594551902', 'd12'),
('adarsh.chittilappilly@ves.ac.in', 'ADARSH	 CHITTILAPPILLY', '1bde863ba4af8dedd24e96ab8781d7c465f091e4', 'normal', 'm', '8097693435', 'd19c'),
('adesh.chavan@ves.ac.in', 'Adesh Chavan', '299bf80b092a4f81150f951ee137c8b8fd55c95b', 'normal', 'm', '8286821260', 'd8'),
('aditi.dixit@ves.ac.in', 'ADITI DIXIT', '8e3412bac04aacf3e1d0015d47f69c552731fc43', 'normal', 'f', '8108248611', 'd19c'),
('aditi.parab@ves.ac.in', 'Aditi	Parab', '5cb3557ec8cf5e3080ef96a819a6f7b1382dea67', 'normal', 'f', '8268321719', 'd12'),
('aditi.prabhudesai@ves.ac.in', 'aditi prabhudesai', 'fcc70fb2d6d943028a7c4ede1a05bd37484d0152', 'normal', 'f', '9922400469', 'mca1b'),
('aditi.sawant@ves.ac.in', 'Aditi Sawant', 'e25d97f504a30143b33615563ec5fb6dc1bd6507', 'normal', 'f', '9594945692', 'd6'),
('aditya.bhanage@ves.ac.in', 'ADITYA BHANAGE', '44a96606ddef817cb47223acf00f2ddcc6d0393a', 'normal', 'm', '7208214464', 'd9'),
('aditya.chandorkar@ves.ac.in', 'Aditya  Chandorkar', 'cbf6e0e688d0a97a637a26ff54d18f67be6da749', 'normal', 'm', '7558496898', 'd17'),
('aditya.gavane@ves.ac.in', 'Aditya Gavane', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9821270584', 'd20'),
('aditya.gogwekar@ves.ac.in', 'Aditya Gogwekar', '7075c811d97a027eaa5705ac0a59d45a960bd4d4', 'normal', 'm', '9969496297', 'd4'),
('aditya.krishnan@ves.ac.in', 'Aditya krishnan', '88ccf88c58d78d3aa9697f382c72b048a9a6f630', 'normal', 'm', '9769215694', 'd15'),
('aditya.subramanian@ves.ac.in', 'ADITYA MAKHIJA', '6898b33ccf071778cd1a7ab6cb8d5ad84c3fe352', 'normal', 'm', '9869002977', 'd12C'),
('aishwarya.aryamane@ves.ac.in', 'Aishwarya	 Aryamane', '5f8619ccd3798184a5ab3be31912abb9ef613b9a', 'normal', 'f', '9820342280', 'd15'),
('aishwarya.chandak@ves.ac.in', 'Aishwarya Chandak', 'd4fb94bc9beebe747c31cba2c7f229790dafb60b', 'normal', 'f', '9420623241', 'd13'),
('ajay.budhwani@ves.ac.in', 'Ajay  Budhwani', 'abbfcbe13a40ca118260268886f1ea46d0d4a773', 'normal', 'm', '9011140129', 'd9'),
('ajay.gurumurthy@ves.ac.in', 'AJAY GURUMURTHY', '9630825ec6b4368989ce1e625256a3ec8c576fb6', 'normal', 'm', '7715886965', 'd20'),
('ajinkya.deshmukh@ves.ac.in', 'Ajinkya Deshmukh', 'ffe563cb730b808efa5d800f8567d4fe58aa9638', 'normal', 'm', '9028419468', 'd17'),
('ajit.krishnamoorthy@ves.ac.in', 'ajit krishnamoorthy', 'f3f77b1136caccaf130775c86a08c6b843152d12', 'normal', 'm', '9167402275', 'd10'),
('ajitesh.singh@ves.ac.in', 'Ajitesh Singh', '62f1426ecebb446eb05f25beec3e1e7ba9cb39d2', 'normal', 'm', '7303088839', 'd11'),
('akash.ingle@ves.ac.in', 'Akash	Ingle', '019be03d9467d1ebd8b7b0601de1590a5e149ee0', 'normal', 'm', '9619957590', 'd8'),
('akash.katkar@ves.ac.in', 'Akash Katkar', '583ca58877db9d7cf0f077037430c479085a32f5', 'normal', 'm', '9769162784', 'd19'),
('akash.khiani@ves.ac.in', 'Akash khiani', 'd78dd49c8422da0f406b53fc0f65cf5f5dbed908', 'normal', 'm', '8007128530', 'd19'),
('akash.patil@ves.ac.in', 'Akash Patil', '556b99366335c9fb8b26e1b8bed68546393a5c44', 'normal', 'm', '9757052196', 'd9C'),
('akash.sarfare@ves.ac.in', 'akash sarfare', 'e89c1fe2eeba2b2772b5c22a4da8c7cc1dfe5127', 'normal', 'm', '8652351082', 'mca1b'),
('akshata.gupta@ves.ac.in', 'Akshata Gupta', 'f1419705b3cd05c54e864e0d230572f8e793c670', 'normal', 'f', '9920926843', 'd9'),
('akshata.mohite@ves.ac.in', 'Akshata Mohite', '061b36ebefec5a07981d2b3094488c64d69ba835', 'normal', 'f', '9930290315', 'd7C'),
('akshata.thorat@ves.ac.in', 'akshata thorat', 'e18120ab1fa37c9cd73fc7100962954d15a239cf', 'normal', 'm', '9833439081', 'MCA2A'),
('akshay.chidrawar6@ves.ac.in', 'Akshay Chidrawar', 'bebb0993c963fa0e39adefd7e236f98ad39cb52e', 'normal', 'm', '8433615172', 'd12C'),
('akshay.dhok@ves.ac.in', 'Akshay Dhok', '4f482923b7e928cf469f919d206708f6a9335f73', 'normal', 'm', '9773880986', 'd9'),
('akshay.gunani@ves.ac.in', 'Akshay	Gunani', '0219cd574db8fa9d2b879a61681c08187ec74d8a', 'normal', 'm', '9604221165', 'd15'),
('akshay.shelar@ves.ac.in', 'AKSHAY	SHELAR', '87e10ad9f554010f2aaa77989ad5be06550abcd0', 'normal', 'm', '9821120597', 'd7'),
('akshay.shetty@ves.ac.in', 'akshay shetty', '7b35e85ee1df4dd98d323e7715a7ed05df550107', 'normal', 'm', '9773681698', 'd9c'),
('akshaykumar.lilani@ves.ac.in', 'Akshaykumar Lilani', '458d5e8dc2fd730b057849cd1e23756ce1cf95c1', 'normal', 'm', '9049963060', 'd19'),
('ameya.andurekar@ves.ac.in', 'ameya andurekar', 'ecfe385625650d189093fda96108225514fba6e8', 'normal', 'm', '7700062132', 'mca1a'),
('ameya.bhave@ves.ac.in', 'Ameya Bhave', 'd3fba3f60dd1e5b71670d6a9ff4381492348933f', 'normal', 'm', '9920362891', 'd12C'),
('ameya.parab@ves.ac.in', 'ameya parab', 'e06cb002b396b81e686b1e0bd8427eefb4617f03', 'normal', 'm', '9930889285', 'd19'),
('amit.akshikar@ves.ac.in', 'amit akshikar', 'd233cced401f33175b700aed43a0fc4092ee7857', 'normal', 'm', '9167632182', 'mca1a'),
('amit.badlani@ves.ac.in', 'AMIT BADLANI', '75d3b9b612e3509a8e60170dd41f33a3035d5df8', 'normal', 'm', '8805080488', 'd10'),
('amit.fatnani@ves.ac.in', 'Amit Fatnani', '2757eaf7db8b0869f42347b52253e97bf3f9c0a9', 'normal', 'm', '9167633065', 'd20'),
('amit.nigade@ves.ac.in', 'AMIT NIGADE', '91d0908e1c3cefe704728c9232f48c709ecb612d', 'normal', 'm', '8767813433', 'd8'),
('amit.vishwakarma@ves.ac.in', 'amit vishwakarma ', '923154a739678f7cc6c1f8f0407775e86632452c', 'normal', 'm', '9167768276', 'MCA2B'),
('amit.vora@ves.ac.in', 'Amit	Vora', 'ca98e5947661729788b4b23a8a02594ca008cff1', 'normal', 'm', '8291224252', 'd5'),
('anagha.karmarkar@ves.ac.in', 'Anagha Karmarkar', 'b92b31f578a2a7dacd0c8f87d0c81e6d83276d6d', 'normal', 'f', '9930042927', 'd14C'),
('anand.vaswani@ves.ac.in', 'Anand	Vaswani', 'e4efa284221c0b8dbb63dd11eb1dffabf87d1158', 'normal', 'm', '8087196934', 'd11'),
('aneesh.gunda@ves.ac.in', 'Aneesh Gunda', '088a8f8e91faf5154c62927ff5c040d3e41704f9', 'normal', 'm', '9768736654', 'd19c'),
('aniket.a.chavan@ves.ac.in', 'ANIKET CHAVAN', 'cb75e1ad19800a1b0a89e0818d93ce7048723147', 'normal', 'm', '7507104793', 'd17'),
('aniket.jetwani@ves.ac.in', 'aniket  jetwani', 'dbb146b4d113a2238da9515d4c03808e27c3a927', 'normal', 'm', '9769554425', 'd16'),
('aniket.nair@ves.ac.in', 'Aniket Nair', '32c75a51b2fbb730f5ac48bb37e073273cca250b', 'normal', 'm', '9819574471', 'd14'),
('aniket.nighot@ves.ac.in', 'aniket nighot', 'fe468eaf392ffa006b670f1d928d8ad25f3e3487', 'normal', 'm', '9594037321', 'd19'),
('aniket.raut@ves.ac.in', 'Aniket Raut', '968bb18c3f0946ccd3f2370a2011de26c918de28', 'normal', 'm', '8898150194', 'd2'),
('anil.pradham@ves.ac.in', 'Anil Pradhan', '572f6764f08c1a1842e6c9d3f3d7a01af994e5bd', 'normal', 'm', '7028315568', 'd2'),
('anirudhmadhavan.sundararajan@ves.ac.in', 'anirudhmadhavan sundararajan', 'ca6c0df927a810f85725a9dd07c8af6c86adc920', 'normal', 'm', '9892449679', 'MCA2A'),
('anish.deshpande@ves.ac.in', 'Anish Deshpande', 'd3024320188b5902a8789f1acd396dbf3fbd9adb', 'normal', 'm', '9096729997', 'd17'),
('anisha.lalwani@ves.ac.in', 'Anisha Lalwani', '0a06ca76f4e17c61da9cd3e66fe65ad14756078c', 'normal', 'f', '9619779092', 'd7C'),
('anjali.jaisinghani@ves.ac.in', 'Anjali Jaisinghani', 'd566fa33d937be8f37eea13af12f85da857e3395', 'normal', 'f', '8806593595', 'd16'),
('anjali.patil@ves.ac.in', 'ANJALI PATIL', '462a9ff396f692d921631ff2c3d9b64ad10eba91', 'normal', 'f', '8422099008', 'd14'),
('anjali.wani@ves.ac.in', 'anjali wani', '97a2450f01e150795501dc0e38cafb1287b5213e', 'normal', 'f', '8097385387', 'd18'),
('anjana.manoj@ves.ac.in', 'anjana manoj', 'b04aa78ea81da6299de69bd6490d431e8b33b905', 'normal', 'f', '9004068334', 'd16'),
('ankit.ayyar@ves.ac.in', 'Ankit Ayyar', 'c8746dc0ec56519788cbfe1c41923e6573f62414', 'normal', 'm', '9167319648', 'd5'),
('ankit.kesharwani@ves.ac.in', 'Ankit Kesharwani', '9e93a967a83a603493bd0e3f46c57fb94608c04e', 'normal', 'm', '8286627830', 'd19'),
('ankit.shaw@ves.ac.in', 'Ankit	 Shaw', '3326f41af7064552bbe6c975a4b3fc4c46b6eb1e', 'normal', 'm', '9619674909', 'd11'),
('ankit.thakur@ves.ac.in', 'ankit thakur ', '54e7e33267a052a9bfa40a1ec263d3b8fb6a3ada', 'normal', 'm', '9920143301', 'MCA2B'),
('ankita.dharne@ves.ac.in', 'Ankita Dharne', '306f7fcdb2378c52061e82181e0b2b2d5c75971d', 'admin', 'f', '9975385556', 'd20'),
('ankita.gosain@ves.ac.in', 'Ankita Gosain', '9e6e36b0ef4bf2cf7948dd8ea7ad5585f16bdcb2', 'normal', 'f', '9833329295', 'd14C'),
('anshul.agarwal@ves.ac.in', 'ANSHUL AGARWAL', '71c05b59fdda905750394cf987cd81b49150f856', 'normal', 'm', '9022687556', 'd13'),
('anu.singhal@ves.ac.in', 'anu singhal', '3cbad0669b1f69cbce1e841c7a4558bfdadedf6b', 'normal', 'f', '9004550182', 'd9c'),
('anudyana.jaiswal@ves.ac.in', 'ANUDYANA JAISWAL', '1045632f095bae87343be7ee2b9ce7b6047e91b6', 'normal', 'f', '8655611138', 'd7'),
('anuja.suryawanshi@ves.ac.in', 'Anuja Suryawanshi', '762842e9e287378282ebac421f2ea1575e84f66c', 'normal', 'f', '7208100638', 'd10'),
('anusha.c@ves.ac.in', 'C Anusha', '6cd27d69d03a2b8f4aaf98edecb36986c7c743bc', 'normal', 'f', '9969960809', 'd1'),
('anwar.kazi@ves.ac.in', 'SAYYADANWAR KAZI', 'd4e1f5d66e5c8ca6a9573b9897b651b89162ab96', 'normal', 'm', '8286528841', 'd4'),
('apoorva.pathe@ves.ac.in', 'apoorva pathe', '45e004e0a33d8f297a306b43dea59926cbc75c57', 'normal', 'f', '9930118528', 'mca1b'),
('aradhana.gupta@ves.ac.in', 'Aradhana Gupta', 'c03bd5e9ab885f355cf25a80cff85a294bfb2ddb', 'normal', 'f', '9920684415', 'd1'),
('arbaz.kadri@ves.ac.in', 'Mohd Arbaz	 Kadri', 'ae6cea0a98f6e7e358027b0bcfcae3c1791c684a', 'normal', 'm', '8291864826', 'd8'),
('aroosa.ghole@ves.ac.in', 'AROOSA GHOLE', '18ca5934a57d7c8971cf48e6b1c634ce83c07b7e', 'normal', 'f', '9757485107', 'd6'),
('arpan.gulrajani@ves.ac.in', 'Arpan Gulrajani', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '7303447925', 'd20'),
('arpita.ambavane@ves.ac.in', 'Arpita	Ambavane', '2732041dbdb57b47305e18efaf674aeddc883acd', 'normal', 'f', '9004633243', 'd20'),
('arun.venkatachalam@ves.ac.in', 'arun venkatachalam', 'c0024d642494ee93dbcbf2efd81c505c6dec99dc', 'normal', 'm', '9619630562', 'd10'),
('ashish.mhatre@ves.ac.in', 'Ashish Mhatre', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9833999052', 'd14'),
('ashish.mishra@ves.ac.in', 'ASHISH	MISHRA', '2da94b098f02d410de17f6d8fc7f3631944ced72', 'normal', 'm', '9619511704', 'd7C'),
('ashishkumar.saiwal@ves.ac.in', 'Ashishkumar Saiwal', '2413234881497cd926543b24cf117988f565d3eb', 'normal', 'm', '8275556819', 'd2'),
('ashitosh.joshi@ves.ac.in', 'ashitosh joshi', '6a57052f9b458880cc713e0cc3798dff6240af5e', 'normal', 'm', '9167472178', 'd19c'),
('ashraf.hussain@ves.ac.in', 'Ashraf Hussain Sayyed', '4c8ad0072a0448a44a3b8a180e9f7ed7bc97ec7a', 'normal', 'm', '8689930341', 'd18'),
('ashutosh.deshmukh@ves.ac.in', 'ashutosh deshmukh', '263c21a1d89ead81da08c6f39773d5beee75f9e5', 'normal', 'm', '9822825429', 'mca1a'),
('ashutosh.upadhyay@ves.ac.in', 'ashutosh upadhyay ', 'd90fc104d6dc52219f2322bebc47be14307ba8b7', 'normal', 'm', '9967996391', 'MCA2A'),
('ashwini.elvar@ves.ac.in', 'Ashmini Elvar', '4f484af01799b2fc9169966c6f901936f712a689', 'normal', 'f', '9029482714', 'd17'),
('ashwini.mishra@ves.ac.in', 'Ashwini Mishra', '6d516e5c315f9c7a83419f5049d6f3e0eb60efcd', 'normal', 'f', '9833290145', 'd4'),
('ashwini.vedula@ves.ac.in', 'ashwini vedula ', '1bccc5d995032fd36515be3191a2f6e51667b149', 'normal', 'F', '9619270065', 'MCA2B'),
('ashwinikumar.gupta@ves.ac.in', 'Ashwini Kumar Gupta', 'b73c58bc15a71b4008778d3ee5309d8962868012', 'normal', 'm', '9022855673', 'd9'),
('asmita.kadam@ves.ac.in', 'asmita kadam', '6b1cec7818d3ddacf96bfe85b23d4a111087b640', 'normal', 'f', '8149259251', 'd17'),
('atul.bhalerao@ves.ac.in', 'ATUL	 BHALERAO', '6eedc8a2510dd902b22b8f5a4c752bf1e67319a2', 'normal', 'm', '9527098936', 'd7'),
('avinash.salian@ves.ac.in', 'Avinash Salian', '2f64b08996be72663423e5f18ca9ef4eb028b50f', 'normal', 'm', '7738482832', 'd14'),
('aysha.jagiasi@ves.ac.in', 'Aysha	Jagiasi', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '7066282572', 'd13'),
('ayush.kalla@ves.ac.in', 'Ayush Kalla', 'd22297eb95473593481f0e4d68d8102adae2913a', 'normal', 'm', '9619220943', 'd19'),
('ayush.shukla@ves.ac.in', 'Ayush Shukla', '7354317cb77b313bd05042152e8be53069e00082', 'normal', 'm', '9695490991', 'd2'),
('balaji.velmani@ves.ac.in', 'balaji velmani', 'd36180d6c605a333153886ff7cb977295987758b', 'normal', 'm', '9892207853', 'd10'),
('baljitsingh.chadha@ves.ac.in', 'BaljitSingh Chadha', 'b11ceee7110a91f279c28813cc15c92f91d04d52', 'normal', 'm', '9766240566', 'd12C'),
('bhagyashree.rohra@ves.ac.in', 'bhagyashree rohra', '8e71f6f3f2dd616f63ec2a844b184e73aa7ca37d', 'normal', 'f', '7758866600', 'mca1b'),
('bhagyesh.save@ves.ac.in', 'bhagyesh save', 'ff0dc23deb479b52977615e5cd656433d6a28c3d', 'normal', 'f', '9167220942', 'mca1b'),
('bharat.hariharan@ves.ac.in', 'bharat hariharan', '1ad9d07cfecb3e7793d5b5706c4fcaea31a919bb', 'normal', 'm', '9892142962', 'd17c'),
('bhaskar.talla@ves.ac.in', 'bhaskar talla', 'debc000f2f2d5fb5bd67f47efeb904c3b8864068', 'normal', 'm', '9870314385', 'MCA2B'),
('bhavana.malviya@ves.ac.in', 'Bhavana  Malviya', '65a03ccc4a5859c0e7819b56088816c54185506b', 'normal', 'f', '7506990136', 'd1'),
('bhavik.dand@ves.ac.in', 'Bhavik Dand', '23c8900397102671e3eeeebd9bd6e1ff0a918cd3', 'normal', 'm', '9322110007', 'd12C'),
('bhavna.khatwani@ves.ac.in', 'bhavna khatwani', 'a675a7399d5ef5e5c04fcf838132bdbf241bdcfb', 'normal', 'f', '9175823876', 'd19'),
('bhiva.gawade@ves.ac.in', 'Bhiva Gawade', '2eca6a7bfb4f516ab5e18c5888bd754c079b0705', 'normal', 'm', '9702221286', 'd3'),
('bilal.syed@ves.ac.in', 'Bilal Syed', '5c72182c63a660f5108d6e6f9ab235d84a566bb5', 'normal', 'm', '9969283012', 'd10'),
('bindesh.varma@ves.ac.in', 'Bindesh	Varma', '6cdd5b567ed97eea9bfa6dee9b1d0b630d11f116', 'normal', 'm', '8452894498', 'd2'),
('bushra.mukri@ves.ac.in', 'BUSHRA MUKRI', 'deee3c85be736117cd202758105718db9b077779', 'normal', 'f', '7506949872', 'd1'),
('chaitali.deshpande@ves.ac.in', 'chaitali deshpande', 'c4f45a9651d7843cf09de7563f1e1f01dabae38c', 'normal', 'f', '8976421871', 'mca1a'),
('chaitanya.attarde@ves.ac.in', 'Chaitanya Attarde', '1c1955457b844d4bc4677c562b9b814b58d680fb', 'normal', 'm', '7506847333', 'd3'),
('chaitanya.bhure@ves.ac.in', 'Chaitanya Bhure', 'f911b4e7c08320ee393460fefabeb443cb080161', 'normal', 'm', '9619046757', 'd3'),
('chayan.agrawal@ves.ac.in', 'chayan agrawal', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'admin', 'm', '9405412921', 'd20'),
('chetan.gupta@ves.ac.in', 'chetan	gupta', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '7208932397', 'd13'),
('chetan.mhaske@ves.ac.in', 'Chetan Mhaske', 'b5df5c0e2d97b70b013ae5a3eeae5544b76dfbb4', 'normal', 'm', '8108436034', 'd4'),
('chetan.motwani@ves.ac.in', 'chetan	motwani', 'a6ad3f9af1850de6957d107758f767ce17447dbe', 'normal', 'm', '7666634545', 'd12'),
('chhaya.patil@ves.ac.in', 'Chhaya Patil', 'ebc4c93f89096ef32cbec57adb0b2d9be9fb99ba', 'normal', 'f', '8082494722', 'd5'),
('chinmay.chitale@ves.ac.in', 'Chinmay Chitale', '2863838df3128170277c531e0dce15504e2984bf', 'normal', 'm', '9167787463', 'd9'),
('chinmayee.purohit@ves.ac.in', 'chinmayee purohit', '0022f7f3a6ff09b7565f782d99ead3baf6653476', 'normal', 'f', '9869915366', 'd9c'),
('danish.patel@ves.ac.in', 'DANISH PATEL', '0d12b162ec4fab7fcf432c0e3d689e7b054ab568', 'normal', 'm', '9076834479', 'd5'),
('darshan.dani@ves.ac.in', 'Darshan Dani', '0f510d58731a1bc191f58b5ec0be00a47a6e5a05', 'normal', 'm', '8879129905', 'd3'),
('darshana.jain@ves.ac.in', 'Darshana	 Jain', 'a9aacbc3063eb2ca9a24939ad46bfab50e68ed31', 'normal', 'f', '9930887847', 'd4'),
('deepa.tursani@ves.ac.in', 'deepa tursani', '18ff0752ea42e9c5bed26068eb353b2de9bd50e6', 'normal', 'f', '7720942905', 'd18'),
('deepak.desai@ves.ac.in', 'Deepak Desai', '99a9d72456ec16580fdf5e6e929ea565d17c47c5', 'normal', 'm', '8097589675', 'd9'),
('deepak.malik@ves.ac.in', 'deepak malik', '8f26bb7cf6abe8f72cd1b709faf3e7ed77450dff', 'normal', 'm', '9820688922', 'd9c'),
('deepanshu.garg@ves.ac.in', 'Deepanshu Garg', '4f78306f3820d3b916778f0ebdc66cbd3ded3ce3', 'normal', 'm', '7208294015', 'd15'),
('deepesh.garg@ves.ac.in', 'Deepesh	Garg', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '7208590487', 'd15'),
('deepika.khithani@ves.ac.in', 'Deepika  Khithani', 'a482877097c3e59ff8e2949a8c88ea182c08275d', 'normal', 'f', '9833300761', 'd7C'),
('deepkumar.magar@ves.ac.in', 'deepkumar magar', '8b3c4c0d4704114624f09839a886910afaa6d269', 'normal', 'm', '7045446685', 'mca1a'),
('deesha.ramchandani@ves.ac.in', 'Deesha	Ramchandani', 'e36af902002213678c1438fa4a8785d8a3d4d3c4', 'normal', 'f', '9619889420', 'd11'),
('devansh.khakhar@ves.ac.in', 'Devansh Khakhar', 'bf6e9ce765b96f8f32ff447f620757564a2a3a8d', 'normal', 'm', '9773463850', 'd7C'),
('devesh.manjrekar@ves.ac.in', 'Devesh Manjrekar', '7dff5efd875e4c311dc885e2eb0df110d043e5f9', 'normal', 'm', '9594381371', 'd1'),
('dhanashri.phatak@ves.ac.in', 'dhanashri phatak', '94a3dc0a4a3e2f67311f6e2bde005ae104067eca', 'normal', 'f', '9029002054', 'mca1b'),
('dheeraj.bhatia@ves.ac.in', 'dheeraj bhatia', 'f472f109adc0dace1a009f1d873ce83af5d6dfa6', 'normal', 'm', '7208226001', 'd17c'),
('dhiren.bathija@ves.ac.in', 'Dhiren Bathija', '163921c5c41cbec294fb06c1dadf71a361ae00c1', 'normal', 'm', '9552110555', 'd10'),
('dhiren.kewlani@ves.ac.in', 'Dhiren Kewlani', '8c290f32d1983ffccc24732ebe08175496268d76', 'normal', 'm', '8550955534', 'd19'),
('dhruva.aklekar@ves.ac.in', 'Dhruva Aklekar', 'a4745b55679cddf90aacc84070541d9a7666461b', 'normal', 'm', '7666383955', 'd3'),
('digvijay.mhasaye@ves.ac.in', 'digvijay mhasaye', 'a09166b5444e5afaf6a8c0b00eb77c42e3efdce0', 'normal', 'm', '9421761758', 'mca1a'),
('dinesh.ahuja@ves.ac.in', 'Dinesh Ahuja', '400a2f31d06ac43caf39e6396984e13e44cbe03d', 'normal', 'm', '7773959641', 'd13'),
('dinesh.nandi@ves.ac.in', 'Dinesh Nandi', '16e7eef15a717a1fef1341d2c357b27a17459678', 'normal', 'm', '9867988985', 'd12'),
('dinesh.panchi@ves.ac.in', 'DINESH PANCHI', '9f09f8cf1f2421d6f16f65652f819aeb1c95cac8', 'normal', 'm', '7738934774', 'd12'),
('dinesh.purswani@ves.ac.in', 'Dinesh	Purswani', '7f94be3b8ccf6e5ccd07ac579540cbb3cbd8f4ee', 'normal', 'm', '8879054030', 'd11'),
('dinesh.rupani@ves.ac.in', 'dinesh rupani', '6116ed2db186901efb9201fad2dc52d402f70f35', 'normal', 'm', '9730580474', 'd18'),
('dipika.jiandani@ves.ac.in', 'Dipika  Jiandani', '35c6e7e1a5b819bcec927b4994198967ef7f0294', 'normal', 'f', '9819728352', 'd14C'),
('dipin.bhudrani@ves.ac.in', 'Dipin Budhrani', '86e3663c8c53d4ef8ff6cd0922717fe51ce29c7f', 'normal', 'm', '8805487853', 'd12C'),
('divya.viswanath@ves.ac.in', 'Divya Viswanath', 'c1cd3c267eedf018eb619b7dc0d485b969d88c7d', 'normal', 'f', '9833730481', 'd14C'),
('divyesh.jain@ves.ac.in', 'DIVYESH JAIN', '2161d8cc4a29688306695e29c468d5185c48f3d2', 'normal', 'm', '9833193217', 'd17'),
('ej2012.abhishek.bane@ves.ac.in', 'Abhishek	Bane', 'bd590d3e021d17e3f90c23aa0437ed340cd41211', 'normal', 'm', '9820417588', 'MCA2B'),
('ekta.chawla@ves.ac.in', 'EKTA CHAWLA', '99a9736ced936f5e0831906a2e20ed7c72bd6116', 'normal', 'f', '8208294376', 'd12C'),
('falguni.pawar@ves.ac.in', 'Falguni Pawar', 'a679078a78406a0691827cb1924584f111eef1c5', 'normal', 'f', '9892372662', 'd5'),
('ganesh.anbhule@ves.ac.in', 'Ganesh Anbhule', '10121eb0e6053e2926d75ac82b8d53bed73aeda3', 'normal', 'm', '8108858353', 'd3'),
('ganesh.godamgave@ves.ac.in', 'Ganesh	Godamgave', '9d74801196ec60451d8d6f36d3e8395b8d6b3a27', 'normal', 'm', '9594444645', 'd19c'),
('ganesh.kukreja@ves.ac.in', 'Ganesh	Kukreja', '64df09c497a87c61c0bdf9cd02633cb458841fe0', 'normal', 'm', '9404049997', 'd12'),
('ganesh.patere@ves.ac.in', 'Ganesh	Patere', '9c8b7f4341ac79fb3c8c8da7cb819aa087df1786', 'normal', 'm', '9920738850', 'd8'),
('gaurav.belsare@ves.ac.in', 'gaurav belsare', 'aa2238879cdad8827e8acfc789804d9c0fae6629', 'normal', 'm', '8108020506', 'd17c'),
('gaurav.gianani@ves.ac.in', 'GAURAV GIANANI', 'f99964dc8f6745674e47eac9c7001fed84ea8ecd', 'normal', 'm', '9920662325', 'd14C'),
('gaurav.motihar@ves.ac.in', 'gaurav motihar', '3317419c2899f176da465d08bfcb910f503eb9cd', 'normal', 'm', '9022517774', 'd9c'),
('gaurav.singh@ves.ac.in', 'GAURAV	SINGH', 'b0c1c2d8578c23353d09883df38fa9dfda58d1a1', 'normal', 'm', '9004860528', 'd2'),
('gauresh.mestry@ves.ac.in', 'GAURESH MESTRY', '60a5f218a912f425d35dd00a791d6bd5f85af3c4', 'normal', 'm', '9768266059', 'd14'),
('gautam.pamnani@ves.ac.in', 'Gautam Pamnani', 'a0389d49dbc30abe37c7fba94adee97be326d94d', 'normal', 'm', '9011138339', 'd12'),
('gayatri.devadiga@ves.ac.in', 'GAYATRI DEVADIGA', '771c358afe188b722ce2fc712a78d9bd119c9208', 'normal', 'f', '8097694730', 'd3'),
('gayatri.mulchandani@ves.ac.in', 'Gayatri Mulchandani', '5055227bff821fd2e9a7e8f8351f7558e66ae650', 'normal', 'f', '9730778844', 'd12'),
('gayatri.pawar@ves.ac.in', 'GAYATRI PAWAR', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '9967880199', 'd12'),
('gayatri.ramrakhiani@ves.ac.in', 'Gayatri Ramrakhiani', '6cc35c1201772d2ba909a1aad05a926d0ec27f0d', 'normal', 'f', '9833955699', 'd2c'),
('gokul.kizhakkeppattu@ves.ac.in', 'Gokul Kizhakkeppattu', '197c104ed0acb5ed9a6556c90956063c23b14704', 'normal', 'm', '9869155588', 'd4'),
('gurneetsingh.banga@ves.ac.in', 'Gurneet Singh Banga', '471b81b6994fb5c4a24cf61d8f965feb597d1a89', 'normal', 'm', '9664726028', 'd3'),
('hanisha.jamtani@ves.ac.in', 'Hanisha Jamtani', '40e35de4e78130d32d8dd52c7c2cdbf4f28c2d0c', 'normal', 'f', '9867741745', 'd15'),
('hardik.patil@ves.ac.in', 'Hardik Patil', '5b13f3dce65b16d429fe12bb3ff1575861bc5854', 'normal', 'm', '9545007074', 'd9C'),
('haresh.khandaskar@ves.ac.in', 'HARESH KHANDASKAR', '86467c09da3685bfc84abc638f26a5191aa5169e', 'normal', 'm', '8446863018', 'd16'),
('harivenkatesh.murugesan@ves.ac.in', 'HARIVENKATESH murugesan', 'd9a9fdcefcc1cc25ff7e5a2dc8b2301066319993', 'normal', 'm', '9029186169', 'd19c'),
('harsh.rochlani@ves.ac.in', 'harsh rochlani', '51d50c889a0f0febc59d9e4b7e38fecaa0fe281d', 'normal', 'm', '9820719001', 'MCA2A'),
('harshada.hotwani@ves.ac.in', 'HARSHADA HOTWANI', '9d85d74d3d6fb5ed9689668fc7db53ac655d5b6f', 'normal', 'f', '8080793300', 'd13'),
('harshal.baviskar@ves.ac.in', 'HARSHAL BAVISKAR', 'a4c13f34cc994febd88dce5ddce05d1644f7ff35', 'normal', 'm', '8898411956', 'd7'),
('harshal.kadlak@ves.ac.in', 'Harshal Kadlak', '7cd5fff0368bf0f28cf3bd775b05023d8d11c2e2', 'normal', 'm', '8652134438', 'd4'),
('harshal.talele@ves.ac.in', 'harshal.talele@ves.ac.in', 'b439af49d5ff6b3d962757c98c3739d70d0d9bb9', 'normal', 'm', '9920870087', 'd17c'),
('harshal.talreja@ves.ac.in', 'Harshal Talreja', '1a3823596795dc05b0859341a0af7760eebd1132', 'normal', 'm', '9595919595', 'd11'),
('hashmeet.chaudhery@ves.ac.in', 'hashmeet chaudhery ', '14982e3218b6e3ade6219185fbfe94fe515a4354', 'normal', 'm', '9029604704', 'MCA2B'),
('hemant.date@ves.ac.in', 'Hemant Date', '24287a78485e32498ab5810079d8ece65ea1335a', 'normal', 'm', '8879289056', 'd5'),
('hemant.singh@ves.ac.in', 'hemant singh', 'ecddd06f7edd345573dcdf519d6caf9aa1a7236d', 'normal', 'm', '9833348608', 'mca1b'),
('himanshu.rawlani@ves.ac.in', 'Himanshu Rawlani', '7265fc3cba48baaf5213b534c34beccbd0e7c60b', 'normal', 'm', '9322596372', 'd6'),
('hitender.pahuja@ves.ac.in', 'Hitender Pahuja', '94295785fadc2a3b0d4833c94f70547259b289b3', 'normal', 'm', '9130428445', 'd2c'),
('hitendra.mhatre@ves.ac.in', 'Hitendra  Mhatre', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '8446398714', 'd14'),
('hitesh.balani@ves.ac.in', 'hitesh balani', '8f092070ddf88fc424e16df746781d47a6fd8178', 'normal', 'm', '8149290757', 'd17c'),
('hitesh.seedani@ves.ac.in', 'Hitesh Seedani', 'd1091dd36f59a2d997311ff6df837a031b0528bf', 'normal', 'm', '8149828059', 'd6'),
('hitesh.shahani@ves.ac.in', 'hitesh shahani', '5bbb808831f96c2bc779bed543d4572150337ffb', 'normal', 'm', '9699526262', 'd16'),
('hitesh.tewani@ves.ac.in', 'hitesh tewani ', '1df5aa910fbd1d766ef753801b1ef92d376d4d5e', 'normal', 'm', '7506479591', 'MCA2A'),
('isha.gondhalekar@ves.ac.in', 'Isha  Gondhalekar', '875f3efdfbd97f371a81877d1fe91c6222d228b9', 'normal', 'f', '9769406489', 'd1'),
('ishita.kekare@ves.ac.in', 'ISHITA KEKARE', '81adcfe49e7896c4f9a09ec038d1d3dfd3dc3ac9', 'normal', 'f', '9769136057', 'd16'),
('jai.amesar@ves.ac.in', 'JAI	AMESAR', 'f6f5242500a99f21681723a1eb7e5e2f3cc5ea29', 'normal', 'm', '8411013781', 'd13'),
('jai.hinduja@ves.ac.in', 'JAI HINDUJA', '09a5d772740afcc2b8c339774b9752637e74c6c7', 'normal', 'm', '7738111441', 'd20'),
('jaikumar.kukreja@ves.ac.in', 'Jaikumar Kukreja', '58bad614428e639fd6492fb6d261654769d21c1d', 'normal', 'm', '9049965408', 'd14C'),
('janhavi.tandale@ves.ac.in', 'janhavi tandale', '916204cd0224dc00f47b3d97f263fbf30424aba4', 'normal', 'f', '8689888522', 'd10'),
('jatin.sajnani@ves.ac.in', 'Jatin Sajnani', 'ecf802eff21cd67c2d6222f9ad4f6562e6cc2525', 'normal', 'm', '9552412300', 'd9C'),
('jayesh.bhatia@ves.ac.in', 'Jayesh Bhatia', '37e41c11d7c5ee4c9f7bb379e05252818fd3ade6', 'normal', 'm', '7387623876', 'd13'),
('jayesh.motwani@ves.ac.in', 'jayesh motwani', 'd23c2e76f8d9666e971d8eb6a2f3153760079835', 'normal', 'm', '8412818110', 'd19'),
('jayesh.nagpal@ves.ac.in', 'jayesh nagpal', '6a5c60cfc7e7f21071a940543d20f12569681cdf', 'normal', 'm', '9561488246', 'd19'),
('jayesh.saita@ves.ac.in', 'Jayesh Saita', '1e927ee01f533c5516e9b9b0eb56bf3194536cc6', 'normal', 'm', '9730598390', 'd6'),
('jayesh.sawale@ves.ac.in', 'Jayesh	Sawale', '93ac88dbad6a6c93fb8ed7c76cb70efed146c367', 'normal', 'm', '8655473702', 'd11'),
('jeetiksha.chandiramani@ves.ac.in', 'Jeetiksha Chandiramani', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '9167058445', 'd20'),
('jewel.murpani@ves.ac.in', 'KARAN	RUPREL', 'a7a3a6c864d539f97df3005c1108aca8b903af5b', 'normal', 'm', '9699283884', 'd11'),
('jigar.ajmera@ves.ac.in', 'Jigar Ajmera', '929a5923763d6392c391745be85c9f1a8d9c118f', 'normal', 'm', '9867297927', 'd15'),
('jimit.patel@ves.ac.in', 'JIMIT PATEL', '1b586ccfd948d6495654400a70586aaea979fdfd', 'normal', 'm', '9769457498', 'd14'),
('jitesh.h.ahuja@ves.ac.in', 'Jitesh Ahuja', 'd9257f0303f8396e6f983701d59ecdf6024efced', 'normal', 'm', '8806010475', 'd20'),
('jitesh.thazhak@ves.ac.in', 'jitesh thazhak', '5f60c5fd79162eb33016876de8d14db12f55a762', 'normal', 'm', '9029850593', 'd17c'),
('juhi.bhagtani@ves.ac.in', 'Juhi Bhagtani', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '9920710525', 'd13'),
('juhi.purswani@ves.ac.in', 'juhi purswani', '7323be30ed389a57c0bd8e690364a3a0a42b8613', 'normal', 'f', '9619220943', 'd16'),
('juilee.kulkarni@ves.ac.in', 'Juilee Kulkarni', '9d1a94c2372d63b8829d6d418c0de973735e59a0', 'normal', 'f', '9819058113', 'd7C'),
('jyoti.singh@ves.ac.in', 'Jyoti	Singh', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '8857893230', 'd11'),
('kadambari.kaskar@ves.ac.in', 'KADAMBARI KASKAR', 'bfeae935c6984b9e23f9c92ebaf31c0078e27f89', 'normal', 'f', '7302464313', 'd8'),
('kajal.khatwani@ves.ac.in', 'Kajal	Khatwani', '6c1462511f92d3503b50f90ffe38d3cc1bf6e780', 'normal', 'f', '8149983404', 'd7C'),
('kajol.chawla@ves.ac.in', 'Kajol Chawla', '9a63be0741523c6fa6892e870e990656ef82d1cb', 'normal', 'f', '8446645400', 'd12C'),
('kalpesh.juvekar@ves.ac.in', 'Kalpesh Juvekar', 'dd92efd493de821537342fe25471bd14872e3bb6', 'normal', 'm', '8149316305', 'd16'),
('kalyani.karmarkar@ves.ac.in', 'Kalyani Karmarkar', '601db5a3e7bfefae08ebb992f1e1abe0f490844f', 'normal', 'f', '9096042351', 'd12'),
('kanchan.manik@ves.ac.in', 'Kanchan Manik', 'ef7cb9189b7ffa9418021fbbfe93cc1da30faf07', 'normal', 'f', '9819708806', 'd12'),
('kanchan.tewani@ves.ac.in', 'Kanchan Tewani', '9ac1611dee9eddb14746ac8f44744d7e333f3acc', 'normal', 'f', '9527484168', 'd6'),
('kanwaljeetsingh.basur@ves.ac.in', 'Kanwaljeet singh Basur', 'fe61d9895db01db4fc650ec8bbb435a6c0d24465', 'normal', 'm', '7208561258', 'd10'),
('kapil.pawar@ves.ac.in', 'KAPIL PAWAR', 'f0f5306e56a7dc1462c552effb2e2f137463183d', 'normal', 'm', '9167369035', 'd2c'),
('karan.chhabria@ves.ac.in', 'Karan Chhabria', '7e25846ab7cad36d69db07a9e8f6342771878685', 'normal', 'm', '9320113356', 'd12C'),
('karan.murpana@ves.ac.in', 'karan murpana', '5cce487032cfb46b6a5a888607249e0127e89a69', 'normal', 'm', '7715943162', 'd19'),
('kashaf.momin@ves.ac.in', 'Mohd Kashaf	Momin', 'f32c1caf305730687ac43a78d30e175c88f93a84', 'normal', 'm', '9594556568', 'd5'),
('kashmira.raskar@ves.ac.in', 'Kashmira Raskar', '728cbf433c5ec8af5bacaff492d5fee92138b859', 'normal', 'f', '9768557317', 'd2c'),
('kaustubh.dhake@ves.ac.in', 'Kaustubh Dhake', 'b3895b3430316248edf14108eac9d6ac2e4453ec', 'normal', 'm', '8275709097', 'd3'),
('kaustubh.kulpe@ves.ac.in', 'Kaustubh Kulpe', '4b32b98b5a15b14d4fb9891ffcd9c102574c4739', 'normal', 'm', '8080690987', 'd16'),
('kaustubh.sawant@ves.ac.in', 'kaustubh sawant', 'd3cffa6de5a1bf0d02f441084907f512ffd3dac0', 'normal', 'm', '8422992281', 'mca1b'),
('kedar.deshpande@ves.ac.in', 'Kedar Deshpande', 'a9ff7fc8daaeae58cffde22bb47d91ea9873e7f9', 'normal', 'm', '9920438945', 'd9'),
('kedar.pednekar@ves.ac.in', 'KEDAR PEDNEKAR', 'a4f4cb1ef6b14b409a128944461b5a0c3061db08', 'normal', 'm', '9029445265', 'd1'),
('keyur.daswani@ves.ac.in', 'KEYUR DASWANI', 'be6971f3fdfce7e07a15db3a9ab463cad3a4a07a', 'normal', 'm', '8149486089', 'd9'),
('keyur.prabhu@ves.ac.in', 'Keyur Prabhu', 'cc05ed4ac2003f073f857d7083e0e29eed0f6d0b', 'normal', 'm', '9594148824', 'd12'),
('khushal.sahita@ves.ac.in', 'khushal sahita', 'c12b8b21a3ba881d0a9e6e3cb45a346be17c0879', 'normal', 'm', '8149540985', 'd9c'),
('kiran.parte@ves.ac.in', 'Kiran Parte', '6b2d64efa8cc974accd343cb14df8ebd562f3804', 'normal', 'm', '9967468497', 'd2c'),
('kiran.solapure@ves.ac.in', 'Kiran Solapure', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '9820756537', 'd11'),
('krima.shah@ves.ac.in', 'krima shah', 'a53d801335b7b56282135180deca0589cd40d4d4', 'normal', 'f', '8007152289', 'd18'),
('krishna.boddu@ves.ac.in', 'KRISHNA BODDU', '2bed87663d4c5c58a35fdf065098c7036795089f', 'normal', 'm', '9029585886', 'd15'),
('krishna.shahri@ves.ac.in', 'KRISHNA SHAHRI', '5766a393cb2a97001e82229f1922fe014d25c036', 'normal', 'm', '8452816575', 'd6'),
('krithika.srinivasan@ves.ac.in', 'Krithika  Srinivasan', 'b83dc4f59edc898f9bffbe705002dd402a8a552e', 'normal', 'f', '9820880514', 'd18'),
('krunal.kshirsagar@ves.ac.in', 'Krunal Kshirsagar', '90b52aeb01d80f304b5f982af9071edb2a0d1fec', 'normal', 'm', '8087987541', 'd1'),
('kshitija.vartak@ves.ac.in', 'Kshitija Vartak', '68372d70bf0f5382902f9a3b1f21b962ef6d2404', 'normal', 'f', '9619016644', 'd5'),
('kunaal.sidhwani@ves.ac.in', 'Kunaal Sidhwani', '3af95189e3557fa824f8b581c2e7dc5459fb4466', 'normal', 'm', '9619308785', 'd10'),
('kunal.dayaramani@ves.ac.in', 'Kunal	 Dayaramani', '9e655ae3ecd52bf345f19bc7ad71e3d16a83050f', 'normal', 'm', '9730644922', 'd20'),
('kunal.lahrani@ves.ac.in', 'kunal lahrani', '86d0bb5d52f8ba132cf98c635dffff1fbab831ac', 'normal', 'm', '8805403111', 'd19c'),
('kunal.someskar@ves.ac.in', 'KUNAL	 SOMESKAR', '6ecf786862fa390f6e39b6c03d89bca8f7e09ab5', 'normal', 'm', '9769394483', 'd2'),
('kunal.thadhani@ves.ac.in', 'kunal thadhani ', 'bd8515fba8b85d64c38324d45afca1cb81604d38', 'normal', 'm', '9156899048', 'MCA2A'),
('kundan.kumar@ves.ac.in', 'kundan kumar', 'af1b180350d592dc1c001f81fc6e66fe464ae71c', 'normal', 'm', '8898314498', 'mca1a'),
('kunwarkishan.singh@ves.ac.in', 'Kunwar Kishan Singh', 'c6380b473721ba7284c13a458e517e5d03bacf01', 'normal', 'm', '9773131058', 'd10'),
('kushal.bhosale@ves.ac.in', 'kushal bhosale ', 'b2bf606aac6e2a785116fe4a94256d3af0c5628d', 'normal', 'm', '9004226042', 'MCA2B'),
('lalit.pathak@ves.ac.in', 'Lalit Pathak', 'ca7b59ffb90b5e4863e5b6b4db59b6368e9119ff', 'normal', 'm', '9730714925', 'd9C'),
('lalita.shinde@ves.ac.in', 'lalita shinde', '32cb384dedbfab3ce1fc718dbba518063f91f46a', 'normal', 'f', '7666249118', 'mca1b'),
('latika.mhaskar@ves.ac.in', 'LATIKA MHASKAR', '53e850175ae2339646164c90bde15f8f779c6520', 'normal', 'f', '9167554490', 'd8'),
('laxmi.vazir@ves.ac.in', 'LAXMI VAZIR', '36f4a069f19a566f1de07c084b89b002aa381e8a', 'normal', 'f', '7758823820', 'd7'),
('leena.chavan@ves.ac.in', 'LEENA CHAVAN', 'fbc10ad4b5eda25d6cf1deb19ced7e6d1b6e5342', 'normal', 'f', '9892420273', 'd12C'),
('lorraine.dsouza@ves.ac.in', 'lorraine dsouza', '525ebd5c34c450289fe170c99d6970157a6d2e00', 'normal', 'f', '9920464769', 'mca1a'),
('mahek.choudhary@ves.ac.in', 'MAHEK CHOUDHARY', '26524ecbb8c359c7413c43061b9b2bbf4f9f8a24', 'normal', 'f', '9969145077', 'd9'),
('mahek.harwani@ves.ac.in', 'Mahek Harwani', '6c48f8b163861c1c2e38617e7342148033f213cb', 'normal', 'f', '8805457263', 'd9'),
('mahesh.parwani@ves.ac.in', 'mahesh parwani', 'ad6facb04d8e661d5fb0713c6afcda6393e19f91', 'normal', 'm', '8796503625', 'd19'),
('malvika.dagdu@ves.ac.in', 'Malvika Dagdu', '4cbb80e14f130e3d15679e5ccff90cd9804d541f', 'normal', 'f', '9819322836', 'd9'),
('manas.gangwani@ves.ac.in', 'Manas Gangwani ', 'c82249d81dd01c5efcc8d63b48aee63671111303', 'normal', 'm', '7798295405', 'd14C'),
('manasi.patil@ves.ac.in', 'manasi.patil@ves.ac.in', 'fd163c9c2c98239ef175a507fb68fa20705198cc', 'normal', 'f', '9757052150', 'mca1b'),
('mandar.kharde@ves.ac.in', 'Mandar Kharde', '248b89eb4d4426dd166ce88a4ba60085cca7a1ba', 'normal', 'm', '9820934083', 'd4'),
('mane.akshay@ves.ac.in', 'Akshay Mane', '09a228a801173ea714e2834f7d345ea8f7854683', 'normal', 'm', '9029003075', 'd4'),
('manish.chandwani@ves.ac.in', 'MANISH CHANDWANI', 'cc906df0f8fcbca3716430e2395b30ccc6c7ea75', 'normal', 'm', '8793248809', 'd15'),
('manish.madhwani@ves.ac.in', 'Manish Madhwani', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '8087344468', 'd12'),
('manish.panjwani@ves.ac.in', 'Manish Panjwani', '74c0882269abd93a4ff42320060a2cf99922849c', 'normal', 'm', '7039109245', 'd12'),
('manjiri.bhat@ves.ac.in', 'Manjiri Bhat', '7ea594179ace71ac12e3b9479f40276c610161b9', 'normal', 'f', '8879105570', 'd12C'),
('manoj.kamarajan@ves.ac.in', 'Manoj kamarajan ', 'd868f09e2c567c4c24784613eb9c157d5ae4212b', 'normal', 'm', '9819668793', 'd2c'),
('mansi.mistry@ves.ac.in', 'Mansi Mistry', 'c41bde8779929a871cdb05ab3fa882577a924285', 'normal', 'f', '9819014841', 'd4'),
('mansi.shivani@ves.ac.in', 'Mansi Shivani', 'c31029183ccaced2e26a39f8ffd807b4f9c0453c', 'normal', 'f', '9819636267', 'd6'),
('mayur.neve@ves.ac.in', 'mayur neve', '9edad27270ac7302512529778a1f224e403436d9', 'normal', 'm', '8862000060', 'd9c'),
('mayur.sawant@ves.ac.in', 'mayur sawant', '02b67cf049803f7fec234406387d24193b70e89e', 'normal', 'm', '9702389559', 'MCA2A'),
('mayuri.kate@ves.ac.in', 'Mayuri Kate', 'f0a2afe74f01c018a026ae34910ffd6c6b300652', 'normal', 'f', '7498043525', 'd7C'),
('meenu.bhatia@ves.ac.in', 'MEENU BHATIA', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '8888582524', 'd15'),
('megha.manglani@ves.ac.in', 'Megha Manglani', '93bb2f6139e0cc149dfb05c34e263f89d8bc59e9', 'normal', 'f', '8108823860', 'd12'),
('mihir.joshi1@ves.ac.in', 'Mihir Joshi', '339c81463eda0a03d165f201312b539847fad492', 'normal', 'm', '9167711441', 'd14C'),
('mihir.joshi@ves.ac.in', 'mihir joshi', '1f4f3bc2e3eeb2360346404acc41f74a2c8c375c', 'normal', 'm', '9820223634', 'd4'),
('mihir.pendse@ves.ac.in', 'Mihir Pendse', '5d6d0238f7041bf4d9e618008e00f604328d21b7', 'normal', 'm', '9757148299', 'd2c'),
('mihir.wagle@ves.ac.in', 'Mihir Wagle', '2b5c2e7e4b79a046ed4e952e1c834a6f5600fef1', 'normal', 'm', '9029055689', 'd9C'),
('mitali.nalawade@ves.ac.in', 'Mitali Nalawade', '3eb7952b2321769894ae706dd9f9436e5dc6c37f', 'normal', 'f', '9004882615', 'd2'),
('miten.solanki@ves.ac.in', 'miten solanki', '8d3c14a5c0da38d91eee13a17b021c0393ecfc7c', 'normal', 'm', '9773890704', 'd18'),
('mohak.bhangale@ves.ac.in', 'Mohak	 Bhangale', 'e7c88b0c62d6c9cc0fdb8e4307929695eb1b1a7b', 'normal', 'm', '9920757167', 'd17'),
('mohdabuhujair.khan@ves.ac.in', 'Mohd Abuhujair Khan', '7717035f45c11488264950be871f2307a7d31f50', 'normal', 'm', '9594874687', 'd19c'),
('mohini.saraf@ves.ac.in', 'mohini saraf', '46ef7e3e61a1c17198b586a594c3276772881438', 'normal', 'f', '9833958594', 'MCA2A'),
('mohit.ahuja16@ves.ac.in', 'MOHIT AHUJA', 'c0d2a0a0e36f2c97eb49a9d97c6113603ae68597', 'normal', 'm', '9765389895', 'd13'),
('mohit.ahuja@ves.ac.in', 'mohit ahuja', 'abd47c4460b84b4bc0e0fc36e98f5b8aaff26a9b', 'normal', 'm', '9004493447', 'd17c'),
('mohit.asrani@ves.ac.in', 'Mohit Asrani', '7401d643cea825eeb57c7c42f756c56408949af0', 'normal', 'm', '9922494672', 'd10'),
('mohit.lalwani@ves.ac.in', 'Mohit Lalwani', 'e575d925ad7a85d2ba5d4104bd46428a95d7275f', 'normal', 'm', '9699888955', 'd12'),
('mohitsingh.chauhan@ves.ac.in', 'Mohit Singh Chauhan', '14d5dbcb9364edbe028752d877d7fad662879a3c', 'normal', 'm', '9833878042', 'd9'),
('mohnish.katware@ves.ac.in', 'Mohnish Katware', '3a5ff1d752ac61ce90c6d6eb6e5a176ebede9fef', 'normal', 'm', '9673651166', 'd7C'),
('monal.daswani@ves.ac.in', 'Monal Daswani', '2bfbc2101628e23030ca1aa2137423c11e3ce2c2', 'normal', 'f', '9987226008', 'd12C'),
('mrinal.deshmukh@ves.ac.in', 'Mrinal Deshmukh', 'a4584e37f861261d7eb5db916168fe153eabb44a', 'normal', 'f', '7045282580', 'd19c'),
('mrudali.birla@ves.ac.in', 'Mrudali Birla', '39c560e26441b435ba5fa4adc10fb4e4e76362e6', 'normal', 'f', '9769214668', 'd12C'),
('mugdha.govilkar@ves.ac.in', 'Mugdha Govilkar', 'bdddb67ffed5aea4e5ac90c710694ea0c8d8772d', 'normal', 'f', '9820223916', 'd14C'),
('mukesh.arethiya@ves.ac.in', 'Mukesh Arethiya', 'b0eda3a2b3e34192df43d2ac812b72d505a14651', 'normal', 'f', '9892290227', 'd1'),
('mukul.ramchandani@ves.ac.in', 'MUKUL RAMCHANDANI', '49d54cce05b9a638b9458f2f115e4801f62e3e23', 'normal', 'm', '9405478104', 'd6'),
('murtaza.baj@ves.ac.in', 'murtaza baj ', '60a1733b09753605ccf4888d3eff6c048b76f063', 'normal', 'm', '9619970072', 'MCA2B'),
('mushir.khan@ves.ac.in', 'Mushir Ahmed	Khan', '69006793d9c761f61beb57050a0434ab6ce1556c', 'normal', 'm', '9768504880', 'd1'),
('nachiket.patwardhan@ves.ac.in', 'Nachiket Patwardhan', '32d76726a13a72cabdeef01fae67ddb5ff1be333', 'normal', 'm', '9405308807', 'd12'),
('nagarjuna.mutte@ves.ac.in', 'NAGARJUNA	MUTTE', '45a2a56aacebf08579c4292253e9181c5b69223a', 'normal', 'f', '8898826057', 'd2'),
('naglaxmi.yerra@ves.ac.in', 'naglaxmi yerra ', '4ca2b4fb80bbe7bf1d568098e922b72b567a1f5a', 'normal', 'f', '8879369302', 'MCA2B'),
('nalin.gangani@ves.ac.in', 'Nalin Gangani', '8e117770cbe8103480f7cf8da6217c4181954c2c', 'normal', 'm', '9664339179', 'd9'),
('narayan.mundhara@ves.ac.in', 'Narayan Mundhara ', 'b5c99b529855bf4b8703fabf40484719ed27d85a', 'normal', 'm', '7303520662', 'd12'),
('naveen.lamba@ves.ac.in', 'naveen lamba', 'ac9749308350c1ec7595d1b43497dfe898c5ed6c', 'normal', 'm', '9413550859', 'mca1a'),
('navin.kukreja@ves.ac.in', 'Navin Kukreja', 'ff204a470ca6908f739f2d9b3ec63f861d9fe39d', 'normal', 'm', '9881789742', 'd19c'),
('neel.shanbhag@ves.ac.in', 'neel shanbhag', '1bde585585464f57969ce776db17c44ccb403e99', 'normal', 'm', '8879693940', 'd9c'),
('neeraj.harjani@ves.ac.in', 'NEERAJ HARJANI', '8ad6501ef1e40b5764fcfb2a9040329b0339012e', 'normal', 'm', '9975651414', 'd20'),
('neeraj.jethnani@ves.ac.in', 'Neeraj	Jethnani', '6e7c85b65550191e8187494101a5695b075fa5f0', 'normal', 'm', '9920745441', 'd7C'),
('neeraj.nagpal@ves.ac.in', 'Neeraj Nagpal', '19b056dc9490a9c1c63f9ca5d1eb0a9342ce4215', 'normal', 'm', '9769798744', 'd12'),
('neeraj.premani@ves.ac.in', 'Neeraj Premani', 'c773c9f7fb4623f78059a86cb442436bf3f8b735', 'normal', 'm', '9623100200', 'd9C'),
('neha.menon@ves.ac.in', 'neha menon', 'd7c03cbd8720e0f9c8ab77d7e6c706ac396a1765', 'normal', 'f', '9833044570', 'mca1a'),
('neha.navale@ves.ac.in', 'Neha Navale', '3178b467ec3178e22b9ab276ed8ed16621873d31', 'normal', 'f', '8286416965', 'd12'),
('nehal.jahagirdar@ves.ac.in', 'Nehal Jahagirdar', '007414c6589c147ccae0144da4209ae632291b6c', 'normal', 'f', '7738200752', 'd4'),
('nihar.karle@ves.ac.in', 'Nihar Karle', '46977f05b19f2fc5b0b431116eab9068d7ade5bb', 'normal', 'm', '8898004099', 'd19'),
('niket.kanoongo@ves.ac.in', 'Niket Kanoongo', '7da1ceab1307944c9a891ac49144c9aaeb635fed', 'normal', 'm', '9987513897', 'd12'),
('nikhil.ahuja@ves.ac.in', 'Nikhil Ahuja', 'c41cb8864a9bc44fc63e402ca9ba3ef85bf1ba11', 'normal', 'm', '9029542162', 'd10'),
('nikhil.hassanandani@ves.ac.in', 'Nikhil Hassanandani', '706fed2465bf5fd62495f6f286d230895e3d80dc', 'normal', 'm', '9004583616', 'd9'),
('nikhil.neelam@ves.ac.in', 'Nikhil  Neelam', '9bf899146d5bbf92214df2a3913eba87211d4d26', 'normal', 'm', '9769177611', 'd14'),
('nikhil.ramgiri@ves.ac.in', 'Nikhil Ramgiri', 'ab6b0e15cc06e424abff6b6ebb4b22966d0f1636', 'normal', 'm', '8652157418', 'd5'),
('nikhil.shetty@ves.ac.in', 'nikhil shetty', 'a495baf42bf9701dd3d0d7750c024955c930932d', 'normal', 'm', '9819031293', 'd9c'),
('nikhil.vatwani@ves.ac.in', 'Nikhil Vatwani', '25d9a07c7e99e4e821712c642713025841e05585', 'normal', 'm', '9552799639', 'd9C'),
('nilesh.naik@ves.ac.in', 'Nilesh Naik', 'da398dd1e1645bef06f0557ed56921ec52ddbcb0', 'normal', 'm', '8286661680', 'd8'),
('nilima.pawar@ves.ac.in', 'Nilima	Pawar', '7b548f3f14a4b13de2c0c433aef2d78ad87a45b3', 'normal', 'f', '8793624033', 'd2'),
('nirnay.wankhede@ves.ac.in', 'nirnay wankhede', 'b345c5f593fd3fb88e8690d0c5e24eada91cd45d', 'normal', 'm', '9665496684', 'd10'),
('nisha.megnani@ves.ac.in', 'NISHA	MEGNANI', '3ce3aec34beec15740d495441265e8fbf889b3f6', 'normal', 'f', '9689481361', 'd12'),
('nisha.yadav@ves.ac.in', 'nisha yadav', 'f766dc5369168ba785005b7dc38988140c9ba4a5', 'normal', 'f', '7738903687', 'MCA2B'),
('nishit.rao@ves.ac.in', 'nishit rao', '2af075ed7738927c4669d3c6d271908d19cb2a2d', 'normal', 'm', '9819140209', 'd9c'),
('nita.chaudhari@ves.ac.in', '', 'c3f7403274d09b0d24cb34a382db145238913927', 'normal', 'f', '8286359560', 'd17c'),
('nitin.bishwakarma@ves.ac.in', 'nitin bishwakarma', '946f9b1a7f085453f64ac8fb3fa47aa39a4a40bc', 'normal', 'm', '7057811523', 'mca1a'),
('nitin.motwani@ves.ac.in', 'Nitin Motwani', '3092d6ef259616b0d93ec2f13a09b5f02114bfa1', 'normal', 'm', '8888599535', 'd12'),
('nitin.pandey@ves.ac.in', 'Nitin Pandey', '7498d88e6accfcc253a37264f43a084c1df3de4f', 'normal', 'm', '8108844973', 'd9C'),
('nitin.pandita@ves.ac.in', 'Nitin Pandita', '1141c10c0923702dd36c017731fd269a79f285d1', 'normal', 'm', '9619158437', 'd14'),
('nitin.rohira@ves.ac.in', 'nitin rohira', '34e69eef5e1341093018d5db64cf3fc8869c3850', 'normal', 'm', '8898335399', 'd16'),
('nitin.wadhwani@ves.ac.in', 'NITIN WADHWANI', '47cecdde9e798d75df5d8eb49d033a8118fd959e', 'normal', 'm', '8087653134', 'd11'),
('niyati.shriyan@ves.ac.in', 'niyati shriyan', 'f5838ca85877f28747a9c970f8afbf719a4b35ff', 'normal', 'f', '7666076161', 'MCA2A'),
('numan.patel@ves.ac.in', 'Numan Patel', '96fb005c21d7f2ef252391390662dd3c591509e8', 'normal', 'm', '8108978728', 'd5'),
('nupur.harmalkar@ves.ac.in', 'nupur harmalkar', 'f14705a0d0536ee5c4fa9a7f2d1eabe8c9132fea', 'normal', 'f', '9833367772', 'mca1a'),
('om.raheja@ves.ac.in', 'Om Raheja', 'dfa418c6352a9d5d5ae9b820a5e5c1b05824edf5', 'normal', 'm', '9820314172', 'd2c'),
('om.samal@ves.ac.in', 'om samal', 'b89fa2fe286380912173ff7d99985ae33a1c034d', 'normal', 'm', '9969262254', 'MCA2A'),
('omkar.inamdar@ves.ac.in', 'Omkar Inamdar', '9f3276c2fa4623ff43a9f5c9836f29bf691548a3', 'normal', 'm', '9768775167', 'd17'),
('omkar.joshi@ves.ac.in', 'omkar joshi', '3d1272796d1fb9e98a09d48e04f7dcf501a98995', 'normal', 'm', '9757436189', 'mca1b'),
('omkar.kamble@ves.ac.in', 'Omkar Kamble', '17d80d09562b958748134cec99237238057ce2b3', 'normal', 'm', '9821032180', 'd17'),
('padmaja.kolle@ves.ac.in', 'Padmaja	Kolle', 'c41028da08b3fd1784ed31362598d18258736393', 'normal', 'f', '8108410294', 'd14C'),
('pankaj.sharma@ves.ac.in', 'pankaj sharma', '19ea73696d0eefe0f9927875cd84b702cb0d4c01', 'normal', 'm', '7208461446', 'mca1b'),
('pankaj.shelar@ves.ac.in', 'Pankaj Shelar', '1812a190a5509e553131cb8d9502ad347dd598e1', 'normal', 'm', '7506582625', 'd7'),
('paresh.kalinani@ves.ac.in', 'Paresh	Kalinani', 'ac3e3e269607a5aa43b922a53f4e8742e5880be8', 'normal', 'm', '9004983516', 'd12'),
('parika.rawat@ves.ac.in', 'Parika Rawat', '11f95db7fb7564c626de7e5f3054871c74fa131d', 'normal', 'f', '9769488457', 'd2c'),
('parmeensingh.bindra@ves.ac.in', 'ParmeenSingh Bindra', '22e611771781066d911a666b99427fae09464fe5', 'normal', 'm', '9049399400', 'd3'),
('pavan.chhatpar@ves.ac.in', 'PAVAN CHHATPAR', '07b1d638e372db23233c4e87b7612b1c5559f1d9', 'normal', 'm', '9167142995', 'd13'),
('pavan.yadav@ves.ac.in', 'PAVAN YADAV', 'aa57b2bb3fa4e11dd508e031167368b612e6d00a', 'normal', 'm', '9167478136', 'd7'),
('pawan.ahuja@ves.ac.in', 'Pawan Ahuja', '701dc55a7f1915ce79673b855ed8425f3d590a4a', 'normal', 'm', '7208202737', 'd12C'),
('pawan.patil@ves.ac.in', 'Pawan Patil', '458c86459655acdf96acb1269c988ec036751e14', 'normal', 'm', '9869102150', 'd2'),
('pawan.tilwani@ves.ac.in', 'pawan tilwani', 'fdaa106ade8bef535a18950c6fe4678cda5152b3', 'normal', 'm', '9970881086', 'd18'),
('pawankumar.bhatla@ves.ac.in', 'PAWAN BHATLA', '0849f5b044dfe09e05a3caeeff68c218b339e704', 'normal', 'm', '9167072904', 'd17'),
('pawar.akshay@ves.ac.in', 'Akshay Pawar', 'a8765736af22de66a6396db821040cb0a4edba09', 'normal', 'm', '9768226360', 'd5'),
('payal.popat@ves.ac.in', 'payal popat', 'f70ad8182eed7246e13a0c537be87ade8e56c393', 'normal', 'f', '9028600523', 'd19'),
('piyush.devikar@ves.ac.in', 'Piyush Devikar', '781f704cf3219b71686d90e1439b77877fd8e5e5', 'normal', 'm', '9930610568', 'd9'),
('piyush.gidwani@ves.ac.in', 'PIYUSH GIDWANI', 'f0dbe455cb895922659c3984188728c4def4fcc5', 'normal', 'm', '8180007601', 'd13'),
('piyush.honale@ves.ac.in', 'PIYUSH	HONALE', '4015c30fb525d63f3761276126ba7f4a09cd9a15', 'normal', 'm', '9168455918', 'd19c'),
('pooja.ahuja@ves.ac.in', 'Pooja Ahuja', '464129a6699cd94869cfa0c35479be39d484dcae', 'normal', 'f', '9833913981', 'd10'),
('pooja.anoj@ves.ac.in', 'pooja anoj', '151a3dd932873fb924fc5cf66361a070d3d0dc58', 'normal', 'f', '9664275579', 'mca1b'),
('pooja.bhatia@ves.ac.in', 'Pooja Bhatia', '2d12d66aa84cd766c1e12dee0ddd2ffc5546c792', 'normal', 'f', '8805259599', 'd15'),
('pooja.dhoble@ves.ac.in', 'pooja dhoble', '8894dd5cac5550e51b3cdfdd6b3a2b87e3133839', 'normal', 'f', '9967505200', 'd17'),
('pooja.hande@ves.ac.in', 'Pooja Hande', 'c85c96ab05b376ca498f7b67ad3411c3a7578582', 'normal', 'f', '9004396089', 'd15'),
('pooja.kamble@ves.ac.in', 'pooja kamble', 'c6ad8da6774c20cfd4b4fd6d90163daed05e4c1f', 'normal', 'f', '9833236057', 'mca1a'),
('pooja.more@ves.ac.in', 'Pooja More', '032056a0ca8548dd7de3110c64d0a9e74df38017', 'normal', 'f', '9769214083', 'd8'),
('pooja.pawar@ves.ac.in', 'POOJA PAWAR', '022e2b149f03bc5c2af71b13940a161a15228be8', 'normal', 'f', '9769324061', 'd1'),
('pooja.vsingh@ves.ac.in', 'pooja singh', 'dbdf1e70026e64ec226267344ca37f2e1f0579d8', 'normal', 'f', '9870566811', 'd18'),
('poonam.yadav@ves.ac.in', 'poonam	yadav', 'eb10e2881c1ff1c425ac9891ea595a55cf5c8f26', 'normal', 'f', '9768539736', 'd5'),
('prachi.gupta@ves.ac.in', 'Prachi Gupta', '9b62de5f46ac45b6cfaa27d8e55722c1a31c082f', 'normal', 'f', '7666555390', 'd9'),
('pradnya.pujare@ves.ac.in', 'Pradnya	 Pujare', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '9819574232', 'd14'),
('prajakta.bhosale@ves.ac.in', 'PRAJAKTA BHOSALE', 'd8e3426e8d208774594098b2a4b5f39a3514d555', 'normal', 'f', '9892128436', 'd7'),
('prajakta.kamer@ves.ac.in', 'prajakta kamer', '82aa1216e58d31fe8ed5e591227e45f03cc88ea9', 'normal', 'f', '9920202759', 'd19c'),
('pramod.mehta@ves.ac.in', 'Pramod Mehta', 'b58a452229c2ceb6c71a0df0b71e27cea2565d39', 'normal', 'm', '9820833594', 'd14'),
('pranav.parab@ves.ac.in', 'PRANAV	PARAB', '500abecc017f1d83f41283e0a12d37cb9184668d', 'normal', 'm', '9757438661', 'd12'),
('pranay.mahaldar@ves.ac.in', 'Pranay Mahaldar', 'b0dad19798b23ac342efb98901c4cefaeb3470db', 'normal', 'm', '7715930483', 'd4'),
('pranit.kotgire@ves.ac.in', 'Pranit Kotgire', 'c5129bb5f2070f8f9b1cbc11c077f531151a726b', 'normal', 'm', '9890351905', 'd16'),
('pranit.shetty@ves.ac.in', 'pranit shetty', '3a0deceba5ef72937af4915013265ccb4f6cd5f8', 'normal', 'm', '9757074975', 'MCA2A'),
('prasanna.biswas@ves.ac.in', 'Prasanna	Biswas', 'e0f1822a1f6ab4ab6b021428ce92468c86dcdb90', 'normal', 'm', '9922365239', 'd13'),
('prashant.dombale@ves.ac.in', 'Prashant	Dombale', '32a6e9234abe2a62b24fea3774899b6b209fcc5b', 'normal', 'm', '9867517117', 'd13'),
('prashant.sivasubramanian@ves.ac.in', 'PRASHANT sivasubramanian', 'c155ebee48997102038a19890d495eeed96cd1ec', 'normal', 'm', '9820878072', 'd2c'),
('prathamesh.chaudhari@ves.ac.in', 'Prathamesh Chaudhari', '073fe6f4c19b3784aa7c491d2de8f6bcccedcfad', 'normal', 'm', '9821744972', 'd3');
INSERT INTO `logindetails` (`user_id`, `username`, `userpassword`, `rolename`, `gender`, `contact`, `classroom`) VALUES
('prathamesh.rane@ves.ac.in', 'Prathamesh Rane', '9216b9e7ede97ab0396ee0e76d780ab7bf9955ff', 'normal', 'm', '9757439790', 'd2c'),
('prathmesh.kale@ves.ac.in', 'Prathmesh Kale', '849686db3b61d3e0bb8949329eb2e818ce57fa1b', 'normal', 'm', '9619461389', 'd17'),
('pratidnya.chaher@ves.ac.in', 'pratidnya chaher', 'b544d8511027988ae4d1822cf87e5645cbcb8cb5', 'normal', 'm', '9594909621', 'MCA2B'),
('pratik.brid@ves.ac.in', 'PRATIK BRID', '390cd2c745d986fd6e3e694df1a230254bce85b9', 'normal', 'm', '9819099681', 'd3'),
('pratik.gurnani@ves.ac.in', 'Pratik Gurnani', 'ee830ad5ca36b094cd1b9434244d224d3edbee89', 'normal', 'm', '9930942932', 'd15'),
('pratik.nichat@ves.ac.in', 'Pratik Nichat', '27effcff369ee84f67141a2b9367ba06633b5d54', 'normal', 'm', '9664994910', 'd12'),
('pratik.talreja@ves.ac.in', 'Pratik Talreja', '3d66bde3bddcdcbf1769b6b554b23f6c5703b2b4', 'normal', 'm', '8007789903', 'd11'),
('pratik.walase@ves.ac.in', 'PRATIK	WALASE', 'e10f5c852ac9ddff7354ba1f062e742cfab8fa8c', 'normal', 'm', '7208884386', 'd7'),
('pratik.watwani@ves.ac.in', 'Pratik	Watwani', '2a4b2d57945b72cf271430edc6c2f3b98b1be093', 'normal', 'm', '7709796200', 'd11'),
('praveen.dung@ves.ac.in', 'PRAVEEN DUNG', 'e3746966c2ebe8a8fe7feadea9bad73d4b04b034', 'normal', 'm', '8767662291', 'd14C'),
('pravin.tahiliani@ves.ac.in', 'PRAVIN	TAHILIANI', 'e2773b280967aafe4eb141db587200fc1898fbc1', 'normal', 'm', '9004195884', 'd11'),
('pravin.tripathi@ves.ac.in', 'Pravin Tripathi', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '8108787884', 'd11'),
('preeti.ramesh@ves.ac.in', 'preeti ramesh', 'e7fe23a6eec72f6bd4839127625622fb7d187693', 'normal', 'f', '9920380273', 'mca1b'),
('prem.chachlani@ves.ac.in', 'Prem Chachlani', '0d12c342f5cd5cb55810e5de1515d3d1764390e6', 'normal', 'm', '8806344161', 'd12C'),
('prem.kalwani@ves.ac.in', 'Prem Kalwani', '71bd096b1785ca64834328db0bd5db2dff12f698', 'normal', 'm', '8655211780', 'd7C'),
('pritesh.shivkar@ves.ac.in', 'PRITISH	 SHIVKAR', 'db025c76d2d714078738841eb006a6b41644c7c9', 'normal', 'f', '9594719088', 'd7'),
('priyanka.bolave@ves.ac.in', 'Priyanka Bolave', 'd5b27769cc17f3f82f490c1d7b523da8f142aedf', 'normal', 'f', '7039865114', 'd1'),
('priyanka.huligol@ves.ac.in', 'Priyanka Huilgol', 'bcb0ff7cfa2788e287e57d8f7737dcddbd0a6906', 'normal', 'f', '8879837543', 'd1'),
('priyanka.pawar@ves.ac.in', 'PRIYANKA PAWAR', 'b9e7fa56ac5f378606e908599b4c4ab78ae5f01c', 'normal', 'f', '9969380862', 'd5'),
('priyanka.wadhwani@ves.ac.in', 'Priyanka Wadhwani', '46c0a81b75d8486be302dd2ec7a17ca06f867a9c', 'normal', 'f', '8793232170', 'd9C'),
('punit.kulal@ves.ac.in', 'punit kulal', '23506585756f55f7f2b5977f4a0ff28db47bf854', 'normal', 'm', '8976359178', 'd19'),
('rachita.fatehpuria@ves.ac.in', 'Rachita Fatehpuria', 'c6891a8a5dd9462db8973ed8783fac25120c7a60', 'normal', 'f', '8652441990', 'd14C'),
('radhika.raghuwanshi@ves.ac.in', 'Radhika Raghuwanshi', 'deab95a8f373bcfe0565ebbc72c22065fe97be6d', 'normal', 'f', '9004552343', 'd16'),
('raghav.jhawar@ves.ac.in', 'Raghav Jhawar', '7f87549cc6d7d23e0ad0ccdce95ae8df180c5d91', 'normal', 'm', '9404297997', 'd16'),
('rahul.chawla@ves.ac.in', 'rahul chawla', 'b2723ee1435c83788ad77b2a2d947f0feb39ea5c', 'normal', 'm', '8983120819', 'd17c'),
('rahul.datir@ves.ac.in', 'Rahul Datir', '8934caea2707912d558a62e8f2d57324b93494a4', 'normal', 'm', '7738510735', 'd9'),
('rahul.dudhande@ves.ac.in', 'RAHUL DUDHANDE', '6c91ea12d2063a9b1b0123a2d06fc3acee0ac0df', 'normal', 'm', '8805962395', 'd3'),
('rahul.kalwar@ves.ac.in', 'Rahul Kalwar', '71320e74a704efb27105b46c4627bab4a8a12edf', 'normal', 'm', '9619320474', 'd4'),
('rahul.nagdev@ves.ac.in', 'RAHUL NAGDEV', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9922974725', 'd12'),
('rahul.shetty@ves.ac.in', 'rahul shetty', '02192e6f2034a60babe09c1bc072f04e181c1b70', 'normal', 'm', '8655189780', 'd18'),
('rahul.talwar@ves.ac.in', 'rahul talwar ', '6359a33f6176144b221eef75953ee00ea3ced5ab', 'normal', 'm', '7738930300', 'MCA2A'),
('raj.ahuja@ves.ac.in', 'raj ahuja', '3551aef5a62aba4a9038fb6f0928a9206ce6e39b', 'normal', 'm', '9765203510', 'd17c'),
('raj.ramchandani@ves.ac.in', 'Raj Ramchandani', '90a486885f897c2b049f7d319ca6b45e9bc1968b', 'normal', 'm', '9920260761', 'd16'),
('rajan.gawas@ves.ac.in', 'RAJAN GAWAS', '807d645d6c9f783c7740f327751c84b9f8c7dbe8', 'normal', 'm', '9167075170', 'd8'),
('rajeevkumar.yadav@ves.ac.in', 'Rajeevkumar	 Yadav', '029535c9ab33e7f9bd666337454a179866709623', 'normal', 'm', '9657583510', 'd18'),
('rajiv.yadav@ves.ac.in', 'RAJIV YADAV', '2287a5b9719e9030904393bc69938778202f232b', 'normal', 'm', '9768128648', 'd7'),
('rakshita.parvatikar@ves.ac.in', 'RAKSHITA PARVATIKAR', '23205b3426bb18c60b6eaae20b3d69083b6fe673', 'normal', 'f', '8291214520', 'd2c'),
('ram.motwani@ves.ac.in', 'ram motwani', 'b0a4ddcdaf1d965a71adc905b1fcb9c9f2927c54', 'normal', 'm', '8551099905', 'd19'),
('ranjani.ram@ves.ac.in', 'ranjani ram', '19453981c162630ddd17f8d093fe7f5d57b717a5', 'normal', 'f', '9967181194', 'mca1b'),
('rashmi.chhabria@ves.ac.in', 'Rashmi Chhabria', '72a5b7beaf9f11943442403245883430951b0f1a', 'normal', 'f', '8082785714', 'd20'),
('ravi.prabhu@ves.ac.in', 'ravi prabhu', '4725caa70c082147f18fb48e981f2cfd058eb9f5', 'normal', 'm', '9768990864', 'mca1b'),
('ravi.prasad@ves.ac.in', 'Ravi	 Prasad', '1d290dea4d3ff37772a674de16e38c39d5987c41', 'normal', 'm', '9969883338', 'd2c'),
('ravi.yadav@ves.ac.in', 'ravi yadav', '63736a0c7a72d1756b35dc36f0420af5d81b8eb4', 'normal', 'm', '7507827367', 'd18'),
('ravikant.gupta@ves.ac.in', 'ravikant gupta', '3edf99f9f756f552d25a3cc3cd233cf1ce27da42', 'normal', 'm', '8097381514', 'mca1a'),
('ravishankar.gupta@ves.ac.in', 'Ravishankar 	Gupta', '3c8b5018070497052d64f501acad714c3a319bf8', 'normal', 'm', '9819370335', 'd17'),
('reena.epili@ves.ac.in', 'Reena Epili', 'cac4b3ef5f2145b60d6c51377202ed7dfbb061d5', 'normal', 'f', '9757386883', 'd1'),
('rekha.kumawat@ves.ac.in', 'REKHA KUMAWAT', '07118837f0694ee0bbb807efc7c92a5276a92894', 'normal', 'f', '9699425291', 'd1'),
('revati.pathak@ves.ac.in', 'Revati Pathak', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '9920211096', 'd12'),
('rhea.chowdhry@ves.ac.in', 'Rhea kaur chowdhry', '279938204b2bd7ce4624d33b4b09eea11453e9aa', 'normal', 'f', '7977468414', 'd9'),
('richa.shetty@ves.ac.in', 'richa shetty', '85fadddd6746c6219fa51c7473265919f1b13ce7', 'normal', 'f', '9421410496', 'd9c'),
('riddhi.karkera@ves.ac.in', 'Riddhi Karkera', 'c824e8194b9889d4e0ab4c1576bb2a0545f2393b', 'normal', 'f', '9930336495', 'd14C'),
('rishabh.diwan@ves.ac.in', 'Rishabh Diwan', '96e3607b73d8a440e5b0bd9c09aada55b5dbf02c', 'normal', 'm', '9987801123', 'd3'),
('rishabh.nankani@ves.ac.in', 'Rishabh Nankani', '52389faaab31cc36e185357fad2c0e5c11f340ba', 'normal', 'm', '7028260656', 'd12'),
('rishabh.rizwani@ves.ac.in', 'rishabh rizwani', '3db862a756da4e61bd0b38f61b16d54c12cc909d', 'normal', 'm', '9820472789', 'd9c'),
('ritika.mendjoge@ves.ac.in', 'Ritika Mendjoge', '805f47993a8013336a410e902641182a879cc6cc', 'normal', 'f', '9987430278', 'd12'),
('riya.bhavnani@ves.ac.in', 'Riya Bhavnani', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '9673860716', 'd15'),
('rohan.jagiasi@ves.ac.in', 'Rohan Jagiasi', '1e64765d3ba0bf2aaeecf5bc0cb08aea0a215df4', 'normal', 'm', '8080834122', 'd16'),
('rohan.shende@ves.ac.in', 'ROHAN	SHENDE', '6f093856d5ad78c1ed1c2f208b0cfa8c6a6b40a2', 'normal', 'm', '8888396254', 'd11'),
('rohini.yedelli@ves.ac.in', 'Rohini Yedelli', 'fd644cc6da4e193430548d6b90c4012e5e10f031', 'normal', 'f', '9702117603', 'd18'),
('rohit.kashyap@ves.ac.in', 'Rohit Kashyap', 'bd2ee3c6e7bae4b528dc532ff22a4c14f04f2b10', 'normal', 'm', '7045532419', 'd4'),
('rohit.lalwani@ves.ac.in', 'rohit lalwani', 'd3403d23be62214068826ab197afe5cd29b64241', 'normal', 'm', '9096719404', 'd19'),
('rohit.rathish@ves.ac.in', 'ROHIT RATHISH', '58d103c01fc3d91434bf4637d9937c7893b19976', 'normal', 'm', '9833012712', 'd9C'),
('rohit.sreedhar@ves.ac.in', 'rohit sreedhar', '9367060754e6ab3113bfc3ef92c325a4b28703a8', 'normal', 'm', '9819029552', 'd9c'),
('rohit.tiwari@ves.ac.in', 'rohit tiwari ', 'd5c4ab63752ca311b0ec3d68c1354721d5c41987', 'normal', 'm', '8452043357', 'MCA2A'),
('rohit.wadhwa@ves.ac.in', 'rohit wadhwa', 'd40b19706e1547392e7cd300b8a520c0399eae5e', 'normal', 'm', '8983737455', 'd18'),
('romit.bonkar@ves.ac.in', 'Romit Bonkar', '90de86e579060632f370b439d16176d5538f617d', 'normal', 'm', '9167346126', 'd12C'),
('roshan.rajwani@ves.ac.in', 'Roshan	Rajwani', '78b59fbfb614dc6b5d4e8acd3572853450726b19', 'normal', 'm', '9657655855', 'd12'),
('ruhi.rane@ves.ac.in', 'RUHI	RANE', 'c2e9fea7b9d045b811b0161b1d7195deffee529e', 'normal', 'f', '9029331856', 'd1'),
('runali.patil@ves.ac.in', 'RUNALI PATIL', 'd4cab25da442739126fa04efa8e9e38a20d0d60c', 'normal', 'f', '8898831664', 'd8'),
('rupali.dherange@ves.ac.in', 'RUPALI DHERANGE', 'f1dc96ad48677d8a1be6e3d6e98cd0ef50e271ae', 'normal', 'f', '7875337068', 'd7'),
('rupesh.dukhande@ves.ac.in', 'rupesh dukhande', '6627c4d7eda5c923a0a6957b1c7cf32c20127a4d', 'normal', 'm', '9702214351', 'mca1a'),
('rupesh.pawar@ves.ac.in', 'RUPESH PAWAR', '7b3f56d3191bef0a064615014de250bc4cf7e5bc', 'normal', 'm', '9820349790', 'd2c'),
('rushabh.patil@ves.ac.in', 'Rushabh Patil', 'a2f3b6f4509902890f765ffaa2cf162a7987b8ac', 'normal', 'm', '9029309817', 'd5'),
('rushika.ghadge@ves.ac.in', 'Rushika Ghadge', 'a79a63c37fd736f436a303cccff469b6b0b878de', 'normal', 'f', '8898342418', 'd13'),
('rutuja.mankar@ves.ac.in', 'Rutuja Mankar', '1b479cb18830ca1857d6526919050b4971c17ee8', 'normal', 'f', '8879469722', 'd2c'),
('rutuja.more@ves.ac.in', 'Rutuja More', '232dcbe0ad220524011f95842544f6f994e4711a', 'normal', 'f', '8600475432', 'd14'),
('rutuja.pate@ves.ac.in', 'Rutuja Pate', 'cbca5ae3f1826c1cfd4f2c67a6f9e4386cad5782', 'normal', 'f', '9969199200', 'd5'),
('sabah.shaikh@ves.ac.in', 'Sabah Shaikh', 'a7bc7aec972f7fa8c3832171a2fc3790dca37e8a', 'normal', 'f', '8898513668', 'd2'),
('sachee.nene@ves.ac.in', 'Sachee	Nene', '69eb93062016527b8c3be9cf04f317963b6e72f5', 'normal', 'f', '9022356993', 'd9C'),
('sachin.pathak@ves.ac.in', 'Sachin Pathak', '770a1bde65d9ca2af8469d38ae46354f73d82be9', 'normal', 'm', '8976330467', 'd14'),
('sadiya.solunke@ves.ac.in', 'sadiya solunke ', 'dd6a685553ef8c1fec32398c7e273b59e11d9d37', 'normal', 'f', '9967203578', 'MCA2A'),
('sagar.borkhatariya@ves.ac.in', 'Sagar Borkhatariya', 'f9db3716eca57514914a418b776b26a2aac6bb27', 'normal', 'm', '8450908368', 'd8'),
('sagar.panjwani@ves.ac.in', 'sagar panjwani ', '93310ab154848e752209919835198e2759bd461d', 'normal', 'm', '8390841433', 'MCA2B'),
('sagar.sachdev@ves.ac.in', 'Sagar	Sachdev', '0c001fdc85e1fef89ef13e5ef5f57fe74e52e7e5', 'normal', 'm', '8237667204', 'd9C'),
('sahil.chanchlani@ves.ac.in', 'Sahil Chanchlani', 'e0d2945a6030ea276f23680d6b11913c8791a69a', 'normal', 'm', '9987278484', 'd20'),
('sahil.jagiasi@ves.ac.in', 'sahil jagiasi', '8f81df3ab1a09442c82b1b1effb2dbcb35ce20cb', 'normal', 'm', '9960888610', 'd14C'),
('sahil.khan@ves.ac.in', 'Sahil	Khan', 'd8fd3e71b6265cfe557f6d40c94d539a1e96fc84', 'normal', 'm', '9757074629', 'd12'),
('sahil.koul@ves.ac.in', 'sahil koul', 'd1c830c39dd07b50d3861a47a1aa09b5c4a03442', 'normal', 'm', '9819959171', 'd19c'),
('sahil.matlani@ves.ac.in', 'Sahil Matlani', '3263818050e392d3447a3985459d96d04eb60559', 'normal', 'm', '7028365639', 'd12'),
('sahil.pamnani@ves.ac.in', 'SAHIL PAMNANI', '3a57880deac9dd42938d26f7cb45128362815f97', 'normal', 'm', '9757496910', 'd12'),
('saif.sayed@ves.ac.in', 'Saif	Sayed', '17e942183142283884791ba774133b9939aeec82', 'normal', 'm', '7303882416', 'd2'),
('sairaaj.kshrirsagar@ves.ac.in', 'SAIRAJ KSHIRSAGAR', '3b5aad3f5bdd57ea0ad28a1412772e6b0150e37e', 'normal', 'm', '9004844484', 'd8'),
('saisankar.sitaraman@ves.ac.in', 'saisankar sitaraman', '82b405c1e4aa4f43954a52a67ea18c14691635eb', 'normal', 'm', '9820604917', 'd9c'),
('saket.ghule@ves.ac.in', 'saket ghule', '6d701efd71934e77837622b6c18060babb4a3c32', 'normal', 'm', '9405783303', 'd17'),
('sakshi.rohra@ves.ac.in', 'sakshi rohra', '41ca02d127e9200408e2d88110b985f39e628940', 'normal', 'f', '9561512135', 'd9c'),
('saloni.shah@ves.ac.in', 'Saloni Shah', 'c078451eeda426a34d15d706eb28a2d285647ee0', 'normal', 'f', '9167263673', 'd10'),
('samdavid.gnana@ves.ac.in', 'SamGnana David', 'a80d5e4344ef86d2571a433d1dee9eec2017d389', 'normal', 'm', '9594248341', 'd4'),
('sameer.udgirkar@ves.ac.in', 'Sameer Udgirkar', 'c0881a27961b2c9878604c66439bf837836cf5ef', 'normal', 'm', '9561760920', 'd9C'),
('sandeep.rawat@ves.ac.in', 'Sandeep Rawat', '6a0433b45e31492be64afba5e64b246c40878117', 'normal', 'm', '9920086694', 'd2'),
('sandesh.nambiar@ves.ac.in', 'sandesh nambiar', '62db0a182088baa417f22a981cc7cc1540ab1abb', 'normal', 'm', '8976607682', 'mca1a'),
('sandesh.navghane@ves.ac.in', 'Sandesh Navghane', '63fa4a0748eae144063623e3d44554a37556fd2a', 'normal', 'm', '8652660802', 'd2c'),
('sanhita.bhagwat@ves.ac.in', 'sanhita bhagwat', 'ce73246f00c5757ded32b9695a5fd537763106b1', 'normal', 'f', '9820853696', 'MCA2B'),
('sanjana.moghe@ves.ac.in', 'Sanjana Moghe', 'a902b07109b159935c0b6755f09865203770b377', 'normal', 'f', '9833575222', 'd7C'),
('sanjana.mulchandani@ves.ac.in', 'Sanjana Mulchandani', '45553bca6181c9f9fbbe3176d442c0f27b689573', 'normal', 'f', '7709267630', 'd7C'),
('sanjay.madesha@ves.ac.in', 'SANJAY MADESHA', '9badb592c4103710a8ffa6b41b2c620915be9f3a', 'normal', 'm', '9821499479', 'd8'),
('sanket.mhatre@ves.ac.in', 'Sanket Mhatre', '924632013b1af3344a82fd627c7972b8c5da406a', 'normal', 'm', '9892130913', 'd7C'),
('sanmesh.ghone@ves.ac.in', 'Sanmesh Ghone', '9e61a8e264be5de5058367cc04153926c20e297b', 'normal', 'm', '8655431038', 'd17'),
('santosh.patkar@ves.ac.in', 'Santosh  Patkar', '636811b358fce5eb0fddcefadef9900349418d7f', 'normal', 'm', '8390588443', 'd2'),
('sarvesh.dhage@ves.ac.in', 'Sarvesh Dhage', '8adc04e2c5de7766766e1aefb3ce90a49ea7b3d1', 'normal', 'm', '9029971447', 'd3'),
('sashwin.adnani@ves.ac.in', 'Sashwin Adnani', '317ac190372580b7b6e93ce2c53fafcc926d1ae4', 'normal', 'm', '9022358080', 'd11'),
('satish.fulwani@ves.ac.in', 'Satish Fulwani', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '9145175111', 'd15'),
('satyam.yadav@ves.ac.in', 'satyam yadav', '78ee6b302935387451825f8935ba20ddb5e425e0', 'normal', 'm', '7045133844', 'd10'),
('saurabh.band@ves.ac.in', 'Saurabh Band', '3b53a702103e32d16476493ebf15dc588e351600', 'normal', 'm', '8082188091', 'd6'),
('saurabh.gulhane@ves.ac.in', 'SAURABH	GULHANE', 'ca2acdbd723b586aadb82920f63429e7cfbff2a6', 'normal', 'm', '7030715187', 'd19c'),
('saurabh.tripathi@ves.ac.in', 'saurabh tripathi', 'ece5327f437845df0177752802e2b4c5229ad919', 'normal', 'm', '8286445277', 'd18'),
('saurabh.yjadhav@ves.ac.in', 'saurabh jadhav', '792b3916d34c08d71f29e55b12c446bae885ec69', 'normal', 'm', '9768800635', 'd19c'),
('seema.ambre@ves.ac.in', 'seema ambre', '33af329ae54db0fe7369f357f5cc544853ed6b6f', 'normal', 'f', '9969183769', 'd17c'),
('sejal.gianani@ves.ac.in', 'Sejal Gianani', 'ebc3e39c7ae2ce64ff85e8c30b479678e04caa55', 'normal', 'f', '9819747819', 'd15'),
('sejal.limbekar@ves.ac.in', 'Sejal Limbekar', 'fa3bf9d7dddf3c9b4eaacbde7e927543003488b7', 'normal', 'f', '8425072124', 'd8'),
('shaikh.abdul.gaffar@ves.ac.in', 'Abdul gaffar	 Shaikh', 'e02f6a856c2b8de3685a075e5130da65aaacc380', 'normal', 'm', '8898671746', 'MCA2A'),
('shalaka.shendarkar@ves.ac.in', 'Shalaka Shendarkar', 'f050b3b8e2e695ea0494a31d7390116fb45067b3', 'normal', 'f', '9619274664', 'd14'),
('shankar.asknani@ves.ac.in', 'Shankar Asknani', '3ccadcfd23bc0999afa9fc350a0259603b99f8fa', 'normal', 'm', '8793901457', 'd12C'),
('shantanu.deshpande@ves.ac.in', 'Shantanu Deshpande', '79876a336aa909e95b3a8164d2d11dbf0a26f0b4', 'normal', 'm', '8082105105', 'd19c'),
('shantanu.pawar@ves.ac.in', 'shantanu pawar', 'd39acce047d74e44ee7423c4f85e068627e29efa', 'normal', 'm', '8551018460', 'd14'),
('sheel.tikku@ves.ac.in', 'sheel tikku ', 'a3a102b45f1e3b36e37db333158a41cd798184eb', 'normal', 'm', '9699299335', 'MCA2B'),
('sheetal.morje@ves.ac.in', 'SHEETAL MORJE', 'e87d4c7fb76fe7ad52374a84bff37237ebee5ff8', 'normal', 'f', '8793839971', 'd8'),
('shekhar.singh@ves.ac.in', 'Shekar Singh', '890881ff2213a27bf0cf4291adeb15f66b8db95c', 'normal', 'm', '9757176684', 'd2'),
('shikha.sajnani@ves.ac.in', 'shikha sajnani', '5cbbbf47d51b9c3cfa37c0442e5ec6adfd896a49', 'normal', 'f', '8888387110', 'd18'),
('shilpa.das@ves.ac.in', 'shilpa das', '1a9609ff047aa8dfec8eabeef82d3d3dca29c18e', 'normal', 'f', '9167773537', 'mca1a'),
('shivam.ghodke@ves.ac.in', 'Shivam Ghodke', 'e417ce5b458b9f0a61630b1907b3c805aa14d0c1', 'normal', 'm', '9619149854', 'd3'),
('shivam.walanj@ves.ac.in', 'shivam walanj', '4cea91c7a959aa6297149764abb2b0a4bc5ee4ac', 'normal', 'm', '9892925172', 'd17c'),
('shivani.subnani@ves.ac.in', 'Shivani Subnani', 'f4ddad51130f554d4b1ac6fbc2ed29af4a26be71', 'normal', 'f', '8806146401', 'd6'),
('shivani.valecha@ves.ac.in', 'SHIVANI  VALECHA', '0298d1582753109648588e1a99621e5d0d22656c', 'normal', 'f', '9096142998', 'd9C'),
('shraddha.bhinge@ves.ac.in', 'shraddha bhinge', '212fbd6e858eddb43126fec0fb2a45883638f7a0', 'normal', 'f', '9172527063', 'd15'),
('shraddha.sawant@ves.ac.in', 'SHRADDHA	SAWANT', 'a95880162e981563dea9866ebf5947272661e41b', 'normal', 'f', '9920282130', 'd7'),
('shradha.bhor@ves.ac.in', 'SHRADHA BHOR', '8ba6f52d11a24b58bfaf8a0f2bec94afc34f89b7', 'normal', 'f', '7208784170', 'd7'),
('shreesh.rao@ves.ac.in', 'Shreesh	Rao', 'fa87d8e72b6db14756fafbbd2a2f2a72fe41283a', 'normal', 'm', '9920273520', 'd9C'),
('shreya.narsapur@ves.ac.in', 'Shreya Narsapur', '748ece49230c4ebb2fa32f193d6c69170b367f19', 'normal', 'f', '9987290379', 'd9C'),
('shreyas.bhagat@ves.ac.in', 'Shreyas Bhagat', 'f4699462f5496d616acd9ae6b899dbec764193ec', 'normal', 'm', '9423694875', 'd7'),
('shripad.laddha@ves.ac.in', 'Shripad	Laddha', 'bc7b0335bfd8fd0e3b820086adae417804ac907a', 'normal', 'm', '8879379567', 'd7C'),
('shriya.patil@ves.ac.in', 'Shriya Patil', 'aaa873a7ad17914a568803ff8d5899f1ca2948fd', 'normal', 'f', '9768553760', 'd8'),
('shruti.zade@ves.ac.in', 'Shruti Zade', 'e95f01c1bb9586f1e30826e687d1ab6a2071fed3', 'normal', 'f', '7303390698', 'd6'),
('shubham.bangar@ves.ac.in', 'shubham bangar', 'e7432f9214b98a687358450ebb83528a0ebae628', 'normal', 'm', '9867290201', 'd12C'),
('shubham.ghosalkar@ves.ac.in', 'Shubham Ghosalkar', '6f71b6d98928e9ed548aef711a36bdef992de7e6', 'normal', 'm', '7208502868', 'd20'),
('shubham.j.singh@ves.ac.in', 'shubham singh', 'abb96408be26e4b787b7c42c69140ac8eb1e42ac', 'normal', 'm', '8976211519', 'MCA2A'),
('shubham.patil@ves.ac.in', 'Shubham Patil', 'b8809cb9e25ea66e24f700ac52a6e01b597e7af2', 'normal', 'm', '8600939595', 'd14'),
('shubham.sharma@ves.ac.in', 'Shubham Sharma', '1923e8af2d09736d58a2e16e1ecf223e089d3535', 'normal', 'm', '9403190568', 'MCA2A'),
('shubhami.ghosh@ves.ac.in', 'SHUBHAMI GHOSH', '30641e1902442d3678d3bae790b2b011ed6442cb', 'normal', 'm', '9870344034', 'd8'),
('siddham.sharma@ves.ac.in', 'Siddham Sharma', 'dffc1bd250dc7d8f4b8d2505ef449694bdad1de3', 'normal', 'm', '8860274415', 'd11'),
('siddhanth.kotian@ves.ac.in', 'Siddhanth	Kotian', '6fcf1f52bac4be348c1e14737adf4a4bb871b00a', 'normal', 'm', '9920437450', 'd1'),
('siddharth.bellani@ves.ac.in', 'Siddharth Bellani', 'ccd1d50c79ab8db09b967771e1556a04c52c343a', 'normal', 'm', '8080584504', 'd15'),
('siddharth.nambiar@ves.ac.in', 'Siddharth Nambiar', '9fdae3418ae0bd53df62b24742446c43dbd28055', 'normal', 'm', '8692085249', 'd2c'),
('siddharth.purohit@ves.ac.in', 'siddharth purohit', '65e183d4e930ae9f33a2d1cbab60eb6522772ef1', 'normal', 'm', '9819439854', 'mca1b'),
('siddharth.sargar@ves.ac.in', 'SIDDHARTH	SARGAR', 'b2eb0b1ac79dacc60c3f18dbe99919e8c3c83434', 'normal', 'm', '9004771301', 'd1'),
('siddhesh.bandekar@ves.ac.in', 'Siddhesh Bandekar', 'd5a85fe5d27977afcd20001e007df31014f8112a', 'normal', 'm', '9975486667', 'd16'),
('siddhesh.hindalekar@ves.ac.in', 'Siddhesh Hindalekar', '6bbb753609cec78d40c3856db0bb6d6908a52270', 'normal', 'm', '9833277742', 'd20'),
('siddhesh.mhadnak@ves.ac.in', 'siddhesh mhadnak', '28d7c9787132946b04efa9c0b83561f9c8ea9f21', 'normal', 'm', '9769508538', 'd19'),
('siddhesh.mirjankar@ves.ac.in', 'siddhesh mirjankar', 'aa5056a123a49c9d10104e35c145489957657c20', 'normal', 'm', '8976015013', 'd19'),
('siddhi.sawant@ves.ac.in', 'Siddhi Sawant', '6d969ff097c14351d93882e706f857fcf253aa1b', 'normal', 'f', '8433512201', 'd7'),
('simran.bakhtiani@ves.ac.in', 'Simran	 Bakhtiani', '25aea7cedd07ffcbab108d9f4bc1f35e9ec6d144', 'normal', 'f', '7798594779', 'd10'),
('simran.batra@ves.ac.in', 'Simran Batra', '5f8e9e2143f93186064cbe0ca29140cd3311ec43', 'normal', 'f', '9730623327', 'd15'),
('simran.dembla@ves.ac.in', 'SIMRAN DEMBLA', '054ab45f93b880c69769333af16bae1d1882fe55', 'normal', '', '', 'd13'),
('simran.rajpal@ves.ac.in', 'simran rajpal', 'b92026b8a55b3129a32da1e654b1ee34347aa270', 'normal', 'f', '9767793117', 'd16'),
('simran.rohira@ves.ac.in', 'Simran Rohira', '893bcd40d76b3c0bcca4bd1517876ab9421d2c5f', 'normal', 'f', '8425012082', 'd6'),
('simran.wig@ves.ac.in', 'Simran Wig', 'f9c4d0e9aa16da6a8c7b89c217d4c65dfdb1cacc', 'normal', 'f', '9167274004', 'd6'),
('simrankaur.dhaliwal@ves.ac.in', 'SIMRAN KAUR DHALIWAL', 'e6525add6f1ed9c144ea660b3dd98c211cb37ab2', 'normal', 'f', '9820599469', 'd17'),
('slishaa.shetty@ves.ac.in', 'slishaa shetty', 'ef83b9f2bb58edc9383a7008a65842e0b327b4e1', 'normal', 'f', '9833663145', 'd9c'),
('sneha.khemani@ves.ac.in', 'SNEHA KHEMANI', '2fed17ae78a0ff6d26f83ab7b34c65b0c55dddad', 'normal', 'f', '9096077604', 'd14C'),
('sneha.rao@ves.ac.in', 'Sneha Rao', '94500a2eac0d99d6579ffcda54414c26e5f045db', 'normal', 'f', '9833501925', 'd5'),
('snehal.bhagat@ves.ac.in', 'Snehal Bhagat', 'a5de91894ecf0e292c59aab673948f6f42cf812c', 'normal', 'f', '8108894824', 'd12C'),
('snehal.bhole@ves.ac.in', 'snehal bhole', '73068907bc7b701eac56ee2fb6f9a12635dd2539', 'normal', 'f', '9820850008', 'd7'),
('snehal.raut@ves.ac.in', 'Snehal Raut', 'c20a2585f78b52ea6d3b8c7f98930b166e52146c', 'normal', 'f', '8286313586', 'd1'),
('soha.bhadbhade@ves.ac.in', 'Soha Bhadbhade', '04cc053576f089ebd74ee214ae5da1ea4c63c0fa', 'normal', 'f', '8108227953', 'd16'),
('soham.mehta@ves.ac.in', 'Soham Mehta', '5ff41e5fa044b118be1ab2278fb50f13b1174c0a', 'normal', 'm', '9930093303', 'd4'),
('sonali.sharma@ves.ac.in', 'sonali sharma', 'e31a559bbb754b541028ef931bb77473d8ec698d', 'normal', 'f', '9414724219', 'mca1b'),
('sonia.chhabria@ves.ac.in', 'Sonia Chhabria', '0a1c1e46446c2daeb7f9989dc1e6c2c89a0a8394', 'normal', 'f', '8655165546', 'd20'),
('sonia.daryani@ves.ac.in', 'Sonia Daryani', 'bd3c1ef438d120bd06aee4a1f2fc5e0a3bdb7540', 'admin', 'f', '8380903010', 'd20'),
('soumya.kommajosyula@ves.ac.in', 'SOUMYA KOMMAJOSYULA', 'fee16f66424e9436b126ab3a8d23360d060a995d', 'normal', 'f', '9869955763', 'd19c'),
('srishti.dubey@ves.ac.in', 'Srishti  Dubey', '2d1f1724e7c5a6a27ec776e94f2d062b81ee8f82', 'normal', 'f', '9969467113', 'd9'),
('srushti.avhad@ves.ac.in', 'SRUSHTI AVHAD', '6dfd8df04dee49f8efc4631c67a9b31451778840', 'normal', 'f', '8425890669', 'd6'),
('srushti.pawar@ves.ac.in', 'Srushti Pawar', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'f', '8097718825', 'd14'),
('stella.jenifer@ves.ac.in', 'stella jenifer ', '47ff94c5fd1d7df9a4a6ff252137b281622ff827', 'normal', 'f', '9769238017', 'MCA2B'),
('subhdra.jaisinghani@ves.ac.in', 'subhdra jaisinghani', 'af14ee458f1cdfde9fb5b17683d3b70d67f9d43f', 'normal', 'f', '9175566187', 'd15'),
('suchita.wani@ves.ac.in', 'suchita wani', '5d268eee2910e3dea2d0d67b5b35ffcdcd8b117f', 'normal', 'f', '9096957239', 'd17c'),
('sudeshna.maiti@ves.ac.in', 'Sudeshna Maiti', 'b5a96293d265dfc5db251aa4da68107abdfa0d84', 'normal', 'f', '9619454269', 'd2c'),
('sudhiksha.mahadik@ves.ac.in', 'sudhiksha mahadik', 'be697c8b2452a1efc3478a155fa20aef96f50270', 'normal', 'f', '9167207053', 'd19c'),
('sufyan.khan@ves.ac.in', 'Sufyan Khan', 'f36184e20598394c3246e728040fcc8412e6dd5d', 'normal', 'm', '9757178061', 'd4'),
('sujay.pawar@ves.ac.in', 'sujay pawar', '71d5c7c24af1cad4662a2e48ae9c7cc19b377fdf', 'normal', 'm', '9969933465', 'd9c'),
('sumeet.sapla@ves.ac.in', 'sumeet sapla', '8e03234c581b9955315146944e67e11db596fe6b', 'normal', 'm', '9623609278', 'd18'),
('sumeet.shahani@ves.ac.in', 'Sumeet Shahani', 'eee69d065a6fc0a5db573a40fb22ac2fcc734bf7', 'normal', 'm', '8767772212', 'd9C'),
('sumeet.vachhani@ves.ac.in', 'sumeet vachhani ', '061c6603b21be7522ec89e5d364341a1d2f6c644', 'normal', 'm', '8275731864', 'MCA2B'),
('sunil.badak@ves.ac.in', 'sunil badak', '7b26fb09444d344787feb316d8c0f25f01cdac0a', 'normal', 'm', '7710963765', 'd17c'),
('sunil.sahu@ves.ac.in', 'SUNIL SAHU', 'be382094e46e167b9b341226ebaed28220dd4d05', 'normal', 'm', '9004592041', 'd2'),
('sunit.kajrekar@ves.ac.in', 'Sunit Kajarekar', 'feda17f34b191617c286740d02a58e18a6ae548a', 'normal', 'm', '9664303822', 'd1'),
('sunny.gawas@ves.ac.in', 'SUNNY GAWAS', '2a40e2a82da51ffab34be93c0d18d9c6b745b534', 'normal', 'm', '8655847559', 'd3'),
('supratim.kamat@ves.ac.in', 'Supratim Kamat', 'd751dbec8cd2de8d64064d6ba8fcbd206e4f0541', 'normal', 'm', '9820506285', 'd19c'),
('supriya.palve@ves.ac.in', 'supriya Palve', '0251b5f877fdaace5116429d581d3a31eec22743', 'normal', 'f', '9167160774', 'd5'),
('supriya.suresh@ves.ac.in', 'supriya suresh', 'd4be4917d8e08a3c61c6e007bb1495d1511e8c9b', 'normal', 'f', '9969515159', 'd17c'),
('supriya.tambe@ves.ac.in', 'supriya	tambe', '6854e156fd754311c490ced63f5f94ec1fb35f46', 'normal', 'f', '9221006802', 'd2'),
('suraj.singh@ves.ac.in', 'suraj singh ', 'c2e81d4188c1785989bd304b7681b41c78205751', 'normal', 'm', '7506066369', 'MCA2B'),
('suren.sughand@ves.ac.in', 'Suren	Sughand', '374b8323b4a3700784c8193444f390ef9a792ff1', 'normal', 'm', '9960619967', 'd9C'),
('sushant.wagle@ves.ac.in', 'sushant wagle', '78c7b1ececa1f61b8dfacf7eaf23aab9b7732ca4', 'normal', 'm', '8879718409', 'd18'),
('sushantkumar.bhandi@ves.ac.in', 'sushantkumar bhandi', 'c3f975a3aad4aaadfcc9f55b585f80fbd4704d72', 'normal', 'm', '9029033249', 'mca1a'),
('sushil.kogta@ves.ac.in', 'Sushil kogta', '0b40c43413acd71d1d90e47b8394d47a69a870b2', 'normal', 'm', '9404353995', 'd19'),
('sushmita.sharan@ves.ac.in', 'Sushmita Sharan', 'a0475109e44463638714686aaa3d4f5d7851b933', 'normal', 'f', '9594159932', 'd2'),
('swagat.deshmukh@ves.ac.in', 'Swagat Deshmukh', 'be81e6cb19f4c179d7f97e65d4cff6ce42ea3bd1', 'normal', 'm', '8097717343', 'd17'),
('swaminathan.moopanar@ves.ac.in', 'Swaminathan Moopanar', '10d5e375881e66b1a10c2398f65ca846271cb35e', 'normal', 'm', '9869588078', 'd2c'),
('swananda.sardesai@ves.ac.in', 'swananda sardesai', '95c924e26c9c98063bd12c6edc962de01b7f7e54', 'normal', 'f', '9545369666', 'mca1b'),
('swapnali.ghumkar@ves.ac.in', 'SWAPNALI GHUMKAR', '63ae9b1f7f48d3acbb84316f7881ec9dbcad68a0', 'normal', 'f', '9987903153', 'd14C'),
('swapnil.avhad@ves.ac.in', 'Swapnil Avhad', '678b799c468d1e83d271e61b9128f31d3ba743b4', 'normal', 'm', '7715005623', 'd6'),
('swarda.dalvi@ves.ac.in', 'SWARDA DALVI', 'b76c682323e4e800eaa3480ece859e747c6281f0', 'normal', 'f', '9967101571', 'd17'),
('swastika.thakur@ves.ac.in', 'Swastika Thakur', '4a6969e909d7d4d2985cc4ec1c3aa3e3498343fb', 'normal', 'f', '9594412372', 'd11'),
('sweta.amodkar@ves.ac.in', 'Sweta Ambodkar', 'fc4887dafc8d0db4b4d72b51b26760190b773f42', 'normal', 'f', '8879815621', 'd9C'),
('tanmay.jagtap@ves.ac.in', 'Tanmay	Jagtap', '08add7b1b40b38f5829e6ec1bae56cb9c3fb5292', 'normal', 'm', '845428', 'd8'),
('tanmay.rauth@ves.ac.in', 'Tanmay	Rauth', '22ea1c649c82946aa6e479e1ffd321e4a318b1b0', 'normal', 'm', '8108252865', 'd11'),
('tanmay.zope@ves.ac.in', 'tanmay zope', '553079dafd23fd95ecb3b1afe9b3732d02a502e5', 'normal', 'm', '9833384735', 'd10'),
('tarun.mangtani@ves.ac.in', 'tarun mangtani', '00923ba5f7b317a8c8c62f7684c7b242ea8906bd', 'normal', 'm', '9850009283', 'd9c'),
('tejas.ingale@ves.ac.in', 'Tejas Ingale', '7b9842a0db16bc83b091fdcf74ef36b1f2fc72f3', 'normal', 'm', '9527082165', 'd14C'),
('tejas.mankar@ves.ac.in', 'Tejas Mankar', '03b9b99a973b0a0a4910fd4f9dcdd89688872e9c', 'normal', 'm', '9820183387', 'd12'),
('titeeksha.sathe@ves.ac.in', 'titeeksha sathe', '56235fbe8eab95fe6d133a33e10f66ae994b29da', 'normal', 'f', '9029505015', 'd9c'),
('trupti.waghmare@ves.ac.in', 'TRUPTI WAGHMARE', 'f121dbf0808b608e3fd974a2f5c7eee10964b303', 'normal', 'f', '8108430329', 'd5'),
('trushali.bamugde@ves.ac.in', 'Trushali Bamugde', 'eb9e50a57be6be3ab97648a3c0d3d97b35fa743e', 'normal', 'f', '8446009153', 'd16'),
('tushar.hotchandani@ves.ac.in', 'Tushar Hotchandani', 'f5325d091fc604a72587ec5a6662d2713351a1f8', 'normal', 'm', '8806538077', 'd14C'),
('twinkle.motwani@ves.ac.in', 'Twinkle Motwani', 'b5575834038742dd839766909c769101ded7b1f4', 'normal', 'f', '7038776000', 'd12'),
('uddesh.karda@ves.ac.in', 'Uddesh Karda', '4a1f4df12db5210d08c9d887527b11d8c6515176', 'normal', 'm', '9975909546', 'd19'),
('utkarsh.rastogi@ves.ac.in', 'Utkarsh Rastogi', '98ec59e9238a9ad744de67a98c42e2dfba6c1794', 'normal', 'm', '7715004965', 'd2'),
('vaibhav.gaikwad@ves.ac.in', 'vaibhav gaikwad', '076d0928ef29511b78b3e90253e0b980f1cde70f', 'normal', 'm', '8108803634', 'd20'),
('vaibhav.goyal@ves.ac.in', 'Vaibhav Goyal', '5e0766363a642b1a5b7304949be1a7c8ac5558b3', 'normal', 'm', '8369366528', 'd20'),
('vaibhav.jain@ves.ac.in', 'Vaibhav Jain', 'a9270c3ab46d5263a8d144bca8c33f8783af887e', 'normal', 'm', '9221910251', 'd7C'),
('vaibhav.kokane@ves.ac.in', 'vaibhav kokane', 'f3e6d16f64dbb22a2e2e04b16da48d221532cd71', 'normal', 'm', '9167968662', 'mca1a'),
('vaibhav.sonewane@ves.ac.in', 'vaibhav sonewane', 'a37fa60ebddce597698ea343fc6f95037428eb66', 'normal', 'm', '9702242394', 'd17c'),
('vaibhav.yevale@ves.ac.in', 'Vaibhav	Yevale', '908544b4b86f699ede56c9542ce692e2245c860a', 'normal', 'm', '9833535788', 'd5'),
('vani.chaudhary@ves.ac.in', 'vani chaudhary', 'd1d29c321f5a3a2dc8b7c42fd80632367a4997e0', 'normal', 'f', '9819002292', 'd7'),
('varun.chothani@ves.ac.in', 'Varun Chothani', 'ff26d80170d04a1b4540927fce8e0ec828d67b30', 'normal', 'm', '9920457498', 'd17'),
('vasant.solunkhe@ves.ac.in', 'vasant solunkhe', '232468b0f8c8824a27894821a7b8d2437318944d', 'normal', 'm', '9594424197', 'MCA2A'),
('vedant.ajaykumar@ves.ac.in', 'VEDANT YADAV', '43e3e897f24316c6cf2b30c06d3fb0e17f165ca8', 'normal', 'm', '9923499640', 'd6'),
('venkatesh.vaasudhevan@ves.ac.in', 'venkatesh vaasudhevan ', '38d113878610ccb10971035f84c026c89192fd93', 'normal', 'm', '9757000999', 'MCA2B'),
('vidya.mehetre@ves.ac.in', 'VIDYA MEHETRE', '1a0d92146e2651a96e4c0103eb001eb547f2147b', 'normal', 'f', '8805407818', 'd16'),
('vignesh.ramakrishnan@ves.ac.in', 'vignesh ramakrishnan', '9a131d1cf14196b96a722e09ff154a4e525d43f5', 'normal', 'm', '9004048778', 'd10'),
('vignesh.zambre@ves.ac.in', 'Vignesh Zambre', 'bc93227f96178434fa401938573b7ea84e4b7013', 'normal', 'm', '8652872924', 'd6'),
('vijay.kataria@ves.ac.in', 'Vijay Kataria', '6a786f9ecafb49de9c9b27e918739c362b8e631e', 'normal', 'm', '9850030179', 'd7C'),
('vikas.kukreja@ves.ac.in', 'Vikas Kukreja', 'b054721618c61a25ce00cc6eba0dfedd2fcb96ba', 'normal', 'm', '7588310044', 'd7C'),
('vikram.jadhav@ves.ac.in', 'VIKRAM JADHAV', '5809c7966589559a2f613fedbd5cc1cde0f67a64', 'normal', 'm', '8692061557', 'd8'),
('vinay.bhagwani@ves.ac.in', 'vinay bhagwani', '2af987058c26318a3d8110617e2413515102adb6', 'normal', 'm', '8793387174', 'd17c'),
('vinay.gujar@ves.ac.in', 'vinay gujar', 'e5eb575927d9b666fc11d0ab1ba209dc52fdd0ed', 'normal', 'm', '8097424258', 'mca1a'),
('vinay.nair@ves.ac.in', 'Vinay Nair', '62e584fa6d8732d221eaf92e27fa2372098def22', 'normal', 'm', '9819383441', 'd7C'),
('vinay.singh@ves.ac.in', 'vinay singh ', '8a53820763294c5c9fbf60d7f7ede1c6254615a5', 'normal', 'm', '8097440026', 'MCA2B'),
('vinayak.sharma@ves.ac.in', 'Vinayak Sharma', '465c1c48aa3be71aed05c7d8a925ce6660dc0919', 'normal', 'm', '9665458027', 'd6'),
('vineeth.pillai@ves.ac.in', 'vineeth pillai', 'b8d5d158717f988437241a8807972d1852fc8079', 'normal', 'm', '7718976003', 'mca1b'),
('vinit.pawar@ves.ac.in', 'Vinit Pawar', 'f7a7860d92e3dbcfab1644b8f6e32cd500e92006', 'normal', 'm', '9892262416', 'd12'),
('viraj.bapat@ves.ac.in', 'viraj bapat ', '9d11d3e457895fe10ef02c4869ccc8073f4dd63d', 'normal', 'm', '9769833055', 'MCA2B'),
('viraj.jadhav@ves.ac.in', 'Viraj Jadhav', 'aa0215b8914724c1f197fe45af039f1ab62d7f59', 'normal', 'm', '9930512553', 'd14C'),
('viren.wadhwani@ves.ac.in', 'Viren Wadhwani', '6e29a2d46b5a821a4644b5d265ff7f88f69c1d6a', 'normal', 'm', '9665770160', 'd9C'),
('vishal.ahuja@ves.ac.in', 'Vishal Ahuja', 'c07909287193b07f108227a5a1651b2afec53652', 'normal', 'm', '9011448787', 'd3'),
('vishal.jadhav@ves.ac.in', 'VISHAL JADHAV', '0b25351784630483ff6ca1614a26787fe1f091fc', 'normal', 'm', '9702707376', 'd19c'),
('vishal.raut@ves.ac.in', 'Vishal  Raut ', '29ba4b746d06d3438d7ed8981f7856a7551a2cac', 'normal', 'm', '9867269834', 'd14'),
('vivek.hande@ves.ac.in', 'Vivek Hande', 'd5f82c2a6ec621589528d6fd1c9d970a65875862', 'normal', 'm', '8108828547', 'd4'),
('vivek.mulchandani@ves.ac.in', 'Vivek Mulchandani', 'ef3178897369f9d0575400cc126fc4e089a873ba', 'normal', 'm', '7798704240', 'd12'),
('yash.chetnani@ves.ac.in', 'Yash Chetnani', '0cfe75ed1a4da83de414772a0622cbb2fed500e0', 'normal', 'm', '8879138543', 'd12C'),
('yash.jahagirdar@ves.ac.in', 'YASH JAHAGIRDAR', '5281d63a59ca5217a629b3cb147f20ef77f84885', 'normal', 'm', '8454840407', 'd13'),
('yash.saraf@ves.ac.in', 'yash saraf', '3ec049ef794782faa9bf84741f15574552394964', 'normal', 'f', '9769403186', 'MCA2A'),
('yash.shahani@ves.ac.in', 'Yash Shahani', 'f77fcc7bbf0013c6ad91f335f4e3b5757dee2791', 'normal', 'm', '9819994449', 'd6'),
('yashshree.sundkar@ves.ac.in', 'Yashshree	Sundkar', '94e6ee6b933e696dbdf5bae9963459e9585fb736', 'normal', 'f', '9987399758', 'd7'),
('yogesh.ahuja@ves.ac.in', 'yogesh ahuja', '684802be1c755da1be48c287e19e6efd7fdf567d', 'normal', 'm', '8080417179', 'd17c'),
('yogesh.gupta@ves.ac.in', 'Yogesh Gupta', '04e554b50f342868a7222f9c986b94ed073736ce', 'normal', 'm', '8898500253', 'd13'),
('yugandhara.sawant@ves.ac.in', 'yugandhara sawant', 'd7e9804eae78d98970ef1fb2a7f27e28e87c1227', 'normal', 'f', '9892332992', 'MCA2A');

-- --------------------------------------------------------

--
-- Table structure for table `mainevent`
--

CREATE TABLE `mainevent` (
  `rowid` int(11) NOT NULL,
  `main_event_id` double NOT NULL,
  `main_event_name` varchar(50) NOT NULL,
  `main_event_parallel_matches` int(11) NOT NULL DEFAULT '0',
  `temp_counter` int(11) NOT NULL,
  `slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mainevent`
--

INSERT INTO `mainevent` (`rowid`, `main_event_id`, `main_event_name`, `main_event_parallel_matches`, `temp_counter`, `slot`) VALUES
(13, 1518253332877, 'Carrom', 3, 3, 1),
(14, 1518253332877, 'Carrom', 3, 3, 2),
(15, 1518253332877, 'Carrom', 3, 3, 3),
(16, 1518253337008, 'Carrom', 3, 3, 1),
(17, 1518253337008, 'Carrom', 3, 3, 2),
(18, 1518253337008, 'Carrom', 3, 3, 3),
(19, 1518253352757, 'Carrom', 3, 3, 1),
(20, 1518253352757, 'Carrom', 3, 3, 2),
(21, 1518253352757, 'Carrom', 3, 3, 3),
(22, 1518253352930, 'Carrom', 3, 3, 1),
(23, 1518253352930, 'Carrom', 3, 3, 2),
(24, 1518253352930, 'Carrom', 3, 3, 3),
(25, 1518253481807, 'Carrom', 3, 3, 1),
(26, 1518253481807, 'Carrom', 3, 3, 2),
(27, 1518253481807, 'Carrom', 3, 3, 3),
(28, 1518254008681, 'Table Tennis', 3, 3, 1),
(29, 1518254008681, 'Table Tennis', 3, 3, 2),
(30, 1518254008681, 'Table Tennis', 3, 3, 3),
(31, 1518254094259, 'Cricket', 1, 1, 1),
(32, 1518254094259, 'Cricket', 1, 1, 2),
(33, 1518254094259, 'Cricket', 1, 1, 3),
(34, 1518254159771, 'Volleyball', 1, 1, 1),
(35, 1518254159771, 'Volleyball', 1, 1, 2),
(36, 1518254159771, 'Volleyball', 1, 1, 3),
(37, 1518254721295, 'Cricket', 1, 1, 1),
(38, 1518254721295, 'Cricket', 1, 1, 2),
(39, 1518254721295, 'Cricket', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `row_id` int(11) NOT NULL,
  `player_id` varchar(50) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`row_id`, `player_id`, `team_id`) VALUES
(1, 'aditya.gavane@ves.ac.in', 1),
(2, 'ajay.gurumurthy@ves.ac.in', 1),
(3, 'chayan.agrawal@ves.ac.in', 1),
(4, 'aditya.gavane@ves.ac.in', 2),
(5, 'ajay.gurumurthy@ves.ac.in', 2),
(6, 'amit.fatnani@ves.ac.in', 2),
(7, 'ankita.dharne@ves.ac.in', 2),
(8, 'arpan.gulrajani@ves.ac.in', 2),
(9, 'arpita.ambavane@ves.ac.in', 2),
(10, 'aditya.gavane@ves.ac.in', 3),
(11, 'ajay.gurumurthy@ves.ac.in', 3),
(12, 'amit.fatnani@ves.ac.in', 3),
(13, 'chayan.agrawal@ves.ac.in', 3),
(14, 'jai.hinduja@ves.ac.in', 3),
(15, 'chayan.agrawal@ves.ac.in', 4),
(16, 'chayan.agrawal@ves.ac.in', 5),
(17, 'chayan.agrawal@ves.ac.in', 6),
(18, 'aditya.gavane@ves.ac.in', 7),
(19, 'ajay.gurumurthy@ves.ac.in', 7),
(20, 'amit.fatnani@ves.ac.in', 7),
(21, 'chayan.agrawal@ves.ac.in', 8),
(22, 'aditya.gavane@ves.ac.in', 9),
(23, 'ajay.gurumurthy@ves.ac.in', 9),
(24, 'amit.fatnani@ves.ac.in', 9),
(25, 'aditya.gavane@ves.ac.in', 10),
(26, 'aditya.gavane@ves.ac.in', 11),
(27, 'jeetiksha.chandiramani@ves.ac.in', 12),
(28, 'ankita.dharne@ves.ac.in', 13),
(29, 'arpan.gulrajani@ves.ac.in', 13),
(30, 'arpita.ambavane@ves.ac.in', 13),
(31, 'jeetiksha.chandiramani@ves.ac.in', 14),
(32, 'ankita.dharne@ves.ac.in', 15),
(33, 'arpan.gulrajani@ves.ac.in', 15),
(34, 'arpita.ambavane@ves.ac.in', 15),
(35, 'arpan.gulrajani@ves.ac.in', 16),
(36, 'arpan.gulrajani@ves.ac.in', 17),
(37, 'abhishek.patil@ves.ac.in', 18),
(38, 'abhishekkumar.mehta@ves.ac.in', 18),
(39, 'chetan.motwani@ves.ac.in', 18),
(40, 'dinesh.nandi@ves.ac.in', 18),
(41, 'dinesh.panchi@ves.ac.in', 18),
(42, 'abhishek.patil@ves.ac.in', 19),
(43, 'abhishekkumar.mehta@ves.ac.in', 19),
(44, 'chetan.motwani@ves.ac.in', 19),
(45, 'dinesh.nandi@ves.ac.in', 19),
(46, 'dinesh.panchi@ves.ac.in', 19),
(47, 'ganesh.kukreja@ves.ac.in', 19),
(48, 'manish.madhwani@ves.ac.in', 20),
(49, 'abhishek.patil@ves.ac.in', 21),
(50, 'abhishekkumar.mehta@ves.ac.in', 21),
(51, 'chetan.motwani@ves.ac.in', 21),
(52, 'manish.madhwani@ves.ac.in', 22),
(53, 'abhishek.patil@ves.ac.in', 23),
(54, 'abhishekkumar.mehta@ves.ac.in', 23),
(55, 'chetan.motwani@ves.ac.in', 23),
(56, 'rahul.nagdev@ves.ac.in', 24),
(57, 'rahul.nagdev@ves.ac.in', 25),
(58, 'revati.pathak@ves.ac.in', 26),
(59, 'aarti.raghani@ves.ac.in', 27),
(60, 'aditi.parab@ves.ac.in', 27),
(61, 'gayatri.mulchandani@ves.ac.in', 27),
(62, 'revati.pathak@ves.ac.in', 28),
(63, 'aarti.raghani@ves.ac.in', 29),
(64, 'aditi.parab@ves.ac.in', 29),
(65, 'gayatri.mulchandani@ves.ac.in', 29),
(66, 'gayatri.pawar@ves.ac.in', 30),
(67, 'gayatri.pawar@ves.ac.in', 31),
(68, 'ajitesh.singh@ves.ac.in', 32),
(69, 'anand.vaswani@ves.ac.in', 32),
(70, 'ankit.shaw@ves.ac.in', 32),
(71, 'dinesh.purswani@ves.ac.in', 32),
(72, 'harshal.talreja@ves.ac.in', 32),
(73, 'ajitesh.singh@ves.ac.in', 33),
(74, 'anand.vaswani@ves.ac.in', 33),
(75, 'ankit.shaw@ves.ac.in', 33),
(76, 'dinesh.purswani@ves.ac.in', 33),
(77, 'harshal.talreja@ves.ac.in', 33),
(78, 'jayesh.sawale@ves.ac.in', 33),
(79, 'tanmay.rauth@ves.ac.in', 34),
(80, 'ajitesh.singh@ves.ac.in', 35),
(81, 'anand.vaswani@ves.ac.in', 35),
(82, 'ankit.shaw@ves.ac.in', 35),
(83, 'tanmay.rauth@ves.ac.in', 36),
(84, 'ajitesh.singh@ves.ac.in', 37),
(85, 'anand.vaswani@ves.ac.in', 37),
(86, 'ankit.shaw@ves.ac.in', 37),
(87, 'pravin.tripathi@ves.ac.in', 38),
(88, 'pravin.tripathi@ves.ac.in', 39),
(89, 'jyoti.singh@ves.ac.in', 40),
(90, 'deesha.ramchandani@ves.ac.in', 41),
(91, 'jyoti.singh@ves.ac.in', 41),
(92, 'kiran.solapure@ves.ac.in', 41),
(93, 'jyoti.singh@ves.ac.in', 42),
(94, 'deesha.ramchandani@ves.ac.in', 43),
(95, 'jyoti.singh@ves.ac.in', 43),
(96, 'kiran.solapure@ves.ac.in', 43),
(97, 'kiran.solapure@ves.ac.in', 44),
(98, 'kiran.solapure@ves.ac.in', 45),
(99, 'abhijeet.bhattacharya@ves.ac.in', 46),
(100, 'abhishek.gurav@ves.ac.in', 46),
(101, 'anshul.agarwal@ves.ac.in', 46),
(102, 'chetan.gupta@ves.ac.in', 46),
(103, 'dinesh.ahuja@ves.ac.in', 46),
(104, 'abhijeet.bhattacharya@ves.ac.in', 47),
(105, 'abhishek.gurav@ves.ac.in', 47),
(106, 'anshul.agarwal@ves.ac.in', 47),
(107, 'chetan.gupta@ves.ac.in', 47),
(108, 'dinesh.ahuja@ves.ac.in', 47),
(109, 'jai.amesar@ves.ac.in', 47),
(110, 'abhishek.gurav@ves.ac.in', 48),
(111, 'abhijeet.bhattacharya@ves.ac.in', 49),
(112, 'abhishek.gurav@ves.ac.in', 49),
(113, 'anshul.agarwal@ves.ac.in', 49),
(114, 'abhishek.gurav@ves.ac.in', 50),
(115, 'abhijeet.bhattacharya@ves.ac.in', 51),
(116, 'abhishek.gurav@ves.ac.in', 51),
(117, 'anshul.agarwal@ves.ac.in', 51),
(118, 'chetan.gupta@ves.ac.in', 52),
(119, 'chetan.gupta@ves.ac.in', 53),
(120, 'aysha.jagiasi@ves.ac.in', 54),
(121, 'aishwarya.chandak@ves.ac.in', 55),
(122, 'aysha.jagiasi@ves.ac.in', 55),
(123, 'harshada.hotwani@ves.ac.in', 55),
(124, 'aysha.jagiasi@ves.ac.in', 56),
(125, 'aishwarya.chandak@ves.ac.in', 57),
(126, 'aysha.jagiasi@ves.ac.in', 57),
(127, 'harshada.hotwani@ves.ac.in', 57),
(128, 'juhi.bhagtani@ves.ac.in', 58),
(129, 'juhi.bhagtani@ves.ac.in', 59),
(130, 'anjali.patil@ves.ac.in', 60),
(131, 'pradnya.pujare@ves.ac.in', 60),
(132, 'rutuja.more@ves.ac.in', 60),
(133, 'srushti.pawar@ves.ac.in', 61),
(134, 'srushti.pawar@ves.ac.in', 62),
(135, 'anjali.patil@ves.ac.in', 63),
(136, 'pradnya.pujare@ves.ac.in', 63),
(137, 'rutuja.more@ves.ac.in', 63),
(138, 'pradnya.pujare@ves.ac.in', 64),
(139, 'pradnya.pujare@ves.ac.in', 65),
(140, 'abhishek.nemade@ves.ac.in', 66),
(141, 'abhishek.patil6@ves.ac.in', 66),
(142, 'aniket.nair@ves.ac.in', 66),
(143, 'ashish.mhatre@ves.ac.in', 66),
(144, 'avinash.salian@ves.ac.in', 66),
(145, 'abhishek.nemade@ves.ac.in', 67),
(146, 'abhishek.patil6@ves.ac.in', 67),
(147, 'aniket.nair@ves.ac.in', 67),
(148, 'ashish.mhatre@ves.ac.in', 67),
(149, 'avinash.salian@ves.ac.in', 67),
(150, 'gauresh.mestry@ves.ac.in', 67),
(151, 'hitendra.mhatre@ves.ac.in', 68),
(152, 'abhishek.nemade@ves.ac.in', 69),
(153, 'abhishek.patil6@ves.ac.in', 69),
(154, 'aniket.nair@ves.ac.in', 69),
(155, 'hitendra.mhatre@ves.ac.in', 70),
(156, 'abhishek.nemade@ves.ac.in', 71),
(157, 'abhishek.patil6@ves.ac.in', 71),
(158, 'aniket.nair@ves.ac.in', 71),
(159, 'ashish.mhatre@ves.ac.in', 72),
(160, 'ashish.mhatre@ves.ac.in', 73),
(161, 'riya.bhavnani@ves.ac.in', 74),
(162, 'aishwarya.aryamane@ves.ac.in', 75),
(163, 'hanisha.jamtani@ves.ac.in', 75),
(164, 'meenu.bhatia@ves.ac.in', 75),
(165, 'riya.bhavnani@ves.ac.in', 76),
(166, 'aishwarya.aryamane@ves.ac.in', 77),
(167, 'hanisha.jamtani@ves.ac.in', 77),
(168, 'meenu.bhatia@ves.ac.in', 77),
(169, 'meenu.bhatia@ves.ac.in', 78),
(170, 'meenu.bhatia@ves.ac.in', 79),
(171, 'aditya.krishnan@ves.ac.in', 80),
(172, 'akshay.gunani@ves.ac.in', 80),
(173, 'deepanshu.garg@ves.ac.in', 80),
(174, 'deepesh.garg@ves.ac.in', 80),
(175, 'jigar.ajmera@ves.ac.in', 80),
(176, 'aditya.krishnan@ves.ac.in', 81),
(177, 'akshay.gunani@ves.ac.in', 81),
(178, 'deepanshu.garg@ves.ac.in', 81),
(179, 'deepesh.garg@ves.ac.in', 81),
(180, 'jigar.ajmera@ves.ac.in', 81),
(181, 'krishna.boddu@ves.ac.in', 81),
(182, 'satish.fulwani@ves.ac.in', 82),
(183, 'aditya.krishnan@ves.ac.in', 83),
(184, 'akshay.gunani@ves.ac.in', 83),
(185, 'deepanshu.garg@ves.ac.in', 83),
(186, 'satish.fulwani@ves.ac.in', 84),
(187, 'aditya.krishnan@ves.ac.in', 85),
(188, 'akshay.gunani@ves.ac.in', 85),
(189, 'deepanshu.garg@ves.ac.in', 85),
(190, 'deepesh.garg@ves.ac.in', 86),
(191, 'deepesh.garg@ves.ac.in', 87);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `seed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scoretable`
--

CREATE TABLE `scoretable` (
  `rowid` int(11) NOT NULL,
  `classroom` varchar(10) DEFAULT NULL,
  `score` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(50) DEFAULT NULL,
  `classroom` varchar(10) NOT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `event_id` int(11) DEFAULT NULL,
  `round` varchar(30) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`, `classroom`, `scheduled`, `event_id`, `round`, `points`) VALUES
(1, 'teamname', 'd20', 0, 1, 'Participated', 1),
(2, 'teamname', 'd20', 0, 33, NULL, 0),
(3, 'teamname', 'd20', 0, 34, NULL, 0),
(4, 'chayan agrawal', 'd20', 0, 29, NULL, 0),
(7, 'teamname', 'd20', 0, 26, NULL, 0),
(8, 'chayan agrawal', 'd20', 0, 23, NULL, 0),
(9, 'teamname', 'd20', 0, 20, NULL, 0),
(10, 'Aditya Gavane', 'd20', 0, 28, NULL, 0),
(11, 'Aditya Gavane', 'd20', 0, 22, NULL, 0),
(12, 'Jeetiksha Chandiramani', 'd20', 0, 31, NULL, 0),
(13, 'teamname', 'd20', 0, 27, NULL, 0),
(14, 'Jeetiksha Chandiramani', 'd20', 0, 25, NULL, 0),
(15, 'teamname', 'd20', 0, 21, NULL, 0),
(16, 'Arpan Gulrajani', 'd20', 0, 30, NULL, 0),
(17, 'Arpan Gulrajani', 'd20', 0, 24, NULL, 0),
(18, 'd12', 'd12', 0, 34, NULL, 0),
(19, 'd12', 'd12', 0, 33, NULL, 0),
(20, 'Manish Madhwani', 'd12', 0, 29, NULL, 0),
(21, 'd12', 'd12', 0, 26, NULL, 0),
(22, 'Manish Madhwani', 'd12', 0, 23, NULL, 0),
(23, 'd12', 'd12', 0, 20, NULL, 0),
(24, 'RAHUL NAGDEV', 'd12', 0, 28, NULL, 0),
(25, 'RAHUL NAGDEV', 'd12', 0, 22, NULL, 0),
(26, 'Revati Pathak', 'd12', 0, 31, NULL, 0),
(27, 'd12', 'd12', 0, 27, NULL, 0),
(28, 'Revati Pathak', 'd12', 0, 25, NULL, 0),
(29, 'd12', 'd12', 0, 21, NULL, 0),
(30, 'GAYATRI PAWAR', 'd12', 0, 30, NULL, 0),
(31, 'GAYATRI PAWAR', 'd12', 0, 24, NULL, 0),
(32, 'd11', 'd11', 0, 34, NULL, 0),
(33, 'd11', 'd11', 0, 33, NULL, 0),
(34, 'Tanmay	Rauth', 'd11', 0, 29, NULL, 0),
(35, 'd11', 'd11', 0, 26, NULL, 0),
(36, 'Tanmay	Rauth', 'd11', 0, 23, NULL, 0),
(37, 'd11', 'd11', 0, 20, NULL, 0),
(38, 'Pravin Tripathi', 'd11', 0, 28, NULL, 0),
(39, 'Pravin Tripathi', 'd11', 0, 22, NULL, 0),
(40, 'Jyoti	Singh', 'd11', 0, 31, NULL, 0),
(41, 'd11', 'd11', 0, 27, NULL, 0),
(42, 'Jyoti	Singh', 'd11', 0, 25, NULL, 0),
(43, 'd11', 'd11', 0, 21, NULL, 0),
(44, 'Kiran Solapure', 'd11', 0, 30, NULL, 0),
(45, 'Kiran Solapure', 'd11', 0, 24, NULL, 0),
(46, 'd13', 'd13', 0, 34, NULL, 0),
(47, 'd13', 'd13', 0, 33, NULL, 0),
(48, 'Abhishek Gurav', 'd13', 0, 29, NULL, 0),
(49, 'd13', 'd13', 0, 26, NULL, 0),
(50, 'Abhishek Gurav', 'd13', 0, 23, NULL, 0),
(51, 'd13', 'd13', 0, 20, NULL, 0),
(52, 'chetan	gupta', 'd13', 0, 28, NULL, 0),
(53, 'chetan	gupta', 'd13', 0, 22, NULL, 0),
(54, 'Aysha	Jagiasi', 'd13', 0, 31, NULL, 0),
(55, 'd13', 'd13', 0, 27, NULL, 0),
(56, 'Aysha	Jagiasi', 'd13', 0, 25, NULL, 0),
(57, 'd13', 'd13', 0, 21, NULL, 0),
(58, 'Juhi Bhagtani', 'd13', 0, 30, NULL, 0),
(59, 'Juhi Bhagtani', 'd13', 0, 24, NULL, 0),
(60, 'd14', 'd14', 0, 27, NULL, 0),
(61, 'Srushti Pawar', 'd14', 0, 31, NULL, 0),
(62, 'Srushti Pawar', 'd14', 0, 25, NULL, 0),
(63, 'd14', 'd14', 0, 21, NULL, 0),
(64, 'Pradnya	 Pujare', 'd14', 0, 30, NULL, 0),
(65, 'Pradnya	 Pujare', 'd14', 0, 24, NULL, 0),
(66, 'd14', 'd14', 0, 34, NULL, 0),
(67, 'd14', 'd14', 0, 33, NULL, 0),
(68, 'Hitendra  Mhatre', 'd14', 0, 29, NULL, 0),
(69, 'd14', 'd14', 0, 26, NULL, 0),
(70, 'Hitendra  Mhatre', 'd14', 0, 23, NULL, 0),
(71, 'd14', 'd14', 0, 20, NULL, 0),
(72, 'Ashish Mhatre', 'd14', 0, 28, NULL, 0),
(73, 'Ashish Mhatre', 'd14', 0, 22, NULL, 0),
(74, 'Riya Bhavnani', 'd15', 0, 31, NULL, 0),
(75, 'd15', 'd15', 0, 27, NULL, 0),
(76, 'Riya Bhavnani', 'd15', 0, 25, NULL, 0),
(77, 'd15', 'd15', 0, 21, NULL, 0),
(78, 'MEENU BHATIA', 'd15', 0, 30, NULL, 0),
(79, 'MEENU BHATIA', 'd15', 0, 24, NULL, 0),
(80, 'd15', 'd15', 0, 34, NULL, 0),
(81, 'd15', 'd15', 0, 33, NULL, 0),
(82, 'Satish Fulwani', 'd15', 0, 29, NULL, 0),
(83, 'd15', 'd15', 0, 26, NULL, 0),
(84, 'Satish Fulwani', 'd15', 0, 23, NULL, 0),
(85, 'd15', 'd15', 0, 20, NULL, 0),
(86, 'Deepesh	Garg', 'd15', 0, 28, NULL, 0),
(87, 'Deepesh	Garg', 'd15', 0, 22, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event_head`
--
ALTER TABLE `event_head`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `gameteammapping`
--
ALTER TABLE `gameteammapping`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `logindetails`
--
ALTER TABLE `logindetails`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `mainevent`
--
ALTER TABLE `mainevent`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `scoretable`
--
ALTER TABLE `scoretable`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `event_head`
--
ALTER TABLE `event_head`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gameteammapping`
--
ALTER TABLE `gameteammapping`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mainevent`
--
ALTER TABLE `mainevent`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scoretable`
--
ALTER TABLE `scoretable`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
