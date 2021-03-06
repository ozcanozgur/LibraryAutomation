use master
go

IF EXISTS(select * from sys.databases where name='LibraryAutomation')
begin
ALTER DATABASE LibraryAutomation SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
drop database LibraryAutomation;
end
go


IF NOT EXISTS(select * from sys.databases where name='LibraryAutomation')
create database LibraryAutomation
go


use LibraryAutomation
go


CREATE TABLE Contact(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[MailAddress] [varchar](255) NULL,
	[Message] text NULL,
	);

	
	
	CREATE TABLE Member(
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Password] varchar (255) NOT NULL,
	[MailAddress] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](255) NOT NULL,
	[SchoolID] int not null unique,
	reserveSituation BIT default 0,
	PRIMARY KEY (MemberID),
	 );

	 Create Table Admin(
	AdminID int IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NOT NULL,
	password varchar(255) NOT NULL,
	[MailAddress] [varchar](255) NULL,
	[PhoneNumber] [varchar](255) NULL,
	);

	Create Table Books(
	BookID [int] IDENTITY(1,1) NOT NULL,
	Title [varchar](255) NULL,
	Genre [varchar](255) NULL,
	Author [varchar](255) NULL,
	Publisher [varchar](255) NULL,
	BookImage varchar(255),
	Summary text NULL,
	BookRate float default 1,
	StockSituation int default 1,
	PRIMARY KEY (BookID),
	);
	
	CREATE TABLE [Borrowed Books] (
    OrderID int IDENTITY(1,1) NOT NULL,
	BookID int NOT NULL,
    MemberID int,
	ExpiredDate date,
	borrowDate date,
	isBack BIT default 0,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
);

	Create Table ReservedBooks(
	ReserveID int IDENTITY(1,1) NOT NULL,
	BookID int NOT NULL,
    MemberID int,
	reserveDate date,
	isTaked BIT default 0,
    PRIMARY KEY (ReserveID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
	)

	Create Table RateAndCommentBooks(
	RateID int IDENTITY(1,1) NOT NULL,
	BookID int NOT NULL,
    MemberID int,
	rate float not null,
	rateDate date,
	comment text not null,
    PRIMARY KEY (RateID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
	)

	

	INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES (N'The Templars',N'History',N'Dan Jones',N'Viking','Thetemplars.jpg','Jerusalem 1119. A small group of knights seeking a purpose in the violent aftermath of the First Crusade decides to set up a new order. These are the first Knights Templar, a band of elite warriors prepared to give their lives to protect Christian pilgrims to the Holy Land. Over the next two hundred years, the Templars would become the most powerful religious order of the medieval world. Their legend has inspired fervent speculation ever since.
In this groundbreaking narrative history, Dan Jones tells the true story of the Templars for the first time in a generation, drawing on extensive original sources to build a gripping account of these Christian holy warriors whose heroism and alleged depravity have been shrouded in myth. The Templars were protected by the pope and sworn to strict vows of celibacy. They fought the forces of Islam in hand-to-hand combat on the sun-baked hills where Jesus lived and died, finding their nemesis in Saladin, who vowed to drive all Christians from the lands of Islam. 
Experts at channeling money across borders, they established the medieval world''s largest and most innovative banking network and waged private wars against anyone who threatened their interests.
Then, as they faced setbacks at the hands of the ruthless Mamluk sultan Baybars 
and were forced to retreat to their stronghold in Cyprus, a vindictive and 
cash-strapped King of France set his sights on their fortune. His administrators quietly mounted a 
damning case against the Templars, built on deliberate lies and false testimony. Then on Friday October 13, 1307, hundreds of brothers were arrested, imprisoned and tortured, and the order was disbanded amid lurid accusations of sexual misconduct and heresy. 
They were tried by the Pope in secret proceedings and their last master was brutally tortured and burned at the stake. But were they heretics or victims of a ruthlessly repressive state? 
Dan Jones goes back to the sources tobring their dramatic tale,
 so relevant to our own times, in a book that is at once authoritative and compulsively readable.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('The Perfect Horse','History','Elizabeth Letts','Ballantine Books','Theperfecthorse.jpg','In the chaotic last days of the war, a small troop of battle-weary American soldiers captures a German spy and makes an astonishing find--his briefcase is empty but for photos of beautiful white horses that have been stolen and kept on a secret farm behind enemy lines. Hitler has stockpiled the world''s finest purebreds in order to breed the perfect military machine--an equine master race. 
But with the starving Russian army closing in, the animals are in imminent danger of being slaughtered for food.
With only hours to spare, one of the U.S. Army''s last great cavalrymen, Colonel Hank Reed, makes a bold decision--with General George Patton''s blessing-to mount a covert rescue operation. Racing against time, Reed''s small but determined force of soldiers, aided by several turncoat Germans, steals across enemy lines in a last-ditch effort to save the horses. 
Pulling together this multistranded story, Elizabeth Letts introduces us to an unforgettable cast of characters: Alois Podhajsky, director of the famed Spanish Riding School of Vienna, a former Olympic medalist who is forced to flee the bomb-ravaged Austrian capital with his entire stable in tow; Gustav Rau, Hitler''s imperious chief of horse breeding, a proponent of eugenics who dreams of genetically engineering the perfect warhorse for Germany; and Tom Stewart, a senator''s son who makes a daring moonlight ride on a white stallion to secure the farm''s surrender.
A compelling account for animal lovers and World War II buffs alike, The Perfect Horse tells for the first time the full story of these events. Elizabeth Letts''s exhilarating tale of behind-enemy-lines adventure, courage, and sacrifice brings to life one of the most inspiring chapters in the annals of human valor.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Dunkirk','History','Joshua Levine','William Morrow & Company','Dunkirk.jpg','In 1940, the Allies had been beaten back by the Nazis across France to the northern port of Dunkirk. In the ultimate race against time, more than 300,000 Allied soldiers were daringly evacuated across the Channel. This moment of German aggression was used by Winston Churchill as a call to Franklin Roosevelt to enter the war.
 Now, Joshua Levine, the film''s official historian, explores the real lives of those soldiers, bombed and strafed on the beaches for days on end, without food or ammunition; the civilians whose boats were overloaded; the airmen who risked their lives to buy their companions on the ground precious time; and those who did not escape.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Rush','Romance','Maya Banks','Berkley Books','Rush.jpg','When Gabe Hamilton saw Mia Crestwell walk into the ballroom for his hotel''s grand opening, he knew he was going to hell for what he had planned. After all, Mia is his best friend''s little sister. Except she''s not so little anymore. And Gabe has waited a long time to act on his desires.
Gabe has starred in Mia''s fantasies more than once. So what if he''s fourteen years older? Mia knows he''s way out of her league, but her attraction has only grown stronger with time. She''s an adult now, and there''s no reason not to act on her most secret desires.
As Gabe pulls her into his provocative world, she realizes there''s a lot she doesn''t know about him or how exacting his demands can be. Their relationship is intense and obsessive, but as they cross the line from secret sexual odyssey to something deeper, their affair runs the risk of being exposed--and vulnerable to a betrayal far more intimate than either expected.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('The Protector','Romance','Jodi Ellen Malpas',' Forever','Theprotector.jpg','Jake Sharp resides in his own personal hell. The ex-SAS sniper was distracted from duty once before, and the consequences were devastating--both personally and professionally. He vowed never to let that happen again The job of bodyguard to Camille Logan isn''t the kind of distraction from his demons he should take. 
Women and Jake don''t mix well, yet the lesser of two evils seems to be protecting the heiress, whose life is threatened as a result of her father''s ruthless business dealings. 
He thinks he knows her type: beautiful and spoiled, with her father''s bank balance to fund her lifestyle. But he soon discovers the real Camille-warm, compassionate, determined to be independent and happy after struggling with past mistakes. Now, his duty to protect her turns into something deeper than a well-paid job, no matter how hard he fights it. He needs absolution. He comes to need Camille. But he knows he can''t have both. ');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Mastered','Romance','Maya Banks','Berkley Books','Mastered.jpg','What he wants, he takes with no remorse or guilt.
She stood out in his club like a gem, unspoiled and untouched. A lamb among wolves, she clearly didn t belong. Drawn to her innocence he watched as she was surrounded by men who saw what he did but no one but him could touch her. He summoned her to his private quarters. He sensed her fear. He also recognized the desire in her eyes. And he knew she wouldn t leave before he possessed her. She had no need to know his secrets. Not until he had her under his complete and utter control.
What he wants, she isn t sure she can give him.
The moment he told her want he wanted, she couldn t resist. Instinct told her to run, but her heart said stay and walk the fine line between pleasure and pain. Though she wasn t sure she could ever completely surrender, the primal part of her wanted to try, even knowing this man could break her in ways she never imagined. Because once he possessed her, he owned her and it would be too late to turn back. She can only pray that he doesn t destroy her in the end.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Love Her Wild','Poetry','Atticus','Atria Books','Loveherwild.jpg','He was dubbed the "#1 poet to follow" by Teen Vogue and "the world''s most tattoo-able" poet by Galore magazine, in Love Her Wild, Atticus captures what is both raw and relatable about the smallest and the grandest moments in life: the first glimpse of a new love in Paris; skinny dipping on a summer''s night; the irrepressible exuberance of the female spirit; or drinking whiskey in the desert watching the rising sun. 
With honesty, poignancy, and romantic flair, Atticus distills the most exhilarating highs and the heartbreaking lows of life and love into a few perfectly evocative lines, ensuring that his words will become etched in your mind--and will awaken your sense of adventure.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Milk And Honey','Poetry','Rupi Kaur','Andrews McMeel Publishing','Milkandhoney.jpg','#1 New York Times bestseller Milk and Honey is a collection of poetry and prose about survival. About the experience of violence, abuse, love, loss, and femininity.
The book is divided into four chapters, and each chapter serves a different purpose. Deals with a different pain. Heals a different heartache. Milk and Honey takes readers through a journey of the most bitter moments in life and finds sweetness in them because there is sweetness everywhere if you are just willing to look.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Helium','Poetry','Rudy Francisco','Button Poetry','Helium.jpg','Helium is the debut poetry collection by internet phenom Rudy Francisco, whose work has defined poetry for a generation of new readers. Rudy''s poems and quotes have been viewed and shared millions of times as he has traveled the country and the world performing for sell-out crowds. 
Helium is filled with work that is simultaneously personal and political, blending love poems, self-reflection, and biting cultural critique on class, race and gender into an unforgettable whole.
 Ultimately, Rudy''s work rises above the chaos to offer a fresh and positive perspective of shared humanity and beauty.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Sapiens','Science','Yuval Noah Harari','Harper Perennial','Sapiens.jpg','From a renowned historian comes a groundbreaking narrative of humanity''s creation and evolution-a #1 international bestseller-that explores the ways in which biology and history have defined us and enhanced our understanding of what it means to be "human."
One hundred thousand years ago, at least six different species of humans inhabited Earth. Yet today there is only one--homo sapiens. What happened to the others? And what may happen to us?
Most books about the history of humanity pursue either a historical or a biological approach, but Dr. Yuval Noah Harari breaks the mold with this highly original book that begins about 70,000 years ago with the appearance of modern cognition. From examining the role evolving humans have played in the global ecosystem to charting the rise of empires, Sapiens integrates history and science to reconsider accepted narratives, connect past developments with contemporary concerns, and examine specific events within the context of larger ideas.
Dr. Harari also compels us to look ahead, because over the last few decades humans have begun to bend laws of natural selection that have governed life for the past four billion years. We are acquiring the ability to design not only the world around us, but also ourselves. Where is this leading us, and what do we want to become?');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Endurance','Science','Scott Kelly','Knopf Publishing Group','Endurance.jpg','The veteran of four space flights and the American record holder for consecutive days spent in space, Scott Kelly has experienced things very few have. 
Now, he takes us inside a sphere utterly inimical to human life. He describes navigating the extreme challenge of long-term spaceflight, both existential and banal: the devastating effects on the body; the isolation from everyone he loves and the comforts of Earth; the pressures of constant close cohabitation; the catastrophic risks of depressurization or colliding with space junk, and the still more haunting threat of being unable to help should tragedy strike at home--an agonizing situation Kelly faced when, on another mission, his twin brother''s wife, Gabrielle Giffords, was shot while he still had two months in space. 
Kelly''s humanity, compassion, humor, and passion resonate throughout, as he recalls his rough-and-tumble New Jersey childhood and the youthful inspiration that sparked his astounding career, and as he makes clear his belief that Mars will be the next, ultimately challenging step in American spaceflight. A natural storyteller and modern-day hero, Kelly has a message of hope for the future that will inspire for generations to come. Here, in his personal story, we see the triumph of the human imagination, the strength of the human will, and the boundless wonder of the galaxy. ');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Astrophysics for People in a Hurry','Science','Neil deGrasse Tyson ','W. W. Norton & Company','Astrophysics.jpg','What is the nature of space and time? How do we fit within the universe? How does the universe fit within us? There''s no better guide through these mind-expanding questions than acclaimed astrophysicist and best-selling author Neil deGrasse Tyson.
But today, few of us have time to contemplate the cosmos. So Tyson brings the universe down to Earth succinctly and clearly, with sparkling wit, in tasty chapters consumable anytime and anywhere in your busy day.
While you wait for your morning coffee to brew, for the bus, the train, or a plane to arrive, Astrophysics for People in a Hurry will reveal just what you need to be fluent and ready for the next cosmic headlines: from the Big Bang to black holes, from quarks to quantum mechanics, and from the search for planets to the search for life in the universe.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Twisted','Fiction','Helen Hardt ','Waterhouse Press','Twisted.jpg','Ryan Steel, his world recently upended by an earth-shattering secret, now faces yet another potential revelation surrounding the Steel family mystery. He no longer fully trusts his siblings or the woman he loves. He''s alone-alone and terrified and immersed in a conundrum that becomes more twisted each day.
Ruby Lee loves Ryan and desperately wants to help him. She''ll do whatever she must to see him through this troubling time, but her own shrouded past still haunts her, and she''s determined to put an end to both of their mysteries once and for all. But the more she uncovers, the more danger she''s in...and she may lose Ryan forever.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Past Perfect','Fiction','Danielle Steel','Delacorte Press','Pastperfect.jpg','Sybil and Blake Gregory have established a predictable, well-ordered Manhattan life--she as a cutting-edge design authority and museum consultant, he in high-tech investments--raising their teenagers Andrew and Caroline and six-year-old Charlie. But everything changes when Blake is offered a dream job he can''t resist as CEO of a start-up in San Francisco. He accepts it without consulting his wife and buys a magnificent, irresistibly underpriced historic Pacific Heights mansion as their new home.
The past and present suddenly collide for them in the elegant mansion filled with tender memories and haunting portraits when an earthquake shocks them the night they arrive. The original inhabitants appear for a few brief minutes. In the ensuing days, the Gregorys meet the large and lively family who lived there a century ago: distinguished Bertrand Butterfield and his gracious wife Gwyneth, their sons Josiah and little Magnus, daughters Bettina and Lucy, formidable Scottish matriarch Augusta and her eccentric brother Angus.
All long since dead. All very much alive in spirit-and visible to the Gregorys and no one else. The two families are delighted to share elegant dinners and warm friendship. They have much to teach each other, as the Gregorys watch the past unfold while living their own modern-day lives. Within these enchanted rooms, it is at once 1917 and a century later, where the Gregorys gratefully realize they have been given a perfect gift-beloved friends and the wisdom to shape their own future with grace from a fascinating past.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Tom Clancy Power and Empire','Fiction','Marc Cameron','G.P. Putnams Sons','Tom.jpg','Jack Ryan is dealing with an aggressive challenge from the Chinese government. Pawns are being moved around a global chessboard: an attack on an oil platform in Africa, a terrorist strike on an American destroyer and a storm tossed American spy ship that may fall into Chinese hands. It seems that President Zhao is determined to limit Ryan''s choices in the upcoming G20 negotiations.
But there are hints that there''s even more going on behind the scenes. A routine traffic stop in rural Texas leads to a shocking discovery--a link to a Chinese spy who may have intelligence that lays bare an unexpected revelation. John Clark and the members of the Campus are in close pursuit, but can they get the information in time?');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Happy Little Accidents : The Wit & Wisdom of Bob Ross','Humor','Bob Ross and Michelle Witte','Running Press Book Publishers','Bob.jpg',' Ross has captivated us for years with the magic that takes place on his canvas in twenty-six television minutes-all while dispensing little branches of wisdom. His style and encouraging words are a form of therapy for the weary, but with Bob it is always about more than painting. There is a hidden depth within his easy chatter, another layer to everything he says. When he talks about painting, he''s using it as a metaphor for life 
Happy Little Accidents: The Wit and Wisdom of Bob Ross opens with an introduction and brief biography of Ross, followed by a collection of Ross''s greatest quotes and most majestic works of art.
Relax. Unwind. Be inspired.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Your Sh*tty Family','Humor',' Unspirational','Harry N. Abrams','Yourfamily.jpg','Your Sh*tty Family contains all the hilarity, confusion, and frustration of a visit home without the expensive plane tickets, the tiny twin bed, or any of the misery of actually having to spend time with your family. This book, based on the popular Instagram account of the same name, features actual text-message conversations between various family members. 
Your Sh*tty Family presents screenshots of these conversations that are relatable to anyone who has ever taught their parents to text. Topics range from hilarious misunderstandings of slang, to children who over-share, to siblings who mercilessly make fun of each other, all organized into outrageous categories such as Momster, Dadvice, Group Chats, and more...');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('It Gets Worse : A Collection of Essays','Humor','Shane Dawson','Atria Books','Itgetsworse.jpg','Bestselling author Shane Dawson returns with another highly entertaining and uproariously funny essay collection, chronicling a mix of real life moments both extraordinary and mortifying, yet always full of heart. Shane Dawson shared some of his best and worst experiences in I Hate Myselfie, the critically acclaimed book that secured his place as a gifted humorist and keen observer of millennial culture. 
In this new collection of original personal essays, Shane goes even deeper, sharing never-before-revealed stories from his life, giving readers a no-holds-barred look at moments both bizarre and relatable, from cult-like Christian after-school activities, dressing in drag, and losing his virginity, to hiring a psychic, clashes with celebrities, and coming to terms with his bisexuality. Every step of the way, Shane maintains his signature brand of humor, proving that even the toughest breaks can be funny when you learn to laugh at yourself. 
This is Let''s Pretend This Never Happened and Running With Scissors for the millennial generation: an inspiring, intelligent, and brutally honest collection of true stories by a YouTube sensation-turned one of the freshest new voices out there.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('The Lose Your Belly Diet : Change Your Gut, Change Your Life ','Diet & Health','M.d. Travis Stork','Ghost Mountain Books','Thelose.jpg','We can achieve ALL of these goals with The Lose Your Belly Diet. Based on exciting new research about the dramatic benefits of vibrant gut health and a diverse gut microbiome, this plan nurtures your gut while helping you burn off excess weight and harmful belly fat.
This plan is built around a very clear, research-based concept: Eating food that nourishes and protects the microbes in your gut paves the way for weight loss, a slimmer middle, and better overall health.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Essential Oils : All-Natural Remedies and Recipes for Your Mind, Body and Home','Diet & Health','Neals Yard Remedies','DK Publishing','Essentialoils.jpg','An instructional reference guide to essential oils and aromatherapy from the experts at Neal''s Yard Remedies, a trusted source for natural health and beauty products.
Learn how to harness the healing powers of essential oils for treating maladies and improving mental and physical well-being. Use homeopathic alternatives to treat everyday health issues, including acne, PMS, insomnia, and indigestion, and rebalance your energy, enhance your focus, and release stress.
Whether you live an all-natural lifestyle or you are just beginning to use alternative methods to eliminate synthetic chemicals from your everyday products, Essential Oils is packed with authoritative information to answer your questions. This visual guide features comprehensive profiles of 88 essential oils, full-color photographs, and helpful guidance for using, blending, and storing.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('The Fast Metabolism Diet : Eat More Food and Lose More Weight','Diet & Health','Haylie Pomroy And Eve Adamson','Harmony','Fastmetabolism.jpg','On this plan you''re going to eat a lot. You''re going to eat three full meals and at least two snacks a day - and you''re still going to lose weight. What you''re not going to do is count a single calorie or fat gram. You''re going not to ban entire food groups. 
You''re not going to go carb-free or vegan or go cold turkey on the foods you love. Instead, you''re going to rotate what you''re eating throughout each week according to a simple and proven plan carefully designed to induce precise physiological changes that will set your metabolism on fire.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Pat the Bunny : First Books for Baby','Kids','Dorothy Kunhardt','Golden Books','Bunny.jpg','Pat the Bunny has been a beloved American classic for 75 years. This boxed set includes Pat the Bunny, Pat the Puppy, and Pat the Cat. Touch and feel elements and pull tabs invite children to explore these books on their own or to snuggle up and play with mom or dad 
For over 75 years, Pat the Bunny has been creating special first-time moments between parents and their children. One of the best-selling children''s books of all time, this classic touch-and-feel book offers babies a playful and engaging experience, all the while creating cherished memories that will last a lifetime.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Star Wars Join the Resistance','Kids','Ben Acker and Ben Blacker and Annie Wu','Book Depot','Starwars.jpg','MATTIS BANZ knows that he''s meant to be a hero of the galaxy like the legendary Luke Skywalker, and when General Leia Organa''s Resistance recruits him to join its efforts against the evil First Order, he finally has a chance to fulfill his destiny. 
But the rest of his squadron doesn''t seem very promising. Sure, there''s the Zeltron girl Lorica, famous for her exploits foiling evil smugglers, but there''s also the swamp boy named Dec, who seems to enjoy causing trouble; Dec''s "brother," a droid who thinks he''s a pilot; Sari, whose imposing size contradicts her sweet nature; and Jo , the stuffy group leader with secrets. How is Mattis supposed to be the next Poe Dameron when he and his squad mates spend more time in trouble than flying X-wings? The team will have to learn how to work together when the going gets tough, or they won''t be going anywhere...'); 
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Snow White and the Seven Dwarfs','Kids','Randy Thornton','American Book Company','Snowwhite.jpg','Snow White''s classic tale comes to life Follow along as Snow White befriends the Seven Dwarfs, takes a bite of a magical apple, and lives happily ever after.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Bonfire','Thriller','Krysten Ritter','Crown Archetype','Bonfire.jpg','It has been ten years since Abby Williams left home and scrubbed away all visible evidence of her small-town roots. Now working as an environmental lawyer in Chicago, she has a thriving career, a modern apartment, and her pick of meaningless one-night stands.
But when a new case takes her back home to Barrens, Indiana, the life Abby painstakingly created begins to crack. Tasked with investigating Optimal Plastics, the town''s most high-profile company and economic heart, Abby begins to find strange connections to Barrens''s biggest scandal from more than a decade ago, involving the popular Kaycee Mitchell and her closest friends--just before Kaycee disappeared for good.
Abby knows the key to solving any case lies in the weak spots, the unanswered questions. But as she tries desperately to find out what really happened to Kaycee, troubling memories begin to resurface and she begins to doubt her own observations. And when she unearths an even more disturbing secret--a ritual called "The Game"--it will threaten reputations, and lives, in the community and risk exposing a darkness that may consume her.
With tantalizing twists, slow-burning suspense, and a remote rural town of just five claustrophobic square miles, Bonfire is a dark exploration of what happens when your past and present collide.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Unbecoming','Thriller','Rebecca Scherm ','Penguin Books','Unbecoming.jpg','A highly praised debut novel of psychological suspenseabout a daring art heist, a cat-and-mouse waiting game, and a small-town girl s mesmerizing transformation 
On the grubby outskirts of Paris, Grace restores bric-a-brac, mends teapots, and resets gems. She calls herself Julie, says she s from California, and slips back to a rented room at night. In truth, home is Garland, Tennessee, where two young men have just been paroled. Both were jailed for a crime that Grace planned.The heist went bad but not before she was on a plane to Prague, contraband in her bag.As Grace s web of deception unravels, she begins a cat-and-mouse game that echoes the best of Alfred Hitchcock and Patricia Highsmith and is sure to appeal to fans of "The Girl on the Train."" 
From our buyer, Margaret Terwey: Unbecoming is a highly praised debut novel of psychological suspense about a daring art heist, a cat-and-mouse waiting game, and a small-town girl who discovers her true gift is deceit.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('The Blind : A Chilling Psychological Suspense','Thriller','A. F. Brady','Park Row','Theblind.jpg','A razor-sharp debut about a woman who goes so far off the deep end, she might never make it back up... Sam James has spent years carefully crafting her reputation as the best psychologist at Typhlos, Manhattan''s most challenging psychiatric institution. She believes if she can''t save herself, she''ll save someone else. 
It''s this savior complex that serves her well in helping patients battle their inner demons, though it leads Sam down some dark paths and opens her eyes to her own mental turmoil. When Richard, a mysterious patient no other therapist wants to treat, is admitted to Typhlos, Sam is determined to unlock his secrets and his psyche. But she can''t figure out why Richard appears to be so normal in a hospital filled with madness. As Sam gets pulled into Richard''s twisted past, she can''t help but analyze her own life, and what she discovers terrifies her. And so the mind games begin. But who is the savior and who is the saved? 
In this unexpected and addictive psychological debut, A.F. Brady takes readers into the psyche of a deeply disturbed woman desperately trying to keep her head above water, showing that sometimes what''s most terrifying is what exists in your mind.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Batman','Comics','Tom King','DC Comics','Batman.jpg','Batman''s methods have always been clear. He fights criminals wherever he finds them. He lives in the shadows. And he works alone. But as Gotham evolves, so must the Bat.
A duo of super-powered youths calling themselves Gotham and Gotham Girl have joined the fight against crime in Batman''s city. They want to pull Gotham out of the shadows and into a brighter tomorrow. But with two godlike metahumans protecting the city by the light of day, does Gotham still need a Dark Knight?
Through these young heroes, the Dark Knight discovers a criminal plotting against his city. To stop this foe, Batman must align himself with a team of villains straight out of Arkham Asylum. This makeshift Suicide Squad is every bit as unstable as the real deal, and while Catwoman might have a good heart despite her troubled past, the other members most certainly do not. ');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('The Killing Joke','Comics','Alan Moore And Brian Bolland','DC Comics','Joker.jpg','According to the grinning engine of madness and mayhem known as The Joker, that''s all that separates the sane from the psychotic. Freed once again from the confines of Arkham Asylum, he''s out to prove his deranged point. And he''s going to use Gotham City''s top cop, Commissioner Jim Gordon, and his brilliant and beautiful daughter Barbara to do it.
Now Batman must race to stop his archnemesis before his reign of terror claims two of the Dark Knight''s closest friends. Can he finally put an end to the cycle of bloodlust and lunacy that links these two iconic foes before it leads to its fatal conclusion? And as the horrifying origin of the Clown Prince of Crime is finally revealed, will the thin line that separates Batman''s nobility and The Joker''s insanity snap once and for all?');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Spider-Man : Forever Young','Comics','Stefan Petrucha','Marvel Comics','Spiderman.jpg','Take a swing through Spider-Man''s past in a novel based on a classic tale - with an all-new story for the present day Broke - again - and running out of excuses for girlfriend Gwen Stacy, Peter Parker goes looking for trouble, hoping to snag some rent-paying photos of his alter ego in action. 
But trouble comes to him when the Kingpin and the Maggia converge in a battle for a mysterious tablet When the fight spills over to Empire State University, Peter finds himself in the crosshairs of not only the city''s most nefarious villains, but also his friends - and the police Stefan Petrucha puts his pen to the classic "Stone Tablet Saga," which ComicsReview.com calls "Stan Lee''s Marvel and Spider-Man at their peak.
" But the story doesn''t end there: When the assumed-dead leader of the Maggia resurfaces, it''ll take all of Spider-Man''s wits to track him down It doesn''t help that Peter''s beloved Aunt May may be dying. Can Peter fight off his enemies, save his aunt and graduate from college? Or has the ol'' Parker luck disappeared for good?');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('I Am Malala','Biography','Malala Yousafzai And Patricia McCormick','American Book Company','Malala.jpg','I Am Malala. This is my story. 
Malala Yousafzai was only ten years old when the Taliban took control of her region. They said music was a crime. They said women weren''t allowed to go to the market. They said girls couldn''t go to school.
Raised in a once-peaceful area of Pakistan transformed by terrorism, Malala was taught to stand up for what she believes. So she fought for her right to be educated. And on October 9, 2012, she nearly lost her life for the cause: She was shot point-blank while riding the bus on her way home from school.
No one expected her to survive.
Now Malala is an international symbol of peaceful protest and the youngest ever Nobel Peace Prize winner. In this Young Readers Edition of her bestselling memoir, which has been reimagined specifically for a younger audience and includes exclusive photos and material, we hear firsthand the remarkable story of a girl who knew from a young age that she wanted to change the world - and did. 
Malala''s powerful story will open your eyes to another world and will make you believe in hope, truth, miracles and the possibility that one person - one young person - can inspire change in her community and beyond.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('A Life in Parts','Biography','Bryan Cranston','Book Depot','Alife.jpg','A poignant, intimate, funny, inspiring memoir both a coming-of-age story and a meditation on creativity, devotion, and craft from Bryan Cranston, beloved and acclaimed star of one of history s most successful TV shows, Breaking Bad. 
Bryan Cranston landed his first role at seven, when his father cast him in a United Way commercial. Acting was clearly the boy s destiny, until one day his father disappeared. Destiny suddenly took a backseat to survival. 
Now, in his riveting memoir, Cranston maps his zigzag journey from abandoned son to beloved star by recalling the many odd parts he s played in real life paperboy, farmhand, security guard, dating consultant, murder suspect, dock loader, lover, husband, father. Cranston also chronicles his evolution on camera, from soap opera player trying to master the rules of show business to legendary character actor turning in classic performances as Seinfeld dentist Tim Whatley, a sadist with newer magazines, and Malcolm in the Middle dad Hal Wilkerson, a lovable bumbler in tighty-whities. 
He also gives an inspiring account of how he prepared, physically and mentally, for the challenging role of President Lyndon Johnson, a tour de force that won him a Tony to go along with his four Emmys. 
Of course, Cranston dives deep into the grittiest details of his greatest role, explaining how he searched inward for the personal darkness that would help him create one of the most memorable performances ever captured on screen: Walter White, chemistry teacher turned drug kingpin. 
Discussing his life as few men do, describing his art as few actors can, Cranston has much to say about creativity, devotion, and craft, as well as innate talent and its challenges and benefits and proper maintenance. But ultimately A Life in Parts is a story about the joy, the necessity, and the transformative power of simple hard work."');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Einstein : His Life and Universe','Biography','Walter Isaacson ','Simon & Schuster','Einstein.jpg','How did his mind work? What made him a genius? Isaacson''s biography shows how Einstein''s scientific imagination sprang from the rebellious nature of his personality. His fascinating story is a testament to the connection between creativity and freedom. 
Einstein explores how an imaginative, impertinent patent clerk--a struggling father in a difficult marriage who couldn''t get a teaching job or a doctorate-became the mind reader of the creator of the cosmos, the locksmith of the mysteries of the atom, and the universe. 
His success came from questioning conventional wisdom and marveling at mysteries that struck others as mundane. This led him to embrace a morality and politics based on respect for free minds, free spirits, and free individuals.
Einstein, the classic #1 New York Times bestseller, is a brilliantly acclaimed account of the most influential scientist of the twentieth century, "an illuminating delight" (The New York Times). The basis for the National Geographic series Genius, by the author of The Innovators, Steve Jobs, and Benjamin Franklin, this is the definitive biography of Albert Einstein.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Legacy','Sport','James Kerr','Little, Brown Book Group','Legacy.jpg','Champions do extra. They sweep the sheds. They follow the spearhead. They keep a blue head. They are good ancestors. In Legacy, best-selling author James Kerr goes deep into the heart of the world''s most successful sporting team, the legendary All Blacks of New Zealand, to reveal 15 powerful and practical lessons for leadership and business. Legacy is a unique, inspiring handbook for leaders in all fields, and asks: What are the secrets of success - sustained success? 
How do you achieve world-class standards, day after day, week after week, year after year? How do you handle pressure? How do you train to win at the highest level? 
What do you leave behind you after you''re gone? What will be your legacy?');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Cristiano Ronaldo : The Biography','Sport','Guillem Balague','Orion Publishing Co','Cristiano.jpg','The definitive biography of Cristiano Ronaldo, named Football Book of the Year at the Cross Sports Book Awards 2016Fully updated to include the 2015-16 seasonCristiano Ronaldo is one of the greatest footballers of all time, a dream he pursued from the age of just twelve when he left his humble origins on Madeira behind.It wasn''t long before he had the biggest clubs in Europe knocking on his door, but it was Manchester United who won the race for his signature. 
Under the tutelage of Sir Alex Ferguson, Ronaldo developed into the complete footballer and athlete, winning three league titles and a Champions League along the way. 
He then became the biggest galactico of them all when he transferred to Real Madrid for a record-breaking fee. However, he has endured a difficult relationship with managers, teammates and the fans - and his time at the club has often been overshadowed by his fierce rivalry with Barcelona and Lionel Messi.Guillem Balague, respected football journalist and expert on the Spanish game, provides the definitive account of what has made Ronaldo the player and man that he is today.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Jenson Button: Life to the Limit : My Autobiography','Sport','Jenson Button','Bonnier Books Ltd','Jenson.jpg','Jenson Button is one of the greatest racing drivers of his generation. His seventeen years in Formula 1 have seen him experience everything the sport has to offer, from nursing underpowered cars around the track to winning World Championships and everything in between.Here, Jenson tells his full story for the first time in his own honest, intelligent and eloquent style. 
From growing up as part of a motor-racing-mad family under the guidance of his father, John, to arriving at Williams as a fresh-faced 20 year-old, to being written off by some as a playboy and his fight back to the very pinnacle of his sport. 
Jenson''s World Championship victory for the unsponsored and unfancied Brawn GP team is one of the most extraordinary against-the-odds sports stories of the century. 
Jenson''s book lifts the lid on the gilded and often hidden world of Formula 1. He reveals his relationships with some of the biggest names in Formula 1- Lewis Hamilton, Michael Schumacher, Fernando Alonso as well some of the most colourful characters like Flavio Briatore, Ron Dennis, Frank Williams and serial winner Ross Brawn. 
Above all, he puts you right inside the cockpit, in the driving seat, travelling at over 200 miles per hour, battling the fear of death, showing you what happens when it goes wrong at high speed and allowing you to experience the euphoria of crossing the line first.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Into the Wild','Travel','Jon Krakauer','Pan MacMillan','Intothewild.jpg','Jon Krakauer''s Into the Wild examines true story of Chris McCandless, a young man, who in 1992 walked deep into the Alaskan wilderness and whose SOS note and emaciated corpse were found four months later, internationally bestselling author Jon Krakauer explores the obsession which leads some people to explore the outer limits of self, leave civilization behind and seek enlightenment through solitude and contact with nature.
A 2007 film adaptation of Into the Wild was directed by Sean Penn and starred Emile Hirsch and Kristen Stewart.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('The Art of Travel','Travel','Alain de Botton','Penguin Books Ltd','Theartoftravel.jpg','The Art of Travel is Alain de Botton''s travel guide with a difference.Few activities seem to promise us as much happiness as going travelling: taking off for somewhere else, somewhere far from home, a place with more interesting weather, customs and landscapes. But although we are inundated with advice on where to travel to, we seldom ask why we go and how we might become more fulfilled by doing so. 
With the help of a selection of writers, artists and thinkers - including Flaubert, Edward Hopper, Wordsworth and Van Gogh - Alain de Botton''s bestselling The Art of Travel provides invaluable insights into everything from holiday romance to hotel mini-bars, airports to sight-seeing. 
The perfect antidote to those guides that tell us what to do when we get there, The Art of Travel tries to explain why we really went in the first place - and helpfully suggests how we might be happier on our journeys.
''Richly evocative, sharp and funny. De Botton proves himself to be a very fine travel writer indeed'' Sunday Telegraph''Delightful, profound, entertaining, I doubt if de Botton has written a dull sentence in his life'' Jan Morris''An elegant and subtle work, unlike any other.');
INSERT INTO Books(Title,Genre,Author,Publisher,BookImage,Summary) VALUES ('Eat, Pray, Love','Travel','Elizabeth Gilbert','Bloomsbury Publishing PLC','Eatpraylove.jpg','It''s 3 a.m. and Elizabeth Gilbert is sobbing on the bathroom floor. She''s in her thirties, she has a husband, a house, they''re trying for a baby - and she doesn''t want any of it. A bitter divorce and a turbulent love affair later, she emerges battered and bewildered and realises it is time to pursue her own journey in search of three things she has been missing: pleasure, devotion and balance. 
So, she travels to Rome, where she learns Italian from handsome, brown-eyed identical twins and gains twenty-five pounds, an ashram in India, where she finds that enlightenment entails getting up in the middle of the night to scrub the temple floor, and Bali where a toothless medicine man of indeterminate age offers her a new path to peace: simply sit still and smile. And slowly happiness begins to creep up on her.');
go
Create PROCEDURE SP_Add_Comment
(
	@BookID int,
	@UserID int,
	@Comment text,
	@rate int
)
AS
BEGIN  
	
	declare @rateNumber int;
	select @rateNumber = COUNT(*) from RateAndCommentBooks where BookID  = @BookID;
	update Books set BookRate = ((BookRate * @rateNumber) + @rate) / (@ratenumber + 1) where BookID = @BookID;

	insert into RateAndCommentBooks(BookID, MemberID, rate, rateDate, comment)
	values ((select bookID FROM Books WHERE bookID = @BookID),
         (select MemberID from Member where MemberID =  @UserID) , @rate , getdate(), @comment)
END   
GO




insert into Admin (FirstName,LastName,password,MailAddress,PhoneNumber) values ('admin','ozgur','1234','aadfad@sdfa.com','4564654')
go

 insert into Member (FirstName, LastName,Password,MailAddress, PhoneNumber, SchoolID) values 
 ('ozcan','ozgur','1234','ozcanozgur123@gmail.com','05394947484','1401020055')
 go




 



 


