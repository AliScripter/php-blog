-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 11, 2025 at 12:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(13, 'هوش مصنوعی'),
(14, 'بلاکچین'),
(15, 'اینترنت اشیا');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `post_id`, `status`) VALUES
(24, 'امین', 'عالی بود', 21, 1),
(25, 'سینا رضایی', 'هوش مصنوعی در حال تغییر سریع دنیای تکنولوژی است. از خودروسازی گرفته تا پزشکی، همه صنایع از این تکنولوژی بهره می‌برند. من به آینده این حوزه بسیار امیدوارم و فکر می‌کنم که بیشترین تاثیرات مثبت را در سال‌های آینده شاهد خواهیم بود.', 21, 1),
(26, 'فاطمه زارعی', 'هوش مصنوعی برای من همیشه جذاب بوده، اما به نظر می‌رسد که یکی از بزرگ‌ترین چالش‌ها در این حوزه، مسائل اخلاقی است. باید مراقب باشیم که این تکنولوژی به نفع انسان‌ها و نه به ضرر آنها پیش برود.', 22, 1),
(27, 'مهدی محمودی', 'هوش مصنوعی در حال حاضر در بسیاری از فرآیندهای صنعتی و تجاری نقش بسزایی دارد. امیدوارم در آینده نزدیک شاهد پیشرفت‌هایی در زمینه پزشکی و آموزش با استفاده از هوش مصنوعی باشیم.', 23, 1),
(28, 'علی مختاری', 'بلاکچین نه تنها به عنوان زیرساختی برای ارزهای دیجیتال بلکه به عنوان یک ابزار امنیتی در بسیاری از صنایع مختلف در حال گسترش است. من پیش‌بینی می‌کنم که در آینده‌ای نزدیک، بلاکچین نقش اساسی در حل مشکلات امنیتی اینترنت خواهد داشت.', 24, 0),
(29, 'زینب رحیمی', 'با وجود اینکه بلاکچین پتانسیل بالایی دارد، اما هنوز هم مشکلاتی مثل مقیاس‌پذیری و مصرف انرژی در این سیستم‌ها وجود دارد. فکر می‌کنم که اگر این مشکلات حل بشود، بلاکچین به بخش مهمی از زیرساخت‌های دیجیتال تبدیل خواهد شد.', 28, 0),
(30, 'محمد حسینی', 'من شخصاً به بلاکچین به عنوان یکی از مهم‌ترین تکنولوژی‌های آینده نگاه می‌کنم. این تکنولوژی می‌تواند شفافیت و امنیت را در تراکنش‌های مالی و دیگر حوزه‌ها به طور جدی بهبود ببخشد.', 25, 0),
(31, 'رضا سمیعی', 'اینترنت اشیا به راحتی می‌تواند زندگی ما را راحت‌تر و هوشمندتر کند. مثلاً با استفاده از دستگاه‌های متصل به اینترنت، می‌توان به راحتی خانه هوشمند ایجاد کرد یا سیستم‌های کشاورزی هوشمند راه‌اندازی کرد.', 27, 1),
(32, 'مهسا قاسمی', 'آینده اینترنت اشیا بسیار هیجان‌انگیز است. من به شخصه امیدوارم که در آینده‌ای نزدیک، خانه‌ها و شهرهای ما به‌طور کامل هوشمند شوند و بتوانیم از تکنولوژی‌هایی مثل اینترنت اشیا در همه‌جا استفاده کنیم.', 23, 0),
(33, 'احمد', 'هکر خفنی بوده', 26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `category_id`, `author`, `image`) VALUES
(21, 'OpenAI؛‌ شرکت مرموزی که می‌خواهد زودتر از همه به هوش مصنوعی انسان‌گونه برسد', '                                                                                                                در تقاطع خیابان هجدهم و فولسوم در سان‌فرانسیسکو، دفتر OpenAI شبیه انباری مرموز به‌نظر می‌رسد. این ساختمان قدیمی با آن نمای بی‌روح خاکستری و پنجره‌های دودی با کرکره‌های اکثرا پایین کشیده، همچون ورودی وزارت جادوی دنیای هری پاتر به نظر می‌رسد که به چشم «مشنگ‌ها» چیزی جز باجه‌تلفنی بی‌استفاده‌ای نیست که افراد عادی را از کنجکاوی درباره اتفاقات تاریخ‌ساز و حیرت‌انگیزی دور نگه می‌دارد که آن‌سوی دیوارهایش در جریان است. دورتادور این ساختمان نیز حروف قرمز رنگ‌ورورفته «PIONEER BUILDING» به‌چشم می‌خورد که از مالک قبلی آن، کارخانه کامیون‌سازی پایونیر، به‌جا مانده است؛ اما هیچ اثر و لوگویی از مالک فعلی آن نیست.\r\n<br />\r\n<br />\r\nدانشمندان این حوزه عموماً بر این باورند که اگر توسعه AGI مسیری با کمترین مقاومت را دنبال کند؛ یعنی نهادی نباشد تا برای آن قوانین سخت‌گیرانه وضع کند، به‌راحتی می‌تواند از کنترل خارج شود. این ترس و نگرانی با نگاه به وضعیت هوش مصنوعی ضعیف، یعنی همین مدل پردردسری که امروزه به‌شکل الگوریتم‌های شبکه‌های اجتماعی دورمان را احاطه کرده، توجیه‌پذیر است.\r\n<br />\r\n<br />\r\nمنبع و متن کامل این مقاله در زومیت :\r\n<br />\r\nhttps://www.zoomit.ir/tech/384025-openai-first-company-reach-agi/                                                                                                ', 13, 'مرجان شیخی', '1741638436_1.webp'),
(22, 'سامسونگ با Galaxy AI عصر هوش‌ مصنوعی موبایل را آغاز کرد', '                                                        سامسونگ از ماه‌ها پیش از رویداد آنپکد ۲۰۲۴، از آغاز عصر جدید هوش مصنوعی در گوشی‌های گلکسی S24 خبر داد و در پرسروصداترین و زرق‌وبرق‌ترین تبلیغ ممکن، سراغ سازه‌ی کروی غول‌پیکر Sphere در لاس‌وگاس رفت تا نشان دهد همان‌طور که شخصیت مارولی دکتر استرنج درحال باز کردن پرتال‌هایی به دنیاهای مختلف است، Galaxy AI نیز قرار است پرتال‌هایی از قابلیت‌های هیجان‌انگیز را به گوشی‌های گلکسی بیاورد.\r\n<br /><br />\r\nاین‌روزها هوش مصنوعی برای اکثر افراد یادآور چت‌بات‌هایی مثل ChatGPT یا مولدهای تصویری چون میدجرنی و DALL-E است؛ ابزارهای شگفت‌انگیزی که برای پردازش داده نیازمند سرورهای قدرتمندی در فضای ابری هستند و به‌همین‌خاطر، نمی‌توان از آن‌ها روی گوشی و به‌صورت آفلاین استفاده کرد.\r\n<br /><br />\r\nمنبع و متن کامل این مقاله در زومیت : \r\n<br />\r\nhttps://www.zoomit.ir/ai-articles/415285-galaxy-ai-unpacked2024/\r\n                                                ', 13, 'مرجان شیخی', '1741638891_2.webp'),
(23, 'ویجت جدید واتساپ دسترسی به هوش مصنوعی متا را ساده‌تر خواهد کرد', '                            پیش‌تر متوجه شدیم که واتساپ در حال آزمایش ویجت جدیدی برای صفحه‌ی اصلی اپلیکیشن خود در محیط اندروید است تا دسترسی به Meta AI را تسریع کند. اکنون مطلع شدیم که واتساپ قصد دارد با انتشار ویجت دیگری، دسترسی به هوش مصنوعی متا را آسان کند.\r\n<br />\r\n<br />\r\nبرخی از آزمایش‌کنندگان بتا می‌توانند ویژگی تازه‌ای را در واتساپ تجربه کنند که به آن‌ها اجازه می‌دهد یک ویجت اختصاصی برای Meta AI را مستقیماً به صفحه‌ی اصلی خود بیفزایند. کاربران می‌توانند اندازه‌ی این ویجت را به دلخواه خود تنظیم کنند.\r\n<br />\r\n<br />\r\nبه‌نقل از WABetaInfo، ویجت یادشده در نسخه‌ی بتای ۲٫۲۵٫۶٫۱۴ واتساپ برای اندروید کشف شده است. در تصاویر زیر می‌بینید که این ویجت از سه میانبر Meta AI بهره می‌برد؛ اولین میانبر به کاربران امکان می‌دهد چت‌بات Meta AI را باز کنند و سؤالی را بپرسند. میانبر دوم برای به اشتراک گذاشتن سریع عکس و ویرایش آن با Meta AI است و سومی برای تعامل صوتی با هوش مصنوعی متا.\r\n<br />\r\n<br />\r\nمنبع و متن کامل این مقاله در زومیت :\r\n<br />\r\nhttps://www.zoomit.ir/social-network/436102-whatsapp-new-widget-meta-ai-access/                        ', 13, 'محمد دزفولیان', '1741639145_3.webp'),
(24, 'بلاکچین؛ بزرگ‌ترین اختراع بعد از اینترنت!', 'شاید در اوایل ظهور اینترنت، کمتر کسی باور می‌کرد از نقطه‌ای از دنیا به نقطه‌ای دیگری بتوان عکس یا فیلم یا هر فایل دیگری فرستاد.\r\n<br /><br />\r\nدر اوایل ظهور اینترنت، اگر به کسی گفته می‌شد می‌توانید ازطریق اینترنت پولتان را جا‌به‌جا کنید، قطعا باور نمی‌کرد و حتی شاید شما را خیال‌باف و رؤیاپرداز می دانست. بااین‌حال امروزه، این موضوع امری بدیهی است و عملا سبک زندگی مردم به‌سمتی پیش رفته که اینترنت بخش جداناپذیر زندگی‌شان شده است.\r\n<br /><br />\r\nبلاک‌چین نیز دوره ای مشابه با اوایل اینترنت را می‌گذراند؛ تکنولوژی‌ای که بسیاری از افراد متخصص آن را انقلابی در تکنولوژی و تحول دیجیتال می‌دانند که نه‌تنها در زمینه‌های پولی و مالی پارادایم ایجاد کرده است؛ بلکه ظرفیت آن را دارد تا تغییر شگرفی در برنامه‌های کاربردی، مسائل حکومتی، دولتی و تمامی اموری ایجاد کند که با شخص ثالث مرتبط است. شاید ارائه‌ی مثالی ملموس همه را برای فهم کاربرد این تکنولوژی یاری کند. فرض کنید برای خریدوفروش ماشین، خانه و... دیگر نیازی به مراجعه به املاک مسکن یا نمایشگاه ماشین و... نباشد و خرید شما در محلی به‌نام «بلاک‌چِین» ثبت شود، سند ماشین یا خانه‌تان بدون دوندگی و به‌صورت خودکار پس از واریز وجه به نامتان زده شود و حتی کل مبلغ هم فقط با یک کلیک به فرد فروشنده ارسال شود. شاید چنین چیزی برایتان عجیب باشد؛ اما تمامی این‌ها به‌لطف تکنولوژی بلاک‌چین امکان‌پذیر و جالب‌تر اینکه این، تنها یکی از کاربردهای تکنولوژی بلاک‌چین است.\r\n<br /><br />\r\nمنبع و متن کامل این مقاله در زومیت :\r\n<br />\r\nhttps://www.zoomit.ir/pr/335954-mihanblockchain/\r\n', 14, 'ریپورتاژ آگهی', '1741639593_4.webp'),
(25, 'اولین رویداد اقتصاد بلاکچین تبریز', 'اولین رویداد اقتصاد بلاک‌چین تبریز با موضوع آشنایی با تکنولوژی بلاک‌چین و همچنین کاربردهای متنوع آن در حوزه‌های مختلف در ۲۷ تیرماه ۹۷ برگزار می‌شود.\r\n<br /><br />\r\nتکنولوژی بلاک چین در سال‌های اخیر توانسته است تاثیرات شگرفی را در دنیای امروز ما بر جای بگذارد. بسیاری از شرکت‌های بزرگ و حتی دولت‌ها به دنبال استفاده از ظرفیت‌های این تکنولوژی هستند. بسیاری از متخصصان و صاحب نظران معتقدند که بلاک‌چین ساختار اقتصاد، بسیاری از صنایع و حتی خود اینترنت را دگرگون خواهد کرد.\r\n<br /><br />\r\nشهر تبریز به عنوان یکی از قطب‌های صنعتی کشور که متخصصان خبره‌ی بسیاری نیز در حوزه‌ی فناوری دارد، پتانسیل بالایی برای به کارگیری این تکنولوژی در بخش‌های گوناگون دارد. بنابراین آشنایی با تکنولوژی بلاک چین برای توسعه اقتصادی در منطقه یک ضرورت برای مدیران، سرمایه‌گذاران، کارآفرینان و مسئولان این شهر است. از این رو رویداد اقتصاد بلاک‌چین به همت چند تن از فعالان فناوری و متخصصان حوزه‌ی بلاکچین در شهر تبریز بصورت مستقل و با حامی‌گری شرکت‌های خصوصی و دولتی برگزار خواهد شد.\r\n<br /><br />\r\nمنبع و متن کامل این مقاله در زومیت :\r\n<br />\r\nhttps://www.zoomit.ir/business/283863-tabriz-blockchain-economy-event/\r\n', 14, 'تیم زومیت', '1741639844_5.webp'),
(26, 'نظر بنیان‌گذار Dfinity پس از هک بای بیت: برنامه‌ها باید کاملا آنچین باشند', 'دومینیک ویلیامز (Dominic Williams)، بنیان‌گذار و دانشمند ارشد بنیاد دفینیتی (Dfinity Foundation)، یک سازمان غیرانتفاعی که توسعه و نگهداری پروتکل اینترنت کامپیوتر (Internet Computer Protocol – ICP) را بر عهده دارد، اخیراً در گفت‌وگویی اظهار داشت که برنامه‌ها باید به‌طور کاملا آنچین باشند تا از وقوع حملاتی مشابه هک اخیر بای‌بیت (Bybit) که باعث به خطر افتادن رابط کاربری شد، جلوگیری شود.\r\n<br /><br />\r\nبه گزارش میهن بلاکچین، ویلیامز توضیح داد که بیشتر برنامه‌های غیرمتمرکز و پروژه‌های بلاکچینی کنونی دارای اقتصاد توکنی آنچین هستند اما برای زیرساخت‌های خود به پلتفرم‌های متمرکز مانند آمازون وب سرویس (Amazon Web Services – AWS) متکی هستند.\r\n<br /><br />\r\nمنبع و متن کامل این مقاله در میهن بلاکچین :\r\n<br />\r\nhttps://mihanblockchain.com/onchain-ui-would-prevent-bybit-hack-dfinity/\r\n', 14, 'رضا حضرتی', '1741640339_6.png'),
(27, 'اینترنت اشیا یا IoT به زبان ساده', 'اینترنت اشیا یا به‌بیانی دقیق‌تر، «اینترنت چیزها» یعنی اتصال دستگاه‌های فیزیکی نظیر وسایل نقلیه، لوازم خانگی، گوشی‌های هوشمند و... به‌هم‌دیگر از طریق نرم‌افزارهای خاص، حسگرها و... است. در این فناوریِ به‌نسبت نوپا، تمامی دستگاه‌های متصل به یک شبکه، توانایی این را دارند که کارهایشان را به‌صورت خودکار انجام دهند؛ بر اساس تغییراتی که در محیط اطرافشان رخ‌ می‌دهد، یک سری پاسخ ویژه را به‌صورت کاملا خودکار از خود نشان دهند و همچنین می‌توانند داده‌های مختلف را بدون هرگونه دخالت انسان، با دیگر دستگاه‌های شبکه مبادله کنند.\r\n<br /><br />\r\nشاکله‌ی اصلی این فناوریِ جدید، بر پایه‌ی شبکه‌ی بی‌سیم و اینترنت ساخته شده و هدف اصلی آن، بهبود کارایی و دقت دستگاه‌های مختلف است. Internet of Things در کنار موارد یادشده، می‌تواند از لحاظ اقتصادی و حتی به‌منظور جلوگیری از اتلاف وقت، کمک‌حال مردم باشد.\r\n<br /><br />\r\nمنبع و متن کامل این مقاله در زومیت :\r\n<br />\r\nhttps://www.zoomit.ir/tech/287777-everything-about-the-internet-of-things-iot/\r\n', 15, 'مبین احمدی', '1741640584_7.webp'),
(28, 'شیائومی طی ۵ سال آینده هفت میلیارد دلار در حوزه 5G ،AI و IoT سرمایه‌گذاری می‌کند', 'با افزایش رقابت بازار در زمینه‌ی 5G، AI و IoT، شرکت چینی شیائومی نیز قصد دارد طی مدت ۵ سال آینده  ۵۰ میلیارد یوان برابر با ۷/۱۸ میلیارد دلار در این صنایع سرمایه‌گذاری کند.\r\n<br />\r\n<br />\r\nلی جون، مدیرعامل شیائومی در نامه‌ای که از طریق شبکه‌های اجتماعی به‌اشتراک گذاشته شد، در مورد برنامه‌های آتی سرمایه‌گذاری شرکت اطلاع‌رسانی کرد. البته وی در نامه‌ی مذکور، توضیحی در مورد جزئیات برنامه‌ی سرمایه‌گذاری ارائه نکرده است. \r\n<br />\r\n<br />\r\nشرکت شیائومی که کار خود را در پکن چین آغاز کرد و در بازار با گوشی‌‌های هوشمند مقرون‌به‌صرفه شناخته می‌شود، اکنون محصولات متنوعی از جمله تلویزیون‌های هوشمند تا لوازم خانگی تولید و به بازار عرضه می‌کند. البته نباید فراموش کنیم که در مقابل شیائومی، رقبای سرسختی در داخل کشور چین همچون هواوی قرار دارند که ۴۲ درصد سهم بازار گوشی‌های هوشمند بازار چین را در فصل سوم سال در حضور شرکت‌های دیگر تولید کننده‌ی گوشی‌های هوشمند از آن خود کرد.\r\n<br />\r\n<br />\r\nمنبع و متن کامل این مقاله در زومیت :\r\n<br />\r\nhttps://www.zoomit.ir/tech/343847-xiaomi-invest-7-billion-in-5g-ai-and-iot/', 15, 'تینا پورشاهید', '1741640813_8.webp');

-- --------------------------------------------------------

--
-- Table structure for table `posts_slider`
--

CREATE TABLE `posts_slider` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_slider`
--

INSERT INTO `posts_slider` (`id`, `post_id`, `active`) VALUES
(4, 21, 1),
(5, 26, 0),
(6, 27, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `name`, `email`) VALUES
(1, 'سارا', 'sara@gmail.com'),
(2, 'نیما', 'nima@gmail.com'),
(3, 'علی', 'ali@gmail.com'),
(4, 'sss', 's@gmail.com'),
(5, 'sss', 's@gmail.com'),
(6, 'sss', 's@gmail.com'),
(7, 'nnn', 'nn@gmail.com'),
(9, 'ali', 'ali@gmail2.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'ali@gmail.com', '123456789'),
(3, 'admin@gmail.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `posts_slider`
--
ALTER TABLE `posts_slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `posts_slider`
--
ALTER TABLE `posts_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts_slider`
--
ALTER TABLE `posts_slider`
  ADD CONSTRAINT `posts_slider_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
