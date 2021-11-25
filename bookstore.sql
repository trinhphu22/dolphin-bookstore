-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 25, 2021 lúc 07:43 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookstore`
--
CREATE DATABASE IF NOT EXISTS `bookstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bookstore`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(7, 'Action & adventure'),
(28, 'Crime, thrillers & mysterie'),
(29, 'Fantasy'),
(30, 'General & literary fiction'),
(32, 'Horror'),
(33, 'Poetry'),
(34, 'Romance'),
(35, 'Science Fiction'),
(36, 'Short stories'),
(37, 'Young adult');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `FeedBack`
--

CREATE TABLE `FeedBack` (
  `id` int(11) NOT NULL,
  `fullname` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `subject_name` varchar(350) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `FeedBack`
--

INSERT INTO `FeedBack` (`id`, `fullname`, `email`, `phone_number`, `subject_name`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Forly', 'forly1301@gmail.com', '0792571353', '123', '123', 1, '2021-11-20 15:30:44', '2021-11-20 09:49:55'),
(2, 'Lirin', 'lirin@gmail.com', '0123456789', '456', '456', 0, '2021-11-20 15:30:44', '2021-11-20 15:30:44'),
(3, 'Nguyễn Văn Tèo', 'nguyenvanteo@gmail.com', '0123456789', '145', 'Sách này hay quá', 1, '2021-11-20 15:53:03', '2021-11-20 09:54:30'),
(5, 'Trịnh Mạch Huy Phú', 'kozfast22@gmail.com', '0792571353', 'ABC', '123', 0, '2021-11-25 06:29:32', '2021-11-25 06:29:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Gallery`
--

CREATE TABLE `Gallery` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Orders`
--

CREATE TABLE `Orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total_money` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Orders`
--

INSERT INTO `Orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`) VALUES
(1, 4, 'Lê Văn Tèo', 'levanteo@gmail.com', '0123456789', 'Cần Thơ', '123', '2021-11-20 15:59:59', 2, '12.00'),
(2, 6, 'Lirin', 'lirin@gmail.com', '0123456789', 'Cà Mau', '123', '2021-11-19 16:01:13', 1, '18.00'),
(3, 9, 'Nguyễn Tài', 'nguyentai@gmail.com', '0123456789', 'Vĩnh Long', '456', '2021-11-20 16:31:15', 2, '10.00'),
(4, 11, 'Trần Văn XYZ', '123@gmail.com', '0123456789', 'Hà Nội', '', '2021-11-24 14:54:45', 2, '8.36'),
(5, 5, 'Forly', 'forly1301@gmail.com', '0123456789', 'Nha Trang', '', '2021-11-24 15:29:59', 1, '12.08'),
(6, 1, 'Trịnh Mạch Huy Phú', 'kozfast22@gmail.com', '0792571353', 'Sóc Trăng', 'Give me a call when you come!!!\n0792571353', '2021-11-24 15:38:18', 0, '134.81'),
(7, 1, 'Trịnh Mạch Huy Phú', 'kozfast22@gmail.com', '0792571353', 'Sóc Trăng', '123', '2021-11-25 06:31:48', 1, '42.75');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Order_Details`
--

CREATE TABLE `Order_Details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `total_money` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Order_Details`
--

INSERT INTO `Order_Details` (`id`, `order_id`, `product_id`, `price`, `num`, `total_money`) VALUES
(1, 2, 1, '7.99', 2, '18.00'),
(2, 1, 1, '7.99', 2, '12.00'),
(3, 3, 16, '4.99', 2, '10.00'),
(4, 4, 18, '8.36', 1, '8.36'),
(5, 5, 37, '12.08', 1, '12.08'),
(6, 6, 51, '8.36', 2, '16.72'),
(7, 6, 36, '9.30', 3, '27.90'),
(8, 6, 44, '18.60', 4, '74.40'),
(9, 6, 50, '7.43', 1, '7.43'),
(10, 6, 30, '8.36', 1, '8.36'),
(11, 7, 49, '7.43', 1, '7.43'),
(12, 7, 44, '18.60', 1, '18.60'),
(13, 7, 30, '8.36', 1, '8.36'),
(14, 7, 32, '8.36', 1, '8.36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Product`
--

CREATE TABLE `Product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `num_product` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Product`
--

INSERT INTO `Product` (`id`, `category_id`, `title`, `author`, `price`, `discount`, `thumbnail`, `num_product`, `description`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 7, 'Tom Clancy\'s Oath of Office', 'Marc Cameron', '7.99', '7.43', 'https://images-eu.bookshop.org/images/9781405935470.jpg?height=500&v=v4-416f20be2b2a85096fa4ee8298edd4a0', 10, 'A GRIPPING THRILLER IN TOM CLANCY\'S INTERNATIONALLY BESTSELLING JACK RYAN SERIES - INSPIRATION FOR THE BLOCKBUSTER AMAZON PRIME TELEVISION SERIES.\r\n\r\nAs the Kremlin orders troops to mass on the Ukrainian border, a Russian plane carrying nukes disappears mid-flight.\r\n\r\nFor US President Jack Ryan this means attempting to defuse a war on Europe\'s flanks before it engulfs the whole continent.\r\n\r\nFor his son, Campus secret agent Jack Jr, finding the nukes means covertly heading to the heart of the Middle East where militants seek to bring America to its knees.\r\n\r\nAs East-West tensions escalate, tying the hands of President and son alike, both race against time to stop a weapon ending the world as we know it . . .', '2021-11-20 13:19:17', '2021-11-21 13:38:34', 0),
(16, 29, 'The Starless Sea', 'Erin Morgenstern', '7.59', '5.99', 'https://www.penguin.co.uk/content/dam/prh/books/111/1110624/9781473524231.jpg.transform/PRHDesktopWide_small/image.jpg', 10, '\'A journey of wonder and imagination\' Stylist\r\n\r\nYou are invited to join Zachary on the starless sea: the home of storytellers, story-lovers and those who will protect our stories at all costs.\r\n\r\nDiscover the enchanting, magical new bestseller from the author of The Night Circus.\r\n\r\nWhen Zachary Rawlins stumbles across a strange book hidden in his university library it leads him on a quest unlike any other. Its pages entrance him with their tales of lovelorn prisoners, lost cities and nameless acolytes, but they also contain something impossible: a recollection from his own childhood.\r\n\r\nDetermined to solve the puzzle of the book, Zachary follows the clues he finds on the cover - a bee, a key and a sword. They guide him to a masquerade ball, to a dangerous secret club, and finally through a magical doorway created by the fierce and mysterious Mirabel. This door leads to a subterranean labyrinth filled with stories, hidden far beneath the surface of the earth.\r\n\r\nWhen the labyrinth is threatened, Zachary must race with Mirabel, and Dorian, a handsome barefoot man with shifting alliances, through its twisting tunnels and crowded ballrooms, searching for the end of his story.\r\n\r\n\'Enchanting read... an ode to stories and storytelling itself, and the joy of reading\' Guardian\r\n\r\n\'Spellbinding\' Daily Mirror\r\n\r\n\'A magical mix of quests and fables...beautifully written\' Heat', '2021-11-20 10:03:08', '2021-11-20 10:04:12', 0),
(17, 7, 'Origin', 'Dan Brown', '8.99', '8.26', 'https://www.penguin.co.uk/content/dam/prh/books/111/1113984/9780552174169.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Robert Langdon, Harvard professor of symbology and religious iconology, arrives at the Guggenheim Museum Bilbao to attend the unveiling of an astonishing scientific breakthrough. The evening\'s host is billionaire Edmond Kirsch, a futurist whose dazzling high-tech inventions and audacious predictions have made him a controversial figure around the world.\r\n\r\nBut Langdon and several hundred guests are left reeling when the meticulously orchestrated evening is suddenly blown apart. There is a real danger that Kirsch\'s precious discovery may be lost in the ensuing chaos. With his life under threat, Langdon is forced into a desperate bid to escape Bilbao, taking with him the museum\'s director, Ambra Vidal. Together they flee to Barcelona on a perilous quest to locate a cryptic password that will unlock Kirsch\'s secret.\r\n\r\nTo evade a devious enemy who is one step ahead of them at every turn, Langdon and Vidal must navigate the labyrinthine passageways of extreme religion and hidden history. On a trail marked only by enigmatic symbols and elusive modern art, Langdon and Vidal will come face-to-face with a breathtaking truth that has remained buried - until now.', '2021-11-21 13:28:34', '2021-11-21 13:28:34', 0),
(18, 7, 'Black Sun', 'Owen Matthews', '8.99', '8.99', 'https://www.penguin.co.uk/content/dam/prh/books/111/1118026/9781787631823.jpg.transform/PRHDesktopWide_small/image.jpg', 10, '1961. Hidden deep within the forests of central Soviet Russia is a place that doesn’t appear on any map: a city called Arzamas-16. Here a community of dedicated scientists, technicians and engineers are building the most powerful nuclear device the world will ever see – three thousand times more powerful than Hiroshima.\r\n\r\nBut ten days before the bomb is to be tested, a young physicist is found dead. His body contains enough radioactive poison to kill thousands. The Arzamas authorities believe it is suicide – they want the corpse disposed of and the incident forgotten. But someone in Moscow is alarmed by what’s going on in this strange, isolated place.\r\n\r\nAnd so Major Alexander Vasin – a mostly good KGB officer – is despatched to Arzamas to investigate. What he finds there is unlike anything he’s experienced before. His wits will be tested against some of the most brilliant minds in the Soviet Union – eccentrics, patriots and dissidents who, because their work is considered to be of such vital national importance, have been granted the freedom to think and act, live and love as they wish. In Arzamas, nothing can be allowed to get in the way of the project. Not even murder . . .\r\n\r\nIntricately researched, cunningly plotted and brilliantly told, Black Sun is a fast-paced and timely thriller set at the height – and in the heart – of Soviet power.', '2021-11-21 13:55:35', '2021-11-25 06:48:33', 0),
(19, 7, 'Jurassic Park', 'Michael Crichton', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/103/1033260/9781784752224.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'On a remote jungle island, genetic engineers have created a dinosaur game park.\r\n\r\nAn astonishing technique for recovering and cloning dinosaur DNA has been discovered. Now one of mankind\'s most thrilling fantasies has come true and the first dinosaurs that the Earth has seen in the time of man emerge.\r\n\r\nBut, as always, there is a dark side to the fantasy and after a catastrophe destroys the park\'s defence systems, the scientists and tourists are left fighting for survival...\r\n\r\nWith this masterful cross of science fiction and action-adventure, Michael Crichton created one of the biggest bestsellers of all time, turned by Steven Spielberg into the highest grossing blockbuster ever in 1993.', '2021-11-21 13:25:38', '2021-11-21 13:25:38', 0),
(20, 7, 'The Cretan Runner', 'George Psychoundakis', '9.99', '9.29', 'https://www.penguin.co.uk/content/dam/prh/books/242/24290/9780141043340.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'George Psychoundakis was a young shepherd boy who knew the island of Crete intimately when the Nazis invaded by air in 1941. He immediately joined the resistance and took on the crucial job of war-time runner.\r\n\r\nIt was not only the toughest but the most dangerous job of all. It involved immense journeys carrying vital messages, smuggling arms and explosives and guiding Allied soldiers, agents and commandos through heavily garrisoned territory. And George did not escape capture and torture on his many forays.\r\n\r\nThis brilliant account of George\'s activities across mountainous terrain, come blazing summer or freezing winter, is a gripping story of bravery against impossible odds.', '2021-11-21 13:27:39', '2021-11-21 13:27:39', 0),
(21, 29, 'Darien', 'C. F. Iggulden', '4.99', '4.99', 'https://www.penguin.co.uk/content/dam/prh/books/304/304197/9780718186494.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Twelve families race for a throne soon to be made vacant - by murder or civil war. Into this fevered, hungry city come six strangers:\r\n\r\nAn orphan and an old swordsman.\r\n\r\nA hunter and a pitiless killer.\r\n\r\nA young thief and a cynical chancer.\r\n\r\nAs the sun sinks the city will know no slumber. For long dormant passions have awoken. Fortunes will be won and lost. Lives will be staked and claimed.', '2021-11-21 13:48:43', '2021-11-21 13:48:43', 0),
(22, 29, 'Northern Lights: His Dark Materials 1', 'Philip Pullman', '5.99', '5.99', 'https://www.penguin.co.uk/content/dam/prh/books/110/1109192/9781448196876.jpg.transform/PRHDesktopWide_small/image.jpg', 10, '‘Without this child, we shall all die.’\r\n\r\nLyra Belacqua lives half-wild and carefree among the scholars of Jordan College, with her daemon, Pantalaimon, always by her side.\r\n\r\nBut the arrival of her fearsome uncle, Lord Asriel, draws her to the heart of a terrible struggle – a struggle born of stolen children, witch clans and armoured bears.', '2021-11-21 13:44:45', '2021-11-21 13:44:45', 0),
(23, 29, 'The Subtle Knife: His Dark Materials 2', 'Philip Pullman', '4.99', '4.99', 'https://www.penguin.co.uk/content/dam/prh/books/110/1109209/9781448196920.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Lyra finds herself in a shimmering, haunted otherworld – Cittàgazze, where soul-eating Spectres stalk the streets and wingbeats of distant angels sound against the sky.\r\n\r\nBut she is not without allies: twelve-year-old Will Parry, fleeing for his life after taking another\'s, has also stumbled into this strange new realm.\r\n\r\nOn a perilous journey from world to world, Lyra and Will uncover a deadly secret: an object of extraordinary and devastating power.\r\n\r\nAnd with every step, they move closer to an even greater threat – and the shattering truth of their own destiny.', '2021-11-21 13:55:46', '2021-11-21 13:55:46', 0),
(24, 29, 'La Belle Sauvage: The Book of Dust Volume One', 'Philip Pullman', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/311/311490/9780241365854.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'Malcolm Polstead\'s Oxford life has been one of routine, ordinary even.\r\n\r\nHe is happiest playing with his daemon, Asta, in their canoe, La Belle Sauvage. But now as the rain builds, the world around Malcolm and Asta it seems is set to become increasingly far from ordinary.\r\n\r\nFinding himself linked to a baby by the name of Lyra Belacqua, Malcolm is forced to undertake the challenge of his life and to make a dangerous journey that will change him and Lyra for ever . . .', '2021-11-21 13:55:49', '2021-11-21 13:55:49', 0),
(25, 28, 'Death in the East', 'Abir Mukherjee', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/111/1114700/9781784708535.jpg.transform/PRHDesktopWide_small/image.jpg', 5, '1905, London.\r\n\r\nWhen Bessie Drummond, an old flame of Sam Wyndham\'s, is attacked in the street, he is determined to get to the bottom of it. But the next day, Bessie is found dead in her room and Wyndham soon finds himself caught up in her murder investigation. The case will cost the young constable more than he ever imagined.\r\n\r\n1922, India.\r\n\r\nLeaving Calcutta, Wyndham heads for the hills of Assam, ready to put his opium addiction behind him. But when he arrives, he sees a ghost from his life in London - a man thought to be long dead, a man Wyndham hoped he would never see again.\r\n\r\nWyndham knows he must call his friend and colleague Sergeant Banerjee for help. He is certain that this figure from can only be after one thing: revenge...', '2021-11-21 13:42:51', '2021-11-21 13:42:51', 0),
(26, 28, 'Prodigal Son', 'Gregg Hurwitz', '7.99', '7.43', 'https://www.penguin.co.uk/content/dam/prh/books/313/313010/9781405942676.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'As Orphan-X, Evan Smoak was trained to be a secret government assassin - until he quit.\r\n\r\nAs the Nowhere Man, he\'s the guy to call if no one else can help. He\'ll save you.\r\n\r\nBut when a woman gets in touch claiming to be his mother, he can\'t know if his true family needs help or this is a trap.\r\n\r\nHas Evan\'s past reached out to claim him?', '2021-11-21 13:46:52', '2021-11-21 13:46:52', 0),
(27, 28, 'Three Hours', 'Rosamund Lupton', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/311/311970/9780241374511.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'In rural Somerset in the middle of a blizzard, the unthinkable happens: a school is under siege.\r\n\r\nPupils and teachers barricade themselves into classrooms, the library, the theatre. The headmaster lies wounded in the library, unable to help his trapped students and staff. Outside, a police psychiatrist must identify the gunmen, while parents gather desperate for news.', '2021-11-21 13:59:57', '2021-11-21 13:59:57', 0),
(28, 28, 'Blue Moon', 'Lee Child', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/111/1112878/9780857503633.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'It\'s a random universe, but once in a blue moon things turn out just right.\r\n\r\nIn a nameless city, two rival criminal gangs are competing for control. But they hadn\'t counted on Jack Reacher arriving on their patch.\r\n\r\nReacher is trained to notice things.\r\n\r\nHe\'s on a Greyhound bus, watching an elderly man sleeping in his seat, with a fat envelope of cash hanging out of his pocket. Another passenger is watching too ... hoping to get rich quick.\r\n\r\nAs the mugger makes his move, Reacher steps in.\r\n\r\nThe old man is grateful, yet he turns down Reacher\'s offer to help him home. He\'s vulnerable, scared, and clearly in big, big trouble.\r\n\r\nWhat hold could the gangs have on the old guy? Will Reacher be in time to stop bad things happening?\r\n\r\nThe odds are better with Reacher involved. That\'s for damn sure.', '2021-11-21 13:10:59', '2021-11-21 13:10:59', 0),
(29, 28, 'Fear No Evil', 'James Patterson', '20.00', '18.60', 'https://www.penguin.co.uk/content/dam/prh/books/111/1119837/9781529125252.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'He\'s not on the job, but on a personal mission.\r\n\r\nUntil he\'s attacked by two rival teams of assassins, controlled by the same mastermind who has stalked Alex and his family for years.\r\n\r\nDarkness falls. The river churns into rapids. Shots ring out through the forest.', '2021-11-21 14:12:00', '2021-11-21 14:12:00', 0),
(30, 30, 'The Second Sleep', 'Robert Harris', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/111/1115731/9781787460966.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'It\'s a crime to be out after dark, and Fairfax knows he must arrive at his destination - a remote village in the wilds of Exmoor - before night falls and curfew is imposed.\r\n\r\nHe\'s lost and he\'s becoming anxious as he slowly picks his way across a countryside strewn with the ancient artefacts of a civilisation that seems to have ended in cataclysm.\r\n\r\nWhat Fairfax cannot know is that, in the days and weeks to come, everything he believes in will be tested to destruction, as he uncovers a secret that is as dangerous as it is terrifying ...', '2021-11-21 14:34:02', '2021-11-21 14:34:02', 0),
(31, 30, 'Redhead by the Side of the Road', 'Anne Tyler', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/111/1119013/9781784743475.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'Micah Mortimer isn\'t the most polished person you\'ll ever meet. His numerous sisters and in-laws regard him oddly but very fondly, but he has his ways and means of navigating the world. He measures out his days running errands for work - his TECH HERMIT sign cheerily displayed on the roof of his car - maintaining an impeccable cleaning regime and going for runs (7:15, every morning). He is content with the steady balance of his life.\r\n\r\nBut then the order of things starts to tilt. His woman friend Cassia (he refuses to call anyone in her late thirties a \'girlfriend\') tells him she\'s facing eviction because of a cat. And when a teenager shows up at Micah\'s door claiming to be his son, Micah is confronted with another surprise he seems poorly equipped to handle.\r\n\r\nRedhead by the Side of the Road is an intimate look into the heart and mind of a man who sometimes finds those around him just out of reach - and a love story about the differences that make us all unique.', '2021-11-21 14:05:04', '2021-11-21 14:05:04', 0),
(32, 30, 'That Reminds Me', 'Derek Owusu', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/111/1119063/9781529118605.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Anansi, your four gifts raised to nyame granted you no power over the stories I tell...\r\n\r\nThis is the story of K.\r\n\r\nK is sent into care before a year marks his birth. He grows up in fields and woods, and he is happy, he thinks. When K is eleven, the city reclaims him. He returns to an unknown mother and a part-time father, trading the fields for flats and a community that is alien to him. Slowly, he finds friends. Eventually, he finds love. He learns how to navigate the city. But as he grows, he begins to realise that he needs more than the city can provide. He is a man made of pieces. Pieces that are slowly breaking apart\r\n\r\nThat Reminds Me is the story of one young man, from birth to adulthood, told in fragments of memory. It explores questions of identity, belonging, addiction, sexuality, violence, family and religion. It is a deeply moving and completely original work of literature from one of the brightest British writers of today.', '2021-11-21 14:08:05', '2021-11-21 14:08:05', 0),
(33, 32, 'The Book of Accidents', 'Chuck Wendig', '16.98', '15.79', 'https://www.penguin.co.uk/content/dam/prh/books/111/1119753/9781529101072.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'When Nate\'s father dies, he leaves behind a final gift for his son: his childhood home. Married now, Nate decides to move in with his wife, Maddie, and their son, Oliver, seeking peace from the chaos of the city.\r\n\r\nBut it doesn\'t take long before things get strange in the night and even stranger by day.\r\n\r\nBecause Nate was a child being abused by his father, and has never told his family. Because Maddie was a little girl who saw something she shouldn\'t have. Because something sinister, something hungry, walks in the tunnels and the mountains and the coal mines of this town in rural Pennsylvania...\r\n\r\nAnd now, what happened all those years ago is happening again, and this time, it is happening to Oliver. When he meets a strange boy with secrets of his own and a taste for dark magic, he has no idea that what comes next will put his family at the heart of a battle of good versus evil.', '2021-11-21 14:21:08', '2021-11-21 14:21:08', 0),
(34, 32, 'The Woman in Black', 'Susan Hill', '4.99', '4.99', 'https://www.penguin.co.uk/content/dam/prh/books/103/1033645/9781473521025.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Arthur Kipps, a junior solicitor, is summoned to attend the funeral of Mrs Alice Drablow, the sole inhabitant of Eel Marsh House. The house stands at the end of a causeway, wreathed in fog and mystery, but it is not until he glimpses a wasted young woman, dressed all in black, at the funeral, that a creeping sense of unease begins to take hold, a feeling deepened by the reluctance of the locals to talk of the woman in black - and her terrible purpose.', '2021-11-21 14:17:09', '2021-11-21 14:17:09', 0),
(35, 32, 'The Hollow Ones', 'Guillermo del Toro  Chuck Hogan', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/112/1120094/9781529100945.jpg.transform/PRHDesktopWide_small/image.jpg', 1, 'Odessa\'s life is derailed when she\'s forced to turn her gun on her partner, who turns suddenly, inexplicably violent while apprehending a rampaging murderer. The shooting, justified by self-defence, shakes Odessa to her core and she is placed on desk leave pending a full investigation.\r\n\r\nBut what most troubles her isn\'t the tragedy itself - it\'s the shadowy presence she thought she saw fleeing the deceased agent\'s body after his death.\r\n\r\nQuestioning her future with the FBI and her sanity, Odessa accepts a low-level assignment to clear out the belongings of a retired agent in the New York office. What she finds there will put her on the trail of a mysterious figure named Hugo Blackwood, a man of enormous means who claims to have been alive for centuries. What he tells her could mean he\'s an unhinged lunatic. That, or he\'s humanity\'s best and only defence against an unspeakable evil that could corrupt even the best of us . . .', '2021-11-21 14:23:10', '2021-11-21 14:23:10', 0),
(36, 33, 'Kumukanda', 'Kayo Chingonyi', '10.00', '9.30', 'https://www.penguin.co.uk/content/dam/prh/books/111/1112511/9781784741396.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'Translating as \'initiation\', kumukanda is the name given to the rites a young boy from the Luvale tribe must pass through before he is considered a man. The poems of Kayo Chingonyi\'s remarkable debut explore this passage: between two worlds, ancestral and contemporary; between the living and the dead; between the gulf of who he is and how he is perceived.\r\n\r\nUnderpinned by a love of music, language and literature, here is a powerful exploration of race, identity and masculinity, celebrating what it means to be British and not British, all at once.', '2021-11-21 14:58:13', '2021-11-21 14:58:13', 0),
(37, 33, 'Great Goddesses', 'Nikita Gill', '12.99', '12.08', 'https://www.penguin.co.uk/content/dam/prh/books/111/1118016/9781529104646.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Wonder at Medusa\'s potent venom, Circe\'s fierce sorcery and Athena rising up over Olympus, as Nikita Gill majestically explores the untold stories of the life bringers, warriors, creators, survivors and destroyers that shook the world - the great Greek Goddesses.\r\n\r\nVividly re-imagined and beautifully illustrated, step into an ancient world transformed by modern feminist magic.\r\n\r\n\'I watch Girl become Goddess\r\nand the metamorphosis is more\r\nmagnificent than anything\r\nI have ever known.\'', '2021-11-21 14:56:14', '2021-11-21 14:56:14', 0),
(38, 33, 'Hera Lindsay Bird', 'Hera Lindsay Bird', '9.99', '9.29', 'https://www.penguin.co.uk/content/dam/prh/books/307/307929/9780141987408.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'this impressive debut has established Hera Lindsay Bird as a good girl......with many beneficial thoughts and feelings......\r\n\r\nwith themes as varied as snow and tears, the poems in this collection shine with the fantastic cream of who she is................juxtaposing many classical and modern breezes\r\n\r\nBird turns her prescient eye on love and loss, and what emerges is like a helicopter in fog......or a bejewelled Christmas sleigh, gliding triumphantly through the contemporary aesthetic desert.........\r\n\r\nthis is at once an intelligent and compelling fantasy of tenderness......\r\n\r\nheart-breaking and charged with trees......without once sacrificing the forest............\r\n\r\nwhether you are masturbating luxuriously in your parents\' sleepout..........\r\n\r\n..........or pushing a pork roast home in a vintage pram...................\r\n\r\nthis is the book for you.............................................\r\n\r\nheroically and compulsively stupid..................................................................\r\n\r\n...........................................................whipping you once again into medieval sunlight.', '2021-11-21 14:07:16', '2021-11-21 14:07:16', 0),
(39, 35, 'Doctor Who: Molten Heart', 'Una McCormack', '10.99', '10.22', 'https://www.penguin.co.uk/content/dam/prh/books/111/1116664/9781785943638.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'Deep below the surface of the planet Adamantine lies a crystalline wonder world of lava seas and volcanic islands, home to living rock-people.\r\n\r\nBut when the Doctor and her friends arrive on Adamantine they find it under threat. The seas are shrinking, the magma is cooling, and mysterious, fatal seething pools are spreading fast.\r\n\r\nSomething has come to Adamantine – but what does it want? Fearing an invasion is underway, the Doctor must lead an expedition to the surface of the world to save its molten heart…', '2021-11-21 14:38:17', '2021-11-21 14:38:17', 0),
(40, 35, 'Thrawn: Alliances (Star Wars)', 'Timothy Zahn', '9.99', '9.29', 'https://www.penguin.co.uk/content/dam/prh/books/111/1115389/9781473555914.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Ominous words under any circumstances, but all the more so when uttered by Emperor Palpatine. On Batuu, at the edges of the Unknown Regions, a threat to the Empire is taking root—its existence little more than a glimmer, its consequences as yet unknowable. But it is troubling enough to the Imperial leader to warrant investigation by his most powerful agents: ruthless enforcer Lord Darth Vader and brilliant strategist Grand Admiral Thrawn. Fierce rivals for the emperor’s favor, and outspoken adversaries on Imperial affairs—including the Death Star project—the formidable pair seem unlikely partners for such a crucial mission. But the Emperor knows it’s not the first time Vader and Thrawn have joined forces. And there’s more behind his royal command than either man suspects.\r\n\r\nIn what seems like a lifetime ago, General Anakin Skywalker of the Galactic Republic, and Commander Mitth’raw’nuruodo, officer of the Chiss Ascendancy, crossed paths for the first time. One on a desperate personal quest, the other with motives unknown . . . and undisclosed. But facing a gauntlet of dangers on a far-flung world, they forged an uneasy alliance—neither remotely aware of what their futures held in store.\r\n\r\nNow, thrust together once more, they find themselves bound again for the planet where they once fought side by side. There they will be doubly challenged—by a test of their allegiance to the Empire . . . and an enemy that threatens even their combined might.', '2021-11-21 14:23:18', '2021-11-21 14:23:18', 0),
(41, 35, 'Solo: A Star Wars Story', 'Mur Lafferty', '8.99', '8.26', 'https://www.penguin.co.uk/content/dam/prh/books/111/1117196/9781787462076.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Though Han Solo has thrilled Star Wars fans for decades, the notorious wisecracking scoundrel was chasing adventure and dodging trouble long before he walked into the cantina at Mos Eisley spaceport.\r\n\r\nYoung Han dreams of someday soaring into space at the helm of his own starship and leaving his home, the gritty industrial planet Corellia, far behind. But as long as he’s trapped in a life of poverty and crime—and under the thumb of the sinister Lady Proxima and her brutal street gang—reaching the distant stars seems impossible. When Han tries to escape with his girlfriend and partner-in-crime, Qi’ra, he makes it out—but she doesn’t. Desperate for a way to find his own offworld vessel and free her, Han enlists in the Imperial Navy—the last place for a rebellious loner who doesn’t play well with others.\r\n\r\nWhen the Empire clips his wings, Han goes rogue and plunges into the shady world of smugglers, gamblers, and con artists. There he meets the charming and cunning high roller Lando Calrissian, makes an unlikely friend in a cantankerous Wookiee called Chewbacca, and first lays eyes on the Millennium Falcon. To snag his piece of the outlaw pie, Han joins a crew of pirates to pull off a risky heist. The stakes are high, the danger is great, and the odds are slim. But never tell Han Solo the odds.', '2021-11-21 14:30:19', '2021-11-21 14:30:19', 0),
(42, 34, 'Paris for One and Other Stories', 'Jojo Moyes', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/304/304857/9781405928168.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'In Paris for One, Nell is deserted by her boyfriend minutes before setting off on what was supposed to be a fantastic romantic weekend away to Paris. Can she forget him and find herself?\r\n\r\nHoneymoon in Paris is a tale of the early days of two marriages in both 1912 and 2012, featuring Liv and Sophie from Jojo Moyes\' bestselling romance The Girl You Left Behind.\r\n\r\nBeth is faced with a difficult decision in Bird in the Hand when she bumps into an old flame at a party, with her husband . . .\r\n\r\nYou\'ll love this unmissable collection of stories about love, family and relationships.', '2021-11-21 14:19:22', '2021-11-21 14:19:22', 0),
(43, 34, 'Finding Love at the Christmas Market', 'Jo Thomas', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/111/1118696/9780552176859.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Residential-home caterer Connie has had one online-dating disaster too many. Hurt in the past and with her son to consider, now she\'s feeling hesitant. Then one of Connie\'s residents sets her up on a date at a beautiful German Christmas market - with the promise she\'ll take a mini-bus full of pensioners along with her...\r\n\r\nAmongst the twinkling lights and smell of warm gingerbread in the old market square, Connie heads off on her date with a checklist of potential partner must-haves. Baker Henrich ticks all the boxes, but when Connie meets Henrich\'s rival William, she starts to wonder if ticking boxes is the answer.', '2021-11-21 14:07:23', '2021-11-21 14:07:23', 0),
(44, 34, 'The Horsewoman', 'James Patterson', '20.00', '18.60', 'https://www.penguin.co.uk/content/dam/prh/books/144/1443539/9781529135534.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'Maggie Atwood and Becky McCabe - mother and daughter, both champion riders - vowed to never, ever, compete against one another.\r\n\r\nBut a dramatic turn of events ahead of the Paris Olympics changes everything.\r\n\r\nMother and daughter share a dream: to be the best in the world. Only one rider can fulfil that dream and make history.', '2021-11-21 14:56:23', '2021-11-21 14:56:23', 0),
(45, 36, 'Girl, Balancing & Other Stories', 'Helen Dunmore', '20.00', '17.20', 'https://www.penguin.co.uk/content/dam/prh/books/111/1116361/9781473559691.jpg.transform/PRHDesktopWide_small/image.jpg', 5, '\'Wisdom and wit shine out from Helen Dunmore’s last stories\' The Times\r\n\r\n\'It was her emotional concision that made her so exceptional, a quality on ample display in these posthumous short stories ... some absolute gems\' Mail on Sunday\r\n\r\n\'I couldn’t recommend these stories more.\' Evening Standard', '2021-11-21 14:32:27', '2021-11-21 14:32:27', 0),
(46, 36, 'Florida', 'Lauren Groff', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/111/1115985/9781473558496.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'In these vigorous stories, Lauren Groff brings her electric storytelling to a world in which storms, snakes and sinkholes lurk at the edge of everyday life, but the greater threats are of a human, emotional and psychological nature. Among those navigating it all are a resourceful pair of abandoned sisters; a lonely boy, grown up; a restless, childless couple; a searching, homeless woman; and an unforgettable conflicted wife and mother.\r\n\r\nThe stories in this collection span characters, towns, even centuries, but Florida – its landscape, climate, history and state of mind – becomes the gravitational centre. With shocking accuracy, Groff pinpoints the connections behind human pleasure and pain, hope and despair, love and fury – the moments that make us alive.', '2021-11-21 14:11:28', '2021-11-21 14:11:28', 0),
(47, 36, 'Homesick For Another World', 'Ottessa Moshfegh', '9.99', '9.29', 'https://www.penguin.co.uk/content/dam/prh/books/110/1109100/9781784701505.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'There’s something eerily unsettling about Ottessa Moshfegh’s stories, something almost dangerous while also being delightful – and often even weirdly hilarious. Her characters are all unsteady on their feet; all yearning for connection and betterment, in very different ways, but each of them seems destined to be tripped up by their own baser impulses.\r\n\r\nThe flesh is weak; the timber is crooked; people are cruel to each other, and stupid, and hurtful, but beauty comes from strange sources, and the dark energy surging through these stories is oddly and powerfully invigorating.\r\n\r\n\r\nOne of the most gifted and exciting young writers in America, she shows us uncomfortable things, and makes us look at them forensically – until we find, suddenly, that we are really looking at ourselves.', '2021-11-21 14:59:28', '2021-11-21 14:59:28', 0),
(48, 37, 'The Miseducation of Cameron Post', 'Emily Danforth', '7.99', '7.43', 'https://www.penguin.co.uk/content/dam/prh/books/306/306317/9780141389165.jpg.transform/PRHDesktopWide_small/image.jpg', 10, '\'If Holden Caulfield had been a gay girl from Montana, this is the story he might have told-it\'s funny, heartbreaking, and beautifully rendered\' Curtis Sittenfeld, bestselling author of Prep and American Wife\r\n\r\n\'An important book - one that can change lives\' Jacqueline Woodson, award-winning author of Brown Girl Dreaming\r\n\r\n----------\r\n\r\nThe night Cameron Post\'s parents died, her first emotion was relief. Relief they would never know that hours earlier, she\'d been kissing a girl.\r\n\r\nNow living with her conservative Aunt in small-town Montana, hiding her sexuality and blending in becomes second nature to Cameron until she begins an intense friendship with the beautiful Coley Taylor.\r\n\r\nDesperate to \'correct\' her niece, Cameron\'s Aunt takes drastic action.\r\n\r\nNow Cameron must battle with the cost of being her true-self even if she\'s not completely sure who that is.\r\n\r\nThe Miseducation of Cameron Post is a stunning and unforgettable literary debut about discovering who you are and finding the courage to live life according to your own rules.', '2021-11-21 14:23:30', '2021-11-21 14:23:30', 0),
(49, 37, 'The Smoke Thieves', 'Sally Green', '7.99', '7.43', 'https://www.penguin.co.uk/content/dam/prh/books/301/301518/9780141375397.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'A princess, a traitor, a soldier, a hunter and a thief.\r\n\r\nFive teenagers with the fate of the world in their hands.\r\nFive nations destined for conflict.\r\n\r\nIn Brigant, Princess Catherine prepares for a political marriage arranged by her brutal and ambitious father, while her true love, Ambrose, faces the executioner\'s block.\r\n\r\nIn Calidor, downtrodden servant March seeks revenge on the prince who betrayed his people. In Pitoria, feckless Edyon steals cheap baubles for cheaper thrills as he drifts from town to town.\r\n\r\nAnd in the barren northern territories, thirteen-year-old Tash is running for her life as she plays bait for the gruff demon hunter Gravell.\r\n\r\nAs alliances shift and shatter, and old certainties are overturned, our five heroes find their past lives transformed and their futures inextricably linked by the unpredictable tides of magic and war.\r\n\r\nWho will rise and who will fall? And who will claim the ultimate prize?', '2021-11-21 14:59:30', '2021-11-21 14:59:30', 0),
(50, 37, 'Wonder Woman: Warbringer (DC Icons Series)', 'Leigh Bardugo', '7.99', '7.43', 'https://www.penguin.co.uk/content/dam/prh/books/305/305715/9780141387376.jpg.transform/PRHDesktopWide_small/image.jpg', 5, 'She will become a legend but first she is Diana, Princess of the Amazons. And her fight is just beginning . . .\r\n\r\nDiana is desperate to prove herself to her warrior sisters. But when the opportunity comes, she throws away her chance at glory and breaks Amazon law to save a mere mortal, Alia Keralis. With this single heroic act, Diana may have just doomed the world.\r\n\r\nAlia is a Warbringer - a descendant of the infamous Helen of Troy, fated to bring about an age of bloodshed and misery. Diana and Alia will face an army of enemies, mortal and divine, determined to destroy or possess the Warbringer.\r\n\r\nTo save the world, they must stand side by side against the tide of war.', '2021-11-21 14:41:31', '2021-11-21 14:41:31', 0),
(51, 7, 'Odessa Sea', 'Clive Cussler  Dirk Cussler', '8.99', '8.36', 'https://www.penguin.co.uk/content/dam/prh/books/297/297545/9781405927659.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'As Director of the National Underwater and Marine Agency, Dirk Pitt has always had a knack for finding rouble. This time, though, trouble has found him . . .\r\n\r\nOn a NUMA mission to the Black Sea to locate the wreck of a lost Ottoman Empire ship, Pitt and his friend Al Giordino respond to an urgent Mayday from a nearby freighter.\r\n\r\nBut by the time they reach the area there\'s no one left alive - just dead bodies and the smell of sulphur in the air. When a massive blast from the stern suddenly scuttles the ship, Pitt and Giordino are lucky not to add to the death toll.\r\n\r\nAs they investigate the fate of the lost ship, they\'re plunged deep into an extraordinary series of discoveries.\r\n\r\nAnd when connections emerge between a desperate attempt in 1917 o preserve the wealth and power of the Romanov empire, a Cold War bomber lost with a deadly cargo, modern-day nuclear smugglers and a brilliant engineer developing cutting-edge drone technology, Pitt is face with the most dangerous challenge of his career. One that will threaten the lives of his family and friends.\r\n\r\nPacked with breathtaking suspense, switchback plotting and remarkable imagination, Odessa Sea proves once again that, when it comes to adventure, Clive Cussler is in a league of his own.', '2021-11-21 15:10:55', '2021-11-21 15:10:55', 0),
(52, 28, 'The Sanatorium', 'Sarah Pearse', '12.08', '12.08', 'https://www.penguin.co.uk/content/dam/prh/books/111/1119497/9781787633315.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'An imposing, isolated hotel, high up in the Swiss Alps, is the last place Elin Warner wants to be. But she\'s taken time off from her job as a detective, so when she receives an invitation out of the blue to celebrate her estranged brother\'s recent engagement, she has no choice but to accept.\r\n\r\nArriving in the midst of a threatening storm, Elin immediately feels on edge. Though it\'s beautiful, something about the hotel, recently converted from an abandoned sanatorium, makes her nervous - as does her brother, Isaac.\r\n\r\nAnd when they wake the following morning to discover his fiancée Laure has vanished without a trace, Elin\'s unease grows. With the storm cutting off access to and from the hotel, the longer Laure stays missing, the more the remaining guests start to panic.', '2021-11-21 16:51:02', '2021-11-25 04:36:13', 0),
(53, 29, 'The Invasion of the Tearling', 'Erika Johansen', '9.99', '9.29', 'https://www.penguin.co.uk/content/dam/prh/books/109/1097118/9780857502483.jpg.transform/PRHDesktopWide_small/image.jpg', 10, 'With each passing day, Kelsea Glynn is growing into her new responsibilities as Queen of the Tearling. By stopping the shipments of slaves to the neighbouring kingdom of Mortmesne, she crossed the Red Queen, a brutal ruler whose power derives from dark magic, who is sending her fearsome army into the Tearling to take what is hers. And nothing can stop the invasion.\r\nBut as the Mort army draws ever closer, Kelsea develops a mysterious connection to a time before the Crossing, and she finds herself relying on a strange and possibly dangerous ally: a woman named Lily, fighting for her life in a world where being female can feel like a crime. The fate of the Tearling – and that of Kelsea’s own soul – may rest with Lily and her story, but Kelsea may not have enough time to find out.\r\nIn this dazzling sequel to her bestselling debut The Queen of the Tearling, Erika Johansen brings back favourite characters, including the Mace and the Red Queen, and introduces unforgettable new players, adding exciting layers to her multidimensional tale of magic, mystery and a fierce young heroine.', '2021-11-21 16:07:04', '2021-11-21 16:07:04', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Role`
--

CREATE TABLE `Role` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Role`
--

INSERT INTO `Role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Tokens`
--

CREATE TABLE `Tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Tokens`
--

INSERT INTO `Tokens` (`user_id`, `token`, `created_at`) VALUES
(1, '202232cef35fb5ca141e33fe641f92fa', '2021-11-23 13:11:53'),
(1, '280f6597aafce5651183fa0f50d3a781', '2021-11-25 06:23:31'),
(1, '290bc6068124dc8bd1069955b3d596e7', '2021-11-20 03:19:07'),
(1, '4977a94b8162cd13e0b1b7d8d85c8df7', '2021-11-20 03:48:25'),
(1, '60de1a694e9e1d9f30d56ef97ac285cf', '2021-11-19 11:07:01'),
(1, '69abf40cb7b8f3fdd68062b23370e384', '2021-11-20 04:16:33'),
(1, '6ba7793701b7556c96ba921f871bff77', '2021-11-20 03:43:35'),
(1, '7f9c0464faf533455f237f39d585e508', '2021-11-18 15:58:39'),
(1, '8222d47e5b83b87d80443ad97b5ef6f8', '2021-11-18 15:43:28'),
(1, 'a9a00fd00f18ab1ec578784ea4777fd3', '2021-11-19 10:39:14'),
(1, 'af2094e8e1466e0b2bd4508df51b9595', '2021-11-18 15:38:52'),
(1, 'b48afb025c3b6f9f6379dec4141acb32', '2021-11-19 10:41:31'),
(1, 'c61aa62d2c85d09cda403d4fb841e329', '2021-11-23 09:56:10'),
(1, 'f8b1aa6053b5b965a9c2d8aa1534e80b', '2021-11-23 01:05:15'),
(1, 'fc6f2913d4d2406e0429c88581d09be7', '2021-11-19 10:35:42'),
(1, 'fe471f179bb4927400162529646143b8', '2021-11-18 16:06:04'),
(10, '1f1d7b4347f6316b2c35bab47aa9b0bc', '2021-11-21 15:16:33'),
(10, '6fdad029e75763ac5829ccf86c268839', '2021-11-21 14:53:28'),
(10, 'c0772623070b9a8b8d7d7a0b914e3bed', '2021-11-21 15:15:00'),
(10, 'e0512c7c3ae34922c7e77f6961b24d1b', '2021-11-21 15:17:00'),
(10, 'ff132cdd04bc45b742b95c5440bead70', '2021-11-21 15:01:52'),
(11, '3e4f3bdda2d4e7299dbabbce4cc75fa8', '2021-11-23 01:14:58'),
(11, 'b210e6d0e4a38ea81f3041f51b7f8ea5', '2021-11-23 13:12:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `User`
--

INSERT INTO `User` (`id`, `fullname`, `email`, `phone_number`, `address`, `password`, `role_id`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Trịnh Mạch Huy Phú', 'kozfast22@gmail.com', '0792571353', 'Sóc Trăng', '38dec841b30e3dc9262d8b335a0a765d', 1, '2021-11-18 14:53:35', '2021-11-20 04:30:19', 0),
(2, 'Trịnh Mạch Huy Phú', 'kozfast@gmail.com', '', '', '4d07e890cb9dde3fd3818d34c2f4049c', 2, '2021-11-19 15:24:29', '2021-11-20 03:15:33', 1),
(3, 'Trần Văn A', 'tranvana@gmail.com', '0123456789', 'Vĩnh Long', '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-19 15:33:53', '2021-11-20 04:30:28', 0),
(4, 'Lê Văn Tèo', 'levanteo@gmail.com', '', '', '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-20 04:35:15', '2021-11-20 04:35:15', 0),
(5, 'Forly', 'forly1301@gmail.com', NULL, NULL, '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-20 04:35:59', '2021-11-20 04:35:59', 0),
(6, 'Lirin', 'lirin@gmail.com', '', '', '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-20 04:36:24', '2021-11-24 15:31:32', 0),
(7, 'Nguyễn Thị N', 'nguyenthin@gmail.com', NULL, NULL, '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-20 04:37:01', '2021-11-20 04:37:01', 0),
(8, 'Trần Văn C', 'tranvanc@gmail.com', '', '', '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-20 04:37:48', '2021-11-24 14:57:22', 1),
(9, 'Nguyễn Tài', 'nguyentai@gmail.com', '', '', '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-20 04:38:29', '2021-11-20 04:38:29', 0),
(10, 'Trần Hải Long', 'tranhailong@gmail.com', NULL, NULL, '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-21 14:49:22', '2021-11-21 14:49:22', 0),
(11, 'User123', '123@gmail.com', '0123456789', 'Hà Nội', '38dec841b30e3dc9262d8b335a0a765d', 2, '2021-11-23 01:14:48', '2021-11-24 14:59:09', 0),
(12, 'Steve Jobs', 'stevejobs@gmail.com', '0123456789', 'Cần Thơ', '431b201629e11cd455fd5af03e5c7cc4', 2, '2021-11-24 14:58:46', '2021-11-24 14:59:04', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `FeedBack`
--
ALTER TABLE `FeedBack`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `Gallery`
--
ALTER TABLE `Gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `Order_Details`
--
ALTER TABLE `Order_Details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `Tokens`
--
ALTER TABLE `Tokens`
  ADD PRIMARY KEY (`user_id`,`token`);

--
-- Chỉ mục cho bảng `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `FeedBack`
--
ALTER TABLE `FeedBack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `Gallery`
--
ALTER TABLE `Gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `Order_Details`
--
ALTER TABLE `Order_Details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `Role`
--
ALTER TABLE `Role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `Gallery`
--
ALTER TABLE `Gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

--
-- Các ràng buộc cho bảng `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

--
-- Các ràng buộc cho bảng `Order_Details`
--
ALTER TABLE `Order_Details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`);

--
-- Các ràng buộc cho bảng `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`);

--
-- Các ràng buộc cho bảng `Tokens`
--
ALTER TABLE `Tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

--
-- Các ràng buộc cho bảng `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
