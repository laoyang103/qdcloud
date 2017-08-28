/**
 * marked - a markdown parser
 * Copyright (c) 2011-2014, Christopher Jeffrey. (MIT Licensed)
 * https://github.com/chjj/marked
 */

(function () {
    var emojiNames = ",bowtie,smile,laughing,blush,smiley,relaxed,smirk,heart_eyes,kissing_heart,kissing_closed_eyes,flushed,relieved,satisfied,grin,wink,stuck_out_tongue_winking_eye,stuck_out_tongue_closed_eyes,grinning,kissing,kissing_smiling_eyes,stuck_out_tongue,sleeping,worried,frowning,anguished,open_mouth,grimacing,confused,hushed,expressionless,unamused,sweat_smile,sweat,disappointed_relieved,weary,pensive,disappointed,confounded,fearful,cold_sweat,persevere,cry,sob,joy,astonished,scream,neckbeard,tired_face,angry,rage,triumph,sleepy,yum,mask,sunglasses,dizzy_face,imp,smiling_imp,neutral_face,no_mouth,innocent,alien,yellow_heart,blue_heart,purple_heart,heart,green_heart,broken_heart,heartbeat,heartpulse,two_hearts,revolving_hearts,cupid,sparkling_heart,sparkles,star,star2,dizzy,boom,collision,anger,exclamation,question,grey_exclamation,grey_question,zzz,dash,sweat_drops,notes,musical_note,fire,hankey,poop,shit,+1,thumbsup,-1,thumbsdown,ok_hand,punch,facepunch,fist,v,wave,hand,raised_hand,open_hands,point_up,point_down,point_left,point_right,raised_hands,pray,point_up_2,clap,muscle,metal,fu,walking,runner,running,couple,family,two_men_holding_hands,two_women_holding_hands,dancer,dancers,ok_woman,no_good,information_desk_person,raising_hand,bride_with_veil,person_with_pouting_face,person_frowning,bow,couplekiss,couple_with_heart,massage,haircut,nail_care,boy,girl,woman,man,baby,older_woman,older_man,person_with_blond_hair,man_with_gua_pi_mao,man_with_turban,construction_worker,cop,angel,princess,smiley_cat,smile_cat,heart_eyes_cat,kissing_cat,smirk_cat,scream_cat,crying_cat_face,joy_cat,pouting_cat,japanese_ogre,japanese_goblin,see_no_evil,hear_no_evil,speak_no_evil,guardsman,skull,feet,lips,kiss,droplet,ear,eyes,nose,tongue,love_letter,bust_in_silhouette,busts_in_silhouette,speech_balloon,thought_balloon,feelsgood,finnadie,goberserk,godmode,hurtrealbad,rage1,rage2,rage3,rage4,suspect,trollface,sunny,umbrella,cloud,snowflake,snowman,zap,cyclone,foggy,ocean,cat,dog,mouse,hamster,rabbit,wolf,frog,tiger,koala,bear,pig,pig_nose,cow,boar,monkey_face,monkey,horse,racehorse,camel,sheep,elephant,panda_face,snake,bird,baby_chick,hatched_chick,hatching_chick,chicken,penguin,turtle,bug,honeybee,ant,beetle,snail,octopus,tropical_fish,fish,whale,whale2,dolphin,cow2,ram,rat,water_buffalo,tiger2,rabbit2,dragon,goat,rooster,dog2,pig2,mouse2,ox,dragon_face,blowfish,crocodile,dromedary_camel,leopard,cat2,poodle,paw_prints,bouquet,cherry_blossom,tulip,four_leaf_clover,rose,sunflower,hibiscus,maple_leaf,leaves,fallen_leaf,herb,mushroom,cactus,palm_tree,evergreen_tree,deciduous_tree,chestnut,seedling,blossom,ear_of_rice,shell,globe_with_meridians,sun_with_face,full_moon_with_face,new_moon_with_face,new_moon,waxing_crescent_moon,first_quarter_moon,waxing_gibbous_moon,full_moon,waning_gibbous_moon,last_quarter_moon,waning_crescent_moon,last_quarter_moon_with_face,first_quarter_moon_with_face,moon,earth_africa,earth_americas,earth_asia,volcano,milky_way,partly_sunny,octocat,squirrel,bamboo,gift_heart,dolls,school_satchel,mortar_board,flags,fireworks,sparkler,wind_chime,rice_scene,jack_o_lantern,ghost,santa,christmas_tree,gift,bell,no_bell,tanabata_tree,tada,confetti_ball,balloon,crystal_ball,cd,dvd,floppy_disk,camera,video_camera,movie_camera,computer,tv,iphone,phone,telephone,telephone_receiver,pager,fax,minidisc,vhs,sound,speaker,mute,loudspeaker,mega,hourglass,hourglass_flowing_sand,alarm_clock,watch,radio,satellite,loop,mag,mag_right,unlock,lock,lock_with_ink_pen,closed_lock_with_key,key,bulb,flashlight,high_brightness,low_brightness,electric_plug,battery,calling,email,mailbox,postbox,bath,bathtub,shower,toilet,wrench,nut_and_bolt,hammer,seat,moneybag,yen,dollar,pound,euro,credit_card,money_with_wings,e-mail,inbox_tray,outbox_tray,envelope,incoming_envelope,postal_horn,mailbox_closed,mailbox_with_mail,mailbox_with_no_mail,package,door,smoking,bomb,gun,hocho,pill,syringe,page_facing_up,page_with_curl,bookmark_tabs,bar_chart,chart_with_upwards_trend,chart_with_downwards_trend,scroll,clipboard,calendar,date,card_index,file_folder,open_file_folder,scissors,pushpin,paperclip,black_nib,pencil2,straight_ruler,triangular_ruler,closed_book,green_book,blue_book,orange_book,notebook,notebook_with_decorative_cover,ledger,books,bookmark,name_badge,microscope,telescope,newspaper,football,basketball,soccer,baseball,tennis,8ball,rugby_football,bowling,golf,mountain_bicyclist,bicyclist,horse_racing,snowboarder,swimmer,surfer,ski,spades,hearts,clubs,diamonds,gem,ring,trophy,musical_score,musical_keyboard,violin,space_invader,video_game,black_joker,flower_playing_cards,game_die,dart,mahjong,clapper,memo,pencil,book,art,microphone,headphones,trumpet,saxophone,guitar,shoe,sandal,high_heel,lipstick,boot,shirt,tshirt,necktie,womans_clothes,dress,running_shirt_with_sash,jeans,kimono,bikini,ribbon,tophat,crown,womans_hat,mans_shoe,closed_umbrella,briefcase,handbag,pouch,purse,eyeglasses,fishing_pole_and_fish,coffee,tea,sake,baby_bottle,beer,beers,cocktail,tropical_drink,wine_glass,fork_and_knife,pizza,hamburger,fries,poultry_leg,meat_on_bone,spaghetti,curry,fried_shrimp,bento,sushi,fish_cake,rice_ball,rice_cracker,rice,ramen,stew,oden,dango,egg,bread,doughnut,custard,icecream,ice_cream,shaved_ice,birthday,cake,cookie,chocolate_bar,candy,lollipop,honey_pot,apple,green_apple,tangerine,lemon,cherries,grapes,watermelon,strawberry,peach,melon,banana,pear,pineapple,sweet_potato,eggplant,tomato,corn,house,house_with_garden,school,office,post_office,hospital,bank,convenience_store,love_hotel,hotel,wedding,church,department_store,european_post_office,city_sunrise,city_sunset,japanese_castle,european_castle,tent,factory,tokyo_tower,japan,mount_fuji,sunrise_over_mountains,sunrise,stars,statue_of_liberty,bridge_at_night,carousel_horse,rainbow,ferris_wheel,fountain,roller_coaster,ship,speedboat,boat,sailboat,rowboat,anchor,rocket,airplane,helicopter,steam_locomotive,tram,mountain_railway,bike,aerial_tramway,suspension_railway,mountain_cableway,tractor,blue_car,oncoming_automobile,car,red_car,taxi,oncoming_taxi,articulated_lorry,bus,oncoming_bus,rotating_light,police_car,oncoming_police_car,fire_engine,ambulance,minibus,truck,train,station,train2,bullettrain_front,bullettrain_side,light_rail,monorail,railway_car,trolleybus,ticket,fuelpump,vertical_traffic_light,traffic_light,warning,construction,beginner,atm,slot_machine,busstop,barber,hotsprings,checkered_flag,crossed_flags,izakaya_lantern,moyai,circus_tent,performing_arts,round_pushpin,triangular_flag_on_post,jp,kr,cn,us,fr,es,it,ru,gb,uk,de,one,two,three,four,five,six,seven,eight,nine,keycap_ten,1234,zero,hash,symbols,arrow_backward,arrow_down,arrow_forward,arrow_left,capital_abcd,abcd,abc,arrow_lower_left,arrow_lower_right,arrow_right,arrow_up,arrow_upper_left,arrow_upper_right,arrow_double_down,arrow_double_up,arrow_down_small,arrow_heading_down,arrow_heading_up,leftwards_arrow_with_hook,arrow_right_hook,left_right_arrow,arrow_up_down,arrow_up_small,arrows_clockwise,arrows_counterclockwise,rewind,fast_forward,information_source,ok,twisted_rightwards_arrows,repeat,repeat_one,new,top,up,cool,free,ng,cinema,koko,signal_strength,u5272,u5408,u55b6,u6307,u6708,u6709,u6e80,u7121,u7533,u7a7a,u7981,sa,restroom,mens,womens,baby_symbol,no_smoking,parking,wheelchair,metro,baggage_claim,accept,wc,potable_water,put_litter_in_its_place,secret,congratulations,m,passport_control,left_luggage,customs,ideograph_advantage,cl,sos,id,no_entry_sign,underage,no_mobile_phones,do_not_litter,non-potable_water,no_bicycles,no_pedestrians,children_crossing,no_entry,eight_spoked_asterisk,sparkle,eight_pointed_black_star,heart_decoration,vs,vibration_mode,mobile_phone_off,chart,currency_exchange,aries,taurus,gemini,cancer,leo,virgo,libra,scorpius,sagittarius,capricorn,aquarius,pisces,ophiuchus,six_pointed_star,negative_squared_cross_mark,a,b,ab,o2,diamond_shape_with_a_dot_inside,recycle,end,back,on,soon,clock1,clock130,clock10,clock1030,clock11,clock1130,clock12,clock1230,clock2,clock230,clock3,clock330,clock4,clock430,clock5,clock530,clock6,clock630,clock7,clock730,clock8,clock830,clock9,clock930,heavy_dollar_sign,copyright,registered,tm,x,heavy_exclamation_mark,bangbang,interrobang,o,heavy_multiplication_x,heavy_plus_sign,heavy_minus_sign,heavy_division_sign,white_flower,100,heavy_check_mark,ballot_box_with_check,radio_button,link,curly_loop,wavy_dash,part_alternation_mark,trident,black_small_square,white_small_square,black_medium_small_square,white_medium_small_square,black_medium_square,white_medium_square,black_large_square,white_large_square,white_check_mark,black_square_button,white_square_button,black_circle,white_circle,red_circle,large_blue_circle,large_blue_diamond,large_orange_diamond,small_blue_diamond,small_orange_diamond,small_red_triangle,small_red_triangle_down,shipit,tw-1f004,tw-1f0cf,tw-1f170,tw-1f171,tw-1f17e,tw-1f17f,tw-1f18e,tw-1f191,tw-1f192,tw-1f193,tw-1f194,tw-1f195,tw-1f196,tw-1f197,tw-1f198,tw-1f199,tw-1f19a,tw-1f1e6,tw-1f1e7,tw-1f1e8-1f1f3,tw-1f1e8,tw-1f1e9-1f1ea,tw-1f1e9,tw-1f1ea-1f1f8,tw-1f1ea,tw-1f1eb-1f1f7,tw-1f1eb,tw-1f1ec-1f1e7,tw-1f1ec,tw-1f1ed,tw-1f1ee-1f1f9,tw-1f1ee,tw-1f1ef-1f1f5,tw-1f1ef,tw-1f1f0-1f1f7,tw-1f1f0,tw-1f1f1,tw-1f1f2,tw-1f1f3,tw-1f1f4,tw-1f1f5,tw-1f1f6,tw-1f1f7-1f1fa,tw-1f1f7,tw-1f1f8,tw-1f1f9,tw-1f1fa-1f1f8,tw-1f1fa,tw-1f1fb,tw-1f1fc,tw-1f1fd,tw-1f1fe,tw-1f1ff,tw-1f201,tw-1f202,tw-1f21a,tw-1f22f,tw-1f232,tw-1f233,tw-1f234,tw-1f235,tw-1f236,tw-1f237,tw-1f238,tw-1f239,tw-1f23a,tw-1f250,tw-1f251,tw-1f300,tw-1f301,tw-1f302,tw-1f303,tw-1f304,tw-1f305,tw-1f306,tw-1f307,tw-1f308,tw-1f309,tw-1f30a,tw-1f30b,tw-1f30c,tw-1f30d,tw-1f30e,tw-1f30f,tw-1f310,tw-1f311,tw-1f312,tw-1f313,tw-1f314,tw-1f315,tw-1f316,tw-1f317,tw-1f318,tw-1f319,tw-1f31a,tw-1f31b,tw-1f31c,tw-1f31d,tw-1f31e,tw-1f31f,tw-1f320,tw-1f330,tw-1f331,tw-1f332,tw-1f333,tw-1f334,tw-1f335,tw-1f337,tw-1f338,tw-1f339,tw-1f33a,tw-1f33b,tw-1f33c,tw-1f33d,tw-1f33e,tw-1f33f,tw-1f340,tw-1f341,tw-1f342,tw-1f343,tw-1f344,tw-1f345,tw-1f346,tw-1f347,tw-1f348,tw-1f349,tw-1f34a,tw-1f34b,tw-1f34c,tw-1f34d,tw-1f34e,tw-1f34f,tw-1f350,tw-1f351,tw-1f352,tw-1f353,tw-1f354,tw-1f355,tw-1f356,tw-1f357,tw-1f358,tw-1f359,tw-1f35a,tw-1f35b,tw-1f35c,tw-1f35d,tw-1f35e,tw-1f35f,tw-1f360,tw-1f361,tw-1f362,tw-1f363,tw-1f364,tw-1f365,tw-1f366,tw-1f367,tw-1f368,tw-1f369,tw-1f36a,tw-1f36b,tw-1f36c,tw-1f36d,tw-1f36e,tw-1f36f,tw-1f370,tw-1f371,tw-1f372,tw-1f373,tw-1f374,tw-1f375,tw-1f376,tw-1f377,tw-1f378,tw-1f379,tw-1f37a,tw-1f37b,tw-1f37c,tw-1f380,tw-1f381,tw-1f382,tw-1f383,tw-1f384,tw-1f385,tw-1f386,tw-1f387,tw-1f388,tw-1f389,tw-1f38a,tw-1f38b,tw-1f38c,tw-1f38d,tw-1f38e,tw-1f38f,tw-1f390,tw-1f391,tw-1f392,tw-1f393,tw-1f3a0,tw-1f3a1,tw-1f3a2,tw-1f3a3,tw-1f3a4,tw-1f3a5,tw-1f3a6,tw-1f3a7,tw-1f3a8,tw-1f3a9,tw-1f3aa,tw-1f3ab,tw-1f3ac,tw-1f3ad,tw-1f3ae,tw-1f3af,tw-1f3b0,tw-1f3b1,tw-1f3b2,tw-1f3b3,tw-1f3b4,tw-1f3b5,tw-1f3b6,tw-1f3b7,tw-1f3b8,tw-1f3b9,tw-1f3ba,tw-1f3bb,tw-1f3bc,tw-1f3bd,tw-1f3be,tw-1f3bf,tw-1f3c0,tw-1f3c1,tw-1f3c2,tw-1f3c3,tw-1f3c4,tw-1f3c6,tw-1f3c7,tw-1f3c8,tw-1f3c9,tw-1f3ca,tw-1f3e0,tw-1f3e1,tw-1f3e2,tw-1f3e3,tw-1f3e4,tw-1f3e5,tw-1f3e6,tw-1f3e7,tw-1f3e8,tw-1f3e9,tw-1f3ea,tw-1f3eb,tw-1f3ec,tw-1f3ed,tw-1f3ee,tw-1f3ef,tw-1f3f0,tw-1f400,tw-1f401,tw-1f402,tw-1f403,tw-1f404,tw-1f405,tw-1f406,tw-1f407,tw-1f408,tw-1f409,tw-1f40a,tw-1f40b,tw-1f40c,tw-1f40d,tw-1f40e,tw-1f40f,tw-1f410,tw-1f411,tw-1f412,tw-1f413,tw-1f414,tw-1f415,tw-1f416,tw-1f417,tw-1f418,tw-1f419,tw-1f41a,tw-1f41b,tw-1f41c,tw-1f41d,tw-1f41e,tw-1f41f,tw-1f420,tw-1f421,tw-1f422,tw-1f423,tw-1f424,tw-1f425,tw-1f426,tw-1f427,tw-1f428,tw-1f429,tw-1f42a,tw-1f42b,tw-1f42c,tw-1f42d,tw-1f42e,tw-1f42f,tw-1f430,tw-1f431,tw-1f432,tw-1f433,tw-1f434,tw-1f435,tw-1f436,tw-1f437,tw-1f438,tw-1f439,tw-1f43a,tw-1f43b,tw-1f43c,tw-1f43d,tw-1f43e,tw-1f440,tw-1f442,tw-1f443,tw-1f444,tw-1f445,tw-1f446,tw-1f447,tw-1f448,tw-1f449,tw-1f44a,tw-1f44b,tw-1f44c,tw-1f44d,tw-1f44e,tw-1f44f,tw-1f450,tw-1f451,tw-1f452,tw-1f453,tw-1f454,tw-1f455,tw-1f456,tw-1f457,tw-1f458,tw-1f459,tw-1f45a,tw-1f45b,tw-1f45c,tw-1f45d,tw-1f45e,tw-1f45f,tw-1f460,tw-1f461,tw-1f462,tw-1f463,tw-1f464,tw-1f465,tw-1f466,tw-1f467,tw-1f468,tw-1f469,tw-1f46a,tw-1f46b,tw-1f46c,tw-1f46d,tw-1f46e,tw-1f46f,tw-1f470,tw-1f471,tw-1f472,tw-1f473,tw-1f474,tw-1f475,tw-1f476,tw-1f477,tw-1f478,tw-1f479,tw-1f47a,tw-1f47b,tw-1f47c,tw-1f47d,tw-1f47e,tw-1f47f,tw-1f480,tw-1f481,tw-1f482,tw-1f483,tw-1f484,tw-1f485,tw-1f486,tw-1f487,tw-1f488,tw-1f489,tw-1f48a,tw-1f48b,tw-1f48c,tw-1f48d,tw-1f48e,tw-1f48f,tw-1f490,tw-1f491,tw-1f492,tw-1f493,tw-1f494,tw-1f495,tw-1f496,tw-1f497,tw-1f498,tw-1f499,tw-1f49a,tw-1f49b,tw-1f49c,tw-1f49d,tw-1f49e,tw-1f49f,tw-1f4a0,tw-1f4a1,tw-1f4a2,tw-1f4a3,tw-1f4a4,tw-1f4a5,tw-1f4a6,tw-1f4a7,tw-1f4a8,tw-1f4a9,tw-1f4aa,tw-1f4ab,tw-1f4ac,tw-1f4ad,tw-1f4ae,tw-1f4af,tw-1f4b0,tw-1f4b1,tw-1f4b2,tw-1f4b3,tw-1f4b4,tw-1f4b5,tw-1f4b6,tw-1f4b7,tw-1f4b8,tw-1f4b9,tw-1f4ba,tw-1f4bb,tw-1f4bc,tw-1f4bd,tw-1f4be,tw-1f4bf,tw-1f4c0,tw-1f4c1,tw-1f4c2,tw-1f4c3,tw-1f4c4,tw-1f4c5,tw-1f4c6,tw-1f4c7,tw-1f4c8,tw-1f4c9,tw-1f4ca,tw-1f4cb,tw-1f4cc,tw-1f4cd,tw-1f4ce,tw-1f4cf,tw-1f4d0,tw-1f4d1,tw-1f4d2,tw-1f4d3,tw-1f4d4,tw-1f4d5,tw-1f4d6,tw-1f4d7,tw-1f4d8,tw-1f4d9,tw-1f4da,tw-1f4db,tw-1f4dc,tw-1f4dd,tw-1f4de,tw-1f4df,tw-1f4e0,tw-1f4e1,tw-1f4e2,tw-1f4e3,tw-1f4e4,tw-1f4e5,tw-1f4e6,tw-1f4e7,tw-1f4e8,tw-1f4e9,tw-1f4ea,tw-1f4eb,tw-1f4ec,tw-1f4ed,tw-1f4ee,tw-1f4ef,tw-1f4f0,tw-1f4f1,tw-1f4f2,tw-1f4f3,tw-1f4f4,tw-1f4f5,tw-1f4f6,tw-1f4f7,tw-1f4f9,tw-1f4fa,tw-1f4fb,tw-1f4fc,tw-1f500,tw-1f501,tw-1f502,tw-1f503,tw-1f504,tw-1f505,tw-1f506,tw-1f507,tw-1f508,tw-1f509,tw-1f50a,tw-1f50b,tw-1f50c,tw-1f50d,tw-1f50e,tw-1f50f,tw-1f510,tw-1f511,tw-1f512,tw-1f513,tw-1f514,tw-1f515,tw-1f516,tw-1f517,tw-1f518,tw-1f519,tw-1f51a,tw-1f51b,tw-1f51c,tw-1f51d,tw-1f51e,tw-1f51f,tw-1f520,tw-1f521,tw-1f522,tw-1f523,tw-1f524,tw-1f525,tw-1f526,tw-1f527,tw-1f528,tw-1f529,tw-1f52a,tw-1f52b,tw-1f52c,tw-1f52d,tw-1f52e,tw-1f52f,tw-1f530,tw-1f531,tw-1f532,tw-1f533,tw-1f534,tw-1f535,tw-1f536,tw-1f537,tw-1f538,tw-1f539,tw-1f53a,tw-1f53b,tw-1f53c,tw-1f53d,tw-1f550,tw-1f551,tw-1f552,tw-1f553,tw-1f554,tw-1f555,tw-1f556,tw-1f557,tw-1f558,tw-1f559,tw-1f55a,tw-1f55b,tw-1f55c,tw-1f55d,tw-1f55e,tw-1f55f,tw-1f560,tw-1f561,tw-1f562,tw-1f563,tw-1f564,tw-1f565,tw-1f566,tw-1f567,tw-1f5fb,tw-1f5fc,tw-1f5fd,tw-1f5fe,tw-1f5ff,tw-1f600,tw-1f601,tw-1f602,tw-1f603,tw-1f604,tw-1f605,tw-1f606,tw-1f607,tw-1f608,tw-1f609,tw-1f60a,tw-1f60b,tw-1f60c,tw-1f60d,tw-1f60e,tw-1f60f,tw-1f610,tw-1f611,tw-1f612,tw-1f613,tw-1f614,tw-1f615,tw-1f616,tw-1f617,tw-1f618,tw-1f619,tw-1f61a,tw-1f61b,tw-1f61c,tw-1f61d,tw-1f61e,tw-1f61f,tw-1f620,tw-1f621,tw-1f622,tw-1f623,tw-1f624,tw-1f625,tw-1f626,tw-1f627,tw-1f628,tw-1f629,tw-1f62a,tw-1f62b,tw-1f62c,tw-1f62d,tw-1f62e,tw-1f62f,tw-1f630,tw-1f631,tw-1f632,tw-1f633,tw-1f634,tw-1f635,tw-1f636,tw-1f637,tw-1f638,tw-1f639,tw-1f63a,tw-1f63b,tw-1f63c,tw-1f63d,tw-1f63e,tw-1f63f,tw-1f640,tw-1f645,tw-1f646,tw-1f647,tw-1f648,tw-1f649,tw-1f64a,tw-1f64b,tw-1f64c,tw-1f64d,tw-1f64e,tw-1f64f,tw-1f680,tw-1f681,tw-1f682,tw-1f683,tw-1f684,tw-1f685,tw-1f686,tw-1f687,tw-1f688,tw-1f689,tw-1f68a,tw-1f68b,tw-1f68c,tw-1f68d,tw-1f68e,tw-1f68f,tw-1f690,tw-1f691,tw-1f692,tw-1f693,tw-1f694,tw-1f695,tw-1f696,tw-1f697,tw-1f698,tw-1f699,tw-1f69a,tw-1f69b,tw-1f69c,tw-1f69d,tw-1f69e,tw-1f69f,tw-1f6a0,tw-1f6a1,tw-1f6a2,tw-1f6a3,tw-1f6a4,tw-1f6a5,tw-1f6a6,tw-1f6a7,tw-1f6a8,tw-1f6a9,tw-1f6aa,tw-1f6ab,tw-1f6ac,tw-1f6ad,tw-1f6ae,tw-1f6af,tw-1f6b0,tw-1f6b1,tw-1f6b2,tw-1f6b3,tw-1f6b4,tw-1f6b5,tw-1f6b6,tw-1f6b7,tw-1f6b8,tw-1f6b9,tw-1f6ba,tw-1f6bb,tw-1f6bc,tw-1f6bd,tw-1f6be,tw-1f6bf,tw-1f6c0,tw-1f6c1,tw-1f6c2,tw-1f6c3,tw-1f6c4,tw-1f6c5,tw-203c,tw-2049,tw-2122,tw-2139,tw-2194,tw-2195,tw-2196,tw-2197,tw-2198,tw-2199,tw-21a9,tw-21aa,tw-23-20e3,tw-231a,tw-231b,tw-23e9,tw-23ea,tw-23eb,tw-23ec,tw-23f0,tw-23f3,tw-24c2,tw-25aa,tw-25ab,tw-25b6,tw-25c0,tw-25fb,tw-25fc,tw-25fd,tw-25fe,tw-2600,tw-2601,tw-260e,tw-2611,tw-2614,tw-2615,tw-261d,tw-263a,tw-2648,tw-2649,tw-264a,tw-264b,tw-264c,tw-264d,tw-264e,tw-264f,tw-2650,tw-2651,tw-2652,tw-2653,tw-2660,tw-2663,tw-2665,tw-2666,tw-2668,tw-267b,tw-267f,tw-2693,tw-26a0,tw-26a1,tw-26aa,tw-26ab,tw-26bd,tw-26be,tw-26c4,tw-26c5,tw-26ce,tw-26d4,tw-26ea,tw-26f2,tw-26f3,tw-26f5,tw-26fa,tw-26fd,tw-2702,tw-2705,tw-2708,tw-2709,tw-270a,tw-270b,tw-270c,tw-270f,tw-2712,tw-2714,tw-2716,tw-2728,tw-2733,tw-2734,tw-2744,tw-2747,tw-274c,tw-274e,tw-2753,tw-2754,tw-2755,tw-2757,tw-2764,tw-2795,tw-2796,tw-2797,tw-27a1,tw-27b0,tw-27bf,tw-2934,tw-2935,tw-2b05,tw-2b06,tw-2b07,tw-2b1b,tw-2b1c,tw-2b50,tw-2b55,tw-30-20e3,tw-3030,tw-303d,tw-31-20e3,tw-32-20e3,tw-3297,tw-3299,tw-33-20e3,tw-34-20e3,tw-35-20e3,tw-36-20e3,tw-37-20e3,tw-38-20e3,tw-39-20e3,tw-a9,tw-ae,tw-e50a,fa-glass,fa-music,fa-search,fa-envelope-o,fa-heart,fa-star,fa-star-o,fa-user,fa-film,fa-th-large,fa-th,fa-th-list,fa-check,fa-times,fa-search-plus,fa-search-minus,fa-power-off,fa-signal,fa-cog,fa-trash-o,fa-home,fa-file-o,fa-clock-o,fa-road,fa-download,fa-arrow-circle-o-down,fa-arrow-circle-o-up,fa-inbox,fa-play-circle-o,fa-repeat,fa-refresh,fa-list-alt,fa-lock,fa-flag,fa-headphones,fa-volume-off,fa-volume-down,fa-volume-up,fa-qrcode,fa-barcode,fa-tag,fa-tags,fa-book,fa-bookmark,fa-print,fa-camera,fa-font,fa-bold,fa-italic,fa-text-height,fa-text-width,fa-align-left,fa-align-center,fa-align-right,fa-align-justify,fa-list,fa-outdent,fa-indent,fa-video-camera,fa-picture-o,fa-pencil,fa-map-marker,fa-adjust,fa-tint,fa-pencil-square-o,fa-share-square-o,fa-check-square-o,fa-arrows,fa-step-backward,fa-fast-backward,fa-backward,fa-play,fa-pause,fa-stop,fa-forward,fa-fast-forward,fa-step-forward,fa-eject,fa-chevron-left,fa-chevron-right,fa-plus-circle,fa-minus-circle,fa-times-circle,fa-check-circle,fa-question-circle,fa-info-circle,fa-crosshairs,fa-times-circle-o,fa-check-circle-o,fa-ban,fa-arrow-left,fa-arrow-right,fa-arrow-up,fa-arrow-down,fa-share,fa-expand,fa-compress,fa-plus,fa-minus,fa-asterisk,fa-exclamation-circle,fa-gift,fa-leaf,fa-fire,fa-eye,fa-eye-slash,fa-exclamation-triangle,fa-plane,fa-calendar,fa-random,fa-comment,fa-magnet,fa-chevron-up,fa-chevron-down,fa-retweet,fa-shopping-cart,fa-folder,fa-folder-open,fa-arrows-v,fa-arrows-h,fa-bar-chart,fa-twitter-square,fa-facebook-square,fa-camera-retro,fa-key,fa-cogs,fa-comments,fa-thumbs-o-up,fa-thumbs-o-down,fa-star-half,fa-heart-o,fa-sign-out,fa-linkedin-square,fa-thumb-tack,fa-external-link,fa-sign-in,fa-trophy,fa-github-square,fa-upload,fa-lemon-o,fa-phone,fa-square-o,fa-bookmark-o,fa-phone-square,fa-twitter,fa-facebook,fa-github,fa-unlock,fa-credit-card,fa-rss,fa-hdd-o,fa-bullhorn,fa-bell,fa-certificate,fa-hand-o-right,fa-hand-o-left,fa-hand-o-up,fa-hand-o-down,fa-arrow-circle-left,fa-arrow-circle-right,fa-arrow-circle-up,fa-arrow-circle-down,fa-globe,fa-wrench,fa-tasks,fa-filter,fa-briefcase,fa-arrows-alt,fa-users,fa-link,fa-cloud,fa-flask,fa-scissors,fa-files-o,fa-paperclip,fa-floppy-o,fa-square,fa-bars,fa-list-ul,fa-list-ol,fa-strikethrough,fa-underline,fa-table,fa-magic,fa-truck,fa-pinterest,fa-pinterest-square,fa-google-plus-square,fa-google-plus,fa-money,fa-caret-down,fa-caret-up,fa-caret-left,fa-caret-right,fa-columns,fa-sort,fa-sort-desc,fa-sort-asc,fa-envelope,fa-linkedin,fa-undo,fa-gavel,fa-tachometer,fa-comment-o,fa-comments-o,fa-bolt,fa-sitemap,fa-umbrella,fa-clipboard,fa-lightbulb-o,fa-exchange,fa-cloud-download,fa-cloud-upload,fa-user-md,fa-stethoscope,fa-suitcase,fa-bell-o,fa-coffee,fa-cutlery,fa-file-text-o,fa-building-o,fa-hospital-o,fa-ambulance,fa-medkit,fa-fighter-jet,fa-beer,fa-h-square,fa-plus-square,fa-angle-double-left,fa-angle-double-right,fa-angle-double-up,fa-angle-double-down,fa-angle-left,fa-angle-right,fa-angle-up,fa-angle-down,fa-desktop,fa-laptop,fa-tablet,fa-mobile,fa-circle-o,fa-quote-left,fa-quote-right,fa-spinner,fa-circle,fa-reply,fa-github-alt,fa-folder-o,fa-folder-open-o,fa-smile-o,fa-frown-o,fa-meh-o,fa-gamepad,fa-keyboard-o,fa-flag-o,fa-flag-checkered,fa-terminal,fa-code,fa-reply-all,fa-star-half-o,fa-location-arrow,fa-crop,fa-code-fork,fa-chain-broken,fa-question,fa-info,fa-exclamation,fa-superscript,fa-subscript,fa-eraser,fa-puzzle-piece,fa-microphone,fa-microphone-slash,fa-shield,fa-calendar-o,fa-fire-extinguisher,fa-rocket,fa-maxcdn,fa-chevron-circle-left,fa-chevron-circle-right,fa-chevron-circle-up,fa-chevron-circle-down,fa-html5,fa-css3,fa-anchor,fa-unlock-alt,fa-bullseye,fa-ellipsis-h,fa-ellipsis-v,fa-rss-square,fa-play-circle,fa-ticket,fa-minus-square,fa-minus-square-o,fa-level-up,fa-level-down,fa-check-square,fa-pencil-square,fa-share-square,fa-compass,fa-caret-square-o-down,fa-caret-square-o-up,fa-caret-square-o-right,fa-eur,fa-gbp,fa-usd,fa-inr,fa-jpy,fa-rub,fa-krw,fa-btc,fa-file,fa-file-text,fa-sort-alpha-asc,fa-sort-alpha-desc,fa-sort-amount-asc,fa-sort-amount-desc,fa-sort-numeric-asc,fa-sort-numeric-desc,fa-thumbs-up,fa-thumbs-down,fa-youtube-square,fa-youtube,fa-xing,fa-xing-square,fa-youtube-play,fa-dropbox,fa-stack-overflow,fa-instagram,fa-flickr,fa-adn,fa-bitbucket,fa-bitbucket-square,fa-tumblr,fa-tumblr-square,fa-long-arrow-down,fa-long-arrow-up,fa-long-arrow-left,fa-long-arrow-right,fa-apple,fa-windows,fa-android,fa-linux,fa-dribbble,fa-skype,fa-foursquare,fa-trello,fa-female,fa-male,fa-gratipay,fa-sun-o,fa-moon-o,fa-archive,fa-bug,fa-vk,fa-weibo,fa-renren,fa-pagelines,fa-stack-exchange,fa-arrow-circle-o-right,fa-arrow-circle-o-left,fa-caret-square-o-left,fa-dot-circle-o,fa-wheelchair,fa-vimeo-square,fa-try,fa-plus-square-o,fa-space-shuttle,fa-slack,fa-envelope-square,fa-wordpress,fa-openid,fa-university,fa-graduation-cap,fa-yahoo,fa-google,fa-reddit,fa-reddit-square,fa-stumbleupon-circle,fa-stumbleupon,fa-delicious,fa-digg,fa-pied-piper,fa-pied-piper-alt,fa-drupal,fa-joomla,fa-language,fa-fax,fa-building,fa-child,fa-paw,fa-spoon,fa-cube,fa-cubes,fa-behance,fa-behance-square,fa-steam,fa-steam-square,fa-recycle,fa-car,fa-taxi,fa-tree,fa-spotify,fa-deviantart,fa-soundcloud,fa-database,fa-file-pdf-o,fa-file-word-o,fa-file-excel-o,fa-file-powerpoint-o,fa-file-image-o,fa-file-archive-o,fa-file-audio-o,fa-file-video-o,fa-file-code-o,fa-vine,fa-codepen,fa-jsfiddle,fa-life-ring,fa-circle-o-notch,fa-rebel,fa-empire,fa-git-square,fa-git,fa-hacker-news,fa-tencent-weibo,fa-qq,fa-weixin,fa-paper-plane,fa-paper-plane-o,fa-history,fa-circle-thin,fa-header,fa-paragraph,fa-sliders,fa-share-alt,fa-share-alt-square,fa-bomb,fa-futbol-o,fa-tty,fa-binoculars,fa-plug,fa-slideshare,fa-twitch,fa-yelp,fa-newspaper-o,fa-wifi,fa-calculator,fa-paypal,fa-google-wallet,fa-cc-visa,fa-cc-mastercard,fa-cc-discover,fa-cc-amex,fa-cc-paypal,fa-cc-stripe,fa-bell-slash,fa-bell-slash-o,fa-trash,fa-copyright,fa-at,fa-eyedropper,fa-paint-brush,fa-birthday-cake,fa-area-chart,fa-pie-chart,fa-line-chart,fa-lastfm,fa-lastfm-square,fa-toggle-off,fa-toggle-on,fa-bicycle,fa-bus,fa-ioxhost,fa-angellist,fa-cc,fa-ils,fa-meanpath,fa-buysellads,fa-connectdevelop,fa-dashcube,fa-forumbee,fa-leanpub,fa-sellsy,fa-shirtsinbulk,fa-simplybuilt,fa-skyatlas,fa-cart-plus,fa-cart-arrow-down,fa-diamond,fa-ship,fa-user-secret,fa-motorcycle,fa-street-view,fa-heartbeat,fa-venus,fa-mars,fa-mercury,fa-transgender,fa-transgender-alt,fa-venus-double,fa-mars-double,fa-venus-mars,fa-mars-stroke,fa-mars-stroke-v,fa-mars-stroke-h,fa-neuter,fa-facebook-official,fa-pinterest-p,fa-whatsapp,fa-server,fa-user-plus,fa-user-times,fa-bed,fa-viacoin,fa-train,fa-subway,fa-medium,fa-GitHub,fa-bed,fa-buysellads,fa-cart-arrow-down,fa-cart-plus,fa-connectdevelop,fa-dashcube,fa-diamond,fa-facebook-official,fa-forumbee,fa-heartbeat,fa-hotel,fa-leanpub,fa-mars,fa-mars-double,fa-mars-stroke,fa-mars-stroke-h,fa-mars-stroke-v,fa-medium,fa-mercury,fa-motorcycle,fa-neuter,fa-pinterest-p,fa-sellsy,fa-server,fa-ship,fa-shirtsinbulk,fa-simplybuilt,fa-skyatlas,fa-street-view,fa-subway,fa-train,fa-transgender,fa-transgender-alt,fa-user-plus,fa-user-secret,fa-user-times,fa-venus,fa-venus-double,fa-venus-mars,fa-viacoin,fa-whatsapp,fa-adjust,fa-anchor,fa-archive,fa-area-chart,fa-arrows,fa-arrows-h,fa-arrows-v,fa-asterisk,fa-at,fa-automobile,fa-ban,fa-bank,fa-bar-chart,fa-bar-chart-o,fa-barcode,fa-bars,fa-bed,fa-beer,fa-bell,fa-bell-o,fa-bell-slash,fa-bell-slash-o,fa-bicycle,fa-binoculars,fa-birthday-cake,fa-bolt,fa-bomb,fa-book,fa-bookmark,fa-bookmark-o,fa-briefcase,fa-bug,fa-building,fa-building-o,fa-bullhorn,fa-bullseye,fa-bus,fa-cab,fa-calculator,fa-calendar,fa-calendar-o,fa-camera,fa-camera-retro,fa-car,fa-caret-square-o-down,fa-caret-square-o-left,fa-caret-square-o-right,fa-caret-square-o-up,fa-cart-arrow-down,fa-cart-plus,fa-cc,fa-certificate,fa-check,fa-check-circle,fa-check-circle-o,fa-check-square,fa-check-square-o,fa-child,fa-circle,fa-circle-o,fa-circle-o-notch,fa-circle-thin,fa-clock-o,fa-close,fa-cloud,fa-cloud-download,fa-cloud-upload,fa-code,fa-code-fork,fa-coffee,fa-cog,fa-cogs,fa-comment,fa-comment-o,fa-comments,fa-comments-o,fa-compass,fa-copyright,fa-credit-card,fa-crop,fa-crosshairs,fa-cube,fa-cubes,fa-cutlery,fa-dashboard,fa-database,fa-desktop,fa-diamond,fa-dot-circle-o,fa-download,fa-edit,fa-ellipsis-h,fa-ellipsis-v,fa-envelope,fa-envelope-o,fa-envelope-square,fa-eraser,fa-exchange,fa-exclamation,fa-exclamation-circle,fa-exclamation-triangle,fa-external-link,fa-external-link-square,fa-eye,fa-eye-slash,fa-eyedropper,fa-fax,fa-female,fa-fighter-jet,fa-file-archive-o,fa-file-audio-o,fa-file-code-o,fa-file-excel-o,fa-file-image-o,fa-file-movie-o,fa-file-pdf-o,fa-file-photo-o,fa-file-picture-o,fa-file-powerpoint-o,fa-file-sound-o,fa-file-video-o,fa-file-word-o,fa-file-zip-o,fa-film,fa-filter,fa-fire,fa-fire-extinguisher,fa-flag,fa-flag-checkered,fa-flag-o,fa-flash,fa-flask,fa-folder,fa-folder-o,fa-folder-open,fa-folder-open-o,fa-frown-o,fa-futbol-o,fa-gamepad,fa-gavel,fa-gear,fa-gears,fa-genderless,fa-gift,fa-glass,fa-globe,fa-graduation-cap,fa-group,fa-hdd-o,fa-headphones,fa-heart,fa-heart-o,fa-heartbeat,fa-history,fa-home,fa-hotel,fa-image,fa-inbox,fa-info,fa-info-circle,fa-institution,fa-key,fa-keyboard-o,fa-language,fa-laptop,fa-leaf,fa-legal,fa-lemon-o,fa-level-down,fa-level-up,fa-life-bouy,fa-life-buoy,fa-life-ring,fa-life-saver,fa-lightbulb-o,fa-line-chart,fa-location-arrow,fa-lock,fa-magic,fa-magnet,fa-mail-forward,fa-mail-reply,fa-mail-reply-all,fa-male,fa-map-marker,fa-meh-o,fa-microphone,fa-microphone-slash,fa-minus,fa-minus-circle,fa-minus-square,fa-minus-square-o,fa-mobile,fa-mobile-phone,fa-money,fa-moon-o,fa-mortar-board,fa-motorcycle,fa-music,fa-navicon,fa-newspaper-o,fa-paint-brush,fa-paper-plane,fa-paper-plane-o,fa-paw,fa-pencil,fa-pencil-square,fa-pencil-square-o,fa-phone,fa-phone-square,fa-photo,fa-picture-o,fa-pie-chart,fa-plane,fa-plug,fa-plus,fa-plus-circle,fa-plus-square,fa-plus-square-o,fa-power-off,fa-print,fa-puzzle-piece,fa-qrcode,fa-question,fa-question-circle,fa-quote-left,fa-quote-right,fa-random,fa-recycle,fa-refresh,fa-remove,fa-reorder,fa-reply,fa-reply-all,fa-retweet,fa-road,fa-rocket,fa-rss,fa-rss-square,fa-search,fa-search-minus,fa-search-plus,fa-send,fa-send-o,fa-server,fa-share,fa-share-alt,fa-share-alt-square,fa-share-square,fa-share-square-o,fa-shield,fa-ship,fa-shopping-cart,fa-sign-in,fa-sign-out,fa-signal,fa-sitemap,fa-sliders,fa-smile-o,fa-soccer-ball-o,fa-sort,fa-sort-alpha-asc,fa-sort-alpha-desc,fa-sort-amount-asc,fa-sort-amount-desc,fa-sort-asc,fa-sort-desc,fa-sort-down,fa-sort-numeric-asc,fa-sort-numeric-desc,fa-sort-up,fa-space-shuttle,fa-spinner,fa-spoon,fa-square,fa-square-o,fa-star,fa-star-half,fa-star-half-empty,fa-star-half-full,fa-star-half-o,fa-star-o,fa-street-view,fa-suitcase,fa-sun-o,fa-support,fa-tablet,fa-tachometer,fa-tag,fa-tags,fa-tasks,fa-taxi,fa-terminal,fa-thumb-tack,fa-thumbs-down,fa-thumbs-o-down,fa-thumbs-o-up,fa-thumbs-up,fa-ticket,fa-times,fa-times-circle,fa-times-circle-o,fa-tint,fa-toggle-down,fa-toggle-left,fa-toggle-off,fa-toggle-on,fa-toggle-right,fa-toggle-up,fa-trash,fa-trash-o,fa-tree,fa-trophy,fa-truck,fa-tty,fa-umbrella,fa-university,fa-unlock,fa-unlock-alt,fa-unsorted,fa-upload,fa-user,fa-user-plus,fa-user-secret,fa-user-times,fa-users,fa-video-camera,fa-volume-down,fa-volume-off,fa-volume-up,fa-warning,fa-wheelchair,fa-wifi,fa-wrench,fa-ambulance,fa-automobile,fa-bicycle,fa-bus,fa-cab,fa-car,fa-fighter-jet,fa-motorcycle,fa-plane,fa-rocket,fa-ship,fa-space-shuttle,fa-subway,fa-taxi,fa-train,fa-truck,fa-wheelchair,fa-circle-thin,fa-genderless,fa-mars,fa-mars-double,fa-mars-stroke,fa-mars-stroke-h,fa-mars-stroke-v,fa-mercury,fa-neuter,fa-transgender,fa-transgender-alt,fa-venus,fa-venus-double,fa-venus-mars,fa-file,fa-file-archive-o,fa-file-audio-o,fa-file-code-o,fa-file-excel-o,fa-file-image-o,fa-file-movie-o,fa-file-o,fa-file-pdf-o,fa-file-photo-o,fa-file-picture-o,fa-file-powerpoint-o,fa-file-sound-o,fa-file-text,fa-file-text-o,fa-file-video-o,fa-file-word-o,fa-file-zip-o,fa-circle-o-notch,fa-cog,fa-gear,fa-refresh,fa-spinner,fa-check-square,fa-check-square-o,fa-circle,fa-circle-o,fa-dot-circle-o,fa-minus-square,fa-minus-square-o,fa-plus-square,fa-plus-square-o,fa-square,fa-square-o,fa-cc-amex,fa-cc-discover,fa-cc-mastercard,fa-cc-paypal,fa-cc-stripe,fa-cc-visa,fa-credit-card,fa-google-wallet,fa-paypal,fa-area-chart,fa-bar-chart,fa-bar-chart-o,fa-line-chart,fa-pie-chart,fa-bitcoin,fa-btc,fa-cny,fa-dollar,fa-eur,fa-euro,fa-gbp,fa-ils,fa-inr,fa-jpy,fa-krw,fa-money,fa-rmb,fa-rouble,fa-rub,fa-ruble,fa-rupee,fa-shekel,fa-sheqel,fa-try,fa-turkish-lira,fa-usd,fa-won,fa-yen,fa-align-center,fa-align-justify,fa-align-left,fa-align-right,fa-bold,fa-chain,fa-chain-broken,fa-clipboard,fa-columns,fa-copy,fa-cut,fa-dedent,fa-eraser,fa-file,fa-file-o,fa-file-text,fa-file-text-o,fa-files-o,fa-floppy-o,fa-font,fa-header,fa-indent,fa-italic,fa-link,fa-list,fa-list-alt,fa-list-ol,fa-list-ul,fa-outdent,fa-paperclip,fa-paragraph,fa-paste,fa-repeat,fa-rotate-left,fa-rotate-right,fa-save,fa-scissors,fa-strikethrough,fa-subscript,fa-superscript,fa-table,fa-text-height,fa-text-width,fa-th,fa-th-large,fa-th-list,fa-underline,fa-undo,fa-unlink,fa-angle-double-down,fa-angle-double-left,fa-angle-double-right,fa-angle-double-up,fa-angle-down,fa-angle-left,fa-angle-right,fa-angle-up,fa-arrow-circle-down,fa-arrow-circle-left,fa-arrow-circle-o-down,fa-arrow-circle-o-left,fa-arrow-circle-o-right,fa-arrow-circle-o-up,fa-arrow-circle-right,fa-arrow-circle-up,fa-arrow-down,fa-arrow-left,fa-arrow-right,fa-arrow-up,fa-arrows,fa-arrows-alt,fa-arrows-h,fa-arrows-v,fa-caret-down,fa-caret-left,fa-caret-right,fa-caret-square-o-down,fa-caret-square-o-left,fa-caret-square-o-right,fa-caret-square-o-up,fa-caret-up,fa-chevron-circle-down,fa-chevron-circle-left,fa-chevron-circle-right,fa-chevron-circle-up,fa-chevron-down,fa-chevron-left,fa-chevron-right,fa-chevron-up,fa-hand-o-down,fa-hand-o-left,fa-hand-o-right,fa-hand-o-up,fa-long-arrow-down,fa-long-arrow-left,fa-long-arrow-right,fa-long-arrow-up,fa-toggle-down,fa-toggle-left,fa-toggle-right,fa-toggle-up,fa-arrows-alt,fa-backward,fa-compress,fa-eject,fa-expand,fa-fast-backward,fa-fast-forward,fa-forward,fa-pause,fa-play,fa-play-circle,fa-play-circle-o,fa-step-backward,fa-step-forward,fa-stop,fa-youtube-play,fa-report,fa-adn,fa-android,fa-angellist,fa-apple,fa-behance,fa-behance-square,fa-bitbucket,fa-bitbucket-square,fa-bitcoin,fa-btc,fa-buysellads,fa-cc-amex,fa-cc-discover,fa-cc-mastercard,fa-cc-paypal,fa-cc-stripe,fa-cc-visa,fa-codepen,fa-connectdevelop,fa-css3,fa-dashcube,fa-delicious,fa-deviantart,fa-digg,fa-dribbble,fa-dropbox,fa-drupal,fa-empire,fa-facebook,fa-facebook-f,fa-facebook-official,fa-facebook-square,fa-flickr,fa-forumbee,fa-foursquare,fa-ge,fa-git,fa-git-square,fa-github,fa-github-alt,fa-github-square,fa-gittip,fa-google,fa-google-plus,fa-google-plus-square,fa-google-wallet,fa-gratipay,fa-hacker-news,fa-html5,fa-instagram,fa-ioxhost,fa-joomla,fa-jsfiddle,fa-lastfm,fa-lastfm-square,fa-leanpub,fa-linkedin,fa-linkedin-square,fa-linux,fa-maxcdn,fa-meanpath,fa-medium,fa-openid,fa-pagelines,fa-paypal,fa-pied-piper,fa-pied-piper-alt,fa-pinterest,fa-pinterest-p,fa-pinterest-square,fa-qq,fa-ra,fa-rebel,fa-reddit,fa-reddit-square,fa-renren,fa-sellsy,fa-share-alt,fa-share-alt-square,fa-shirtsinbulk,fa-simplybuilt,fa-skyatlas,fa-skype,fa-slack,fa-slideshare,fa-soundcloud,fa-spotify,fa-stack-exchange,fa-stack-overflow,fa-steam,fa-steam-square,fa-stumbleupon,fa-stumbleupon-circle,fa-tencent-weibo,fa-trello,fa-tumblr,fa-tumblr-square,fa-twitch,fa-twitter,fa-twitter-square,fa-viacoin,fa-vimeo-square,fa-vine,fa-vk,fa-wechat,fa-weibo,fa-weixin,fa-whatsapp,fa-windows,fa-wordpress,fa-xing,fa-xing-square,fa-yahoo,fa-yelp,fa-youtube,fa-youtube-play,fa-youtube-square,fa-ambulance,fa-h-square,fa-heart,fa-heart-o,fa-heartbeat,fa-hospital-o,fa-medkit,fa-plus-square,fa-stethoscope,fa-user-md,fa-wheelchair,";
    /**
     * Block-Level Grammar
     */

    var block = {
        newline: /^\n+/,
        code: /^( {4}[^\n]+\n*)+/,
        fences: noop,
        hr: /^( *[-*_]){3,} *(?:\n+|$)/,
        heading: /^ *(#{1,6}) *([^\n]+?) *#* *(?:\n+|$)/,
        nptable: noop,
        lheading: /^([^\n]+)\n *(=|-){2,} *(?:\n+|$)/,
        blockquote: /^( *>[^\n]+(\n(?!def)[^\n]+)*\n*)+/,
        list: /^( *)(bull) [\s\S]+?(?:hr|def|\n{2,}(?! )(?!\1bull )\n*|\s*$)/,
        html: /^ *(?:comment *(?:\n|\s*$)|closed *(?:\n{2,}|\s*$)|closing *(?:\n{2,}|\s*$))/,
        def: /^ *\[([^\]]+)\]: *<?([^\s>]+)>?(?: +["(]([^\n]+)[")])? *(?:\n+|$)/,
        table: noop,
        paragraph: /^((?:[^\n]+\n?(?!hr|heading|lheading|blockquote|tag|def))+)\n*/,
        text: /^[^\n]+/
    };

    block.bullet = /(?:[*+-]|\d+\.)/;
    block.item = /^( *)(bull) [^\n]*(?:\n(?!\1bull )[^\n]*)*/;
    block.item = replace(block.item, 'gm')(/bull/g, block.bullet)();

    block.list = replace(block.list)(/bull/g, block.bullet)('hr', '\\n+(?=\\1?(?:[-*_] *){3,}(?:\\n+|$))')('def', '\\n+(?=' + block.def.source + ')')();

    block.blockquote = replace(block.blockquote)
    ('def', block.def)
    ();

    block._tag = '(?!(?:'
    + 'a|em|strong|small|s|cite|q|dfn|abbr|data|time|code'
    + '|var|samp|kbd|sub|sup|i|b|u|mark|ruby|rt|rp|bdi|bdo'
    + '|span|br|wbr|ins|del|img)\\b)\\w+(?!:/|[^\\w\\s@]*@)\\b';

    block.html = replace(block.html)
    ('comment', /<!--[\s\S]*?-->/)
    ('closed', /<(tag)[\s\S]+?<\/\1>/)
    ('closing', /<tag(?:"[^"]*"|'[^']*'|[^'">])*?>/)
    (/tag/g, block._tag)
    ();

    block.paragraph = replace(block.paragraph)
    ('hr', block.hr)
    ('heading', block.heading)
    ('lheading', block.lheading)
    ('blockquote', block.blockquote)
    ('tag', '<' + block._tag)
    ('def', block.def)
    ();

    /**
     * Normal Block Grammar
     */

    block.normal = merge({}, block);

    /**
     * GFM Block Grammar
     */

    block.gfm = merge({}, block.normal, {
        fences: /^ *(`{3,}|~{3,}) *(\S+)? *\n([\s\S]+?)\s*\1 *(?:\n+|$)/,
        paragraph: /^/
    });

    block.gfm.paragraph = replace(block.paragraph)
    ('(?!', '(?!'
    + block.gfm.fences.source.replace('\\1', '\\2') + '|'
    + block.list.source.replace('\\1', '\\3') + '|')
    ();

    /**
     * GFM + Tables Block Grammar
     */

    block.tables = merge({}, block.gfm, {
        nptable: /^ *(\S.*\|.*)\n *([-:]+ *\|[-| :]*)\n((?:.*\|.*(?:\n|$))*)\n*/,
        table: /^ *\|(.+)\n *\|( *[-:]+[-| :]*)\n((?: *\|.*(?:\n|$))*)\n*/
    });

    /**
     * Block Lexer
     */

    function Lexer(options) {
        this.tokens = [];
        this.tokens.links = {};
        this.options = options || marked.defaults;
        this.rules = block.normal;

        if (this.options.gfm) {
            if (this.options.tables) {
                this.rules = block.tables;
            } else {
                this.rules = block.gfm;
            }
        }
    }

    /**
     * Expose Block Rules
     */

    Lexer.rules = block;

    /**
     * Static Lex Method
     */

    Lexer.lex = function (src, options) {
        var lexer = new Lexer(options);
        return lexer.lex(src);
    };

    /**
     * Preprocessing
     */

    Lexer.prototype.lex = function (src) {
        src = src
            .replace(/\r\n|\r/g, '\n')
            .replace(/\t/g, '    ')
            .replace(/\u00a0/g, ' ')
            .replace(/\u2424/g, '\n');

        return this.token(src, true);
    };

    /**
     * Lexing
     */

    Lexer.prototype.token = function (src, top, bq) {
        var src = src.replace(/^ +$/gm, '')
            , next
            , loose
            , cap
            , bull
            , b
            , item
            , space
            , i
            , l;

        while (src) {
            // newline
            if (cap = this.rules.newline.exec(src)) {
                src = src.substring(cap[0].length);
                if (cap[0].length > 1) {
                    this.tokens.push({
                        type: 'space'
                    });
                }
            }

            // code
            if (cap = this.rules.code.exec(src)) {
                src = src.substring(cap[0].length);
                cap = cap[0].replace(/^ {4}/gm, '');
                this.tokens.push({
                    type: 'code',
                    text: !this.options.pedantic
                        ? cap.replace(/\n+$/, '')
                        : cap
                });
                continue;
            }

            // fences (gfm)
            if (cap = this.rules.fences.exec(src)) {
                src = src.substring(cap[0].length);
                this.tokens.push({
                    type: 'code',
                    lang: cap[2],
                    text: cap[3]
                });
                continue;
            }

            // heading
            if (cap = this.rules.heading.exec(src)) {
                src = src.substring(cap[0].length);
                this.tokens.push({
                    type: 'heading',
                    depth: cap[1].length,
                    text: cap[2]
                });
                continue;
            }

            // table no leading pipe (gfm)
            if (top && (cap = this.rules.nptable.exec(src))) {
                src = src.substring(cap[0].length);

                item = {
                    type: 'table',
                    header: cap[1].replace(/^ *| *\| *$/g, '').split(/ *\| */),
                    align: cap[2].replace(/^ *|\| *$/g, '').split(/ *\| */),
                    cells: cap[3].replace(/\n$/, '').split('\n')
                };

                for (i = 0; i < item.align.length; i++) {
                    if (/^ *-+: *$/.test(item.align[i])) {
                        item.align[i] = 'right';
                    } else if (/^ *:-+: *$/.test(item.align[i])) {
                        item.align[i] = 'center';
                    } else if (/^ *:-+ *$/.test(item.align[i])) {
                        item.align[i] = 'left';
                    } else {
                        item.align[i] = null;
                    }
                }

                for (i = 0; i < item.cells.length; i++) {
                    item.cells[i] = item.cells[i].split(/ *\| */);
                }

                this.tokens.push(item);

                continue;
            }

            // lheading
            if (cap = this.rules.lheading.exec(src)) {
                src = src.substring(cap[0].length);
                this.tokens.push({
                    type: 'heading',
                    depth: cap[2] === '=' ? 1 : 2,
                    text: cap[1]
                });
                continue;
            }

            // hr
            if (cap = this.rules.hr.exec(src)) {
                src = src.substring(cap[0].length);
                this.tokens.push({
                    type: 'hr'
                });
                continue;
            }

            // blockquote
            if (cap = this.rules.blockquote.exec(src)) {
                src = src.substring(cap[0].length);

                this.tokens.push({
                    type: 'blockquote_start'
                });

                cap = cap[0].replace(/^ *> ?/gm, '');

                // Pass `top` to keep the current
                // "toplevel" state. This is exactly
                // how markdown.pl works.
                this.token(cap, top, true);

                this.tokens.push({
                    type: 'blockquote_end'
                });

                continue;
            }

            // list
            if (cap = this.rules.list.exec(src)) {
                src = src.substring(cap[0].length);
                bull = cap[2];

                this.tokens.push({
                    type: 'list_start',
                    ordered: bull.length > 1
                });

                // Get each top-level item.
                cap = cap[0].match(this.rules.item);

                next = false;
                l = cap.length;
                i = 0;

                for (; i < l; i++) {
                    item = cap[i];

                    // Remove the list item's bullet
                    // so it is seen as the next token.
                    space = item.length;
                    item = item.replace(/^ *([*+-]|\d+\.) +/, '');

                    // Outdent whatever the
                    // list item contains. Hacky.
                    if (~item.indexOf('\n ')) {
                        space -= item.length;
                        item = !this.options.pedantic
                            ? item.replace(new RegExp('^ {1,' + space + '}', 'gm'), '')
                            : item.replace(/^ {1,4}/gm, '');
                    }

                    // Determine whether the next list item belongs here.
                    // Backpedal if it does not belong in this list.
                    if (this.options.smartLists && i !== l - 1) {
                        b = block.bullet.exec(cap[i + 1])[0];
                        if (bull !== b && !(bull.length > 1 && b.length > 1)) {
                            src = cap.slice(i + 1).join('\n') + src;
                            i = l - 1;
                        }
                    }

                    // Determine whether item is loose or not.
                    // Use: /(^|\n)(?! )[^\n]+\n\n(?!\s*$)/
                    // for discount behavior.
                    loose = next || /\n\n(?!\s*$)/.test(item);
                    if (i !== l - 1) {
                        next = item.charAt(item.length - 1) === '\n';
                        if (!loose) loose = next;
                    }

                    this.tokens.push({
                        type: loose
                            ? 'loose_item_start'
                            : 'list_item_start'
                    });

                    // Recurse.
                    this.token(item, false, bq);

                    this.tokens.push({
                        type: 'list_item_end'
                    });
                }

                this.tokens.push({
                    type: 'list_end'
                });

                continue;
            }

            // html
            if (cap = this.rules.html.exec(src)) {
                src = src.substring(cap[0].length);
                this.tokens.push({
                    type: this.options.sanitize
                        ? 'paragraph'
                        : 'html',
                    pre: cap[1] === 'pre' || cap[1] === 'script' || cap[1] === 'style',
                    text: cap[0]
                });
                continue;
            }

            // def
            if ((!bq && top) && (cap = this.rules.def.exec(src))) {
                src = src.substring(cap[0].length);
                this.tokens.links[cap[1].toLowerCase()] = {
                    href: cap[2],
                    title: cap[3]
                };
                continue;
            }

            // table (gfm)
            if (top && (cap = this.rules.table.exec(src))) {
                src = src.substring(cap[0].length);

                item = {
                    type: 'table',
                    header: cap[1].replace(/^ *| *\| *$/g, '').split(/ *\| */),
                    align: cap[2].replace(/^ *|\| *$/g, '').split(/ *\| */),
                    cells: cap[3].replace(/(?: *\| *)?\n$/, '').split('\n')
                };

                for (i = 0; i < item.align.length; i++) {
                    if (/^ *-+: *$/.test(item.align[i])) {
                        item.align[i] = 'right';
                    } else if (/^ *:-+: *$/.test(item.align[i])) {
                        item.align[i] = 'center';
                    } else if (/^ *:-+ *$/.test(item.align[i])) {
                        item.align[i] = 'left';
                    } else {
                        item.align[i] = null;
                    }
                }

                for (i = 0; i < item.cells.length; i++) {
                    item.cells[i] = item.cells[i]
                        .replace(/^ *\| *| *\| *$/g, '')
                        .split(/ *\| */);
                }

                this.tokens.push(item);

                continue;
            }

            // top-level paragraph
            if (top && (cap = this.rules.paragraph.exec(src))) {
                src = src.substring(cap[0].length);
                this.tokens.push({
                    type: 'paragraph',
                    text: cap[1].charAt(cap[1].length - 1) === '\n'
                        ? cap[1].slice(0, -1)
                        : cap[1]
                });
                continue;
            }

            // text
            if (cap = this.rules.text.exec(src)) {
                // Top-level should never reach here.
                src = src.substring(cap[0].length);
                this.tokens.push({
                    type: 'text',
                    text: cap[0]
                });
                continue;
            }

            if (src) {
                throw new
                    Error('Infinite loop on byte: ' + src.charCodeAt(0));
            }
        }

        return this.tokens;
    };

    /**
     * Inline-Level Grammar
     */

    var inline = {
        escape: /^\\([\\`*{}\[\]()#+\-.!_>])/,
        autolink: /^<([^ >]+(@|:\/)[^ >]+)>/,
        url: noop,
        tag: /^<!--[\s\S]*?-->|^<\/?\w+(?:"[^"]*"|'[^']*'|[^'">])*?>/,
        link: /^!?\[(inside)\]\(href\)/,
        reflink: /^!?\[(inside)\]\s*\[([^\]]*)\]/,
        nolink: /^!?\[((?:\[[^\]]*\]|[^\[\]])*)\]/,
        strong: /^__([\s\S]+?)__(?!_)|^\*\*([\s\S]+?)\*\*(?!\*)/,
        em: /^\b_((?:__|[\s\S])+?)_\b|^\*((?:\*\*|[\s\S])+?)\*(?!\*)/,
        code: /^(`+)\s*([\s\S]*?[^`])\s*\1(?!`)/,
        br: /^ {2,}\n(?!\s*$)/,
        del: noop,
        emoji: noop,
        text: /^[\s\S]+?(?=[\\<!\[_*`]| {2,}\n|$)/
    };

    inline._inside = /(?:\[[^\]]*\]|[^\[\]]|\](?=[^\[]*\]))*/;
    inline._href = /\s*<?([\s\S]*?)>?(?:\s+['"]([\s\S]*?)['"])?\s*/;

    inline.link = replace(inline.link)
    ('inside', inline._inside)
    ('href', inline._href)
    ();

    inline.reflink = replace(inline.reflink)
    ('inside', inline._inside)
    ();

    /**
     * Normal Inline Grammar
     */

    inline.normal = merge({}, inline);

    /**
     * Pedantic Inline Grammar
     */

    inline.pedantic = merge({}, inline.normal, {
        strong: /^__(?=\S)([\s\S]*?\S)__(?!_)|^\*\*(?=\S)([\s\S]*?\S)\*\*(?!\*)/,
        em: /^_(?=\S)([\s\S]*?\S)_(?!_)|^\*(?=\S)([\s\S]*?\S)\*(?!\*)/
    });

    /**
     * GFM Inline Grammar
     */

    inline.gfm = merge({}, inline.normal, {
        escape: replace(inline.escape)('])', '~|])')(),
        url: /^(https?:\/\/[^\s<]+[^<.,:;"')\]\s])/,
        del: /^~~(?=\S)([\s\S]*?\S)~~/,
        //emoji
        emoji: /^:([A-Za-z0-9_\-\+]+?):/,
        text: replace(inline.text)
            //(']|', '~]|')
        (']|', ':~]|')
        ('|', '|https?://|')
        ()
    });

    /**
     * GFM + Line Breaks Inline Grammar
     */

    inline.breaks = merge({}, inline.gfm, {
        br: replace(inline.br)('{2,}', '*')(),
        text: replace(inline.gfm.text)('{2,}', '*')()
    });

    /**
     * Inline Lexer & Compiler
     */

    function InlineLexer(links, options) {
        this.options = options || marked.defaults;
        this.links = links;
        this.rules = inline.normal;
        this.renderer = this.options.renderer || new Renderer;
        this.renderer.options = this.options;

        if (!this.links) {
            throw new
                Error('Tokens array requires a `links` property.');
        }

        if (this.options.gfm) {
            if (this.options.breaks) {
                this.rules = inline.breaks;
            } else {
                this.rules = inline.gfm;
            }
        } else if (this.options.pedantic) {
            this.rules = inline.pedantic;
        }
        //emoji
        this.emojiTemplate = getEmojiTemplate(options);
    }

    /**
     * Expose Inline Rules
     */

    InlineLexer.rules = inline;

    /**
     * Static Lexing/Compiling Method
     */

    InlineLexer.output = function (src, links, options) {
        var inline = new InlineLexer(links, options);
        return inline.output(src);
    };

    /**
     * Lexing/Compiling
     */

    InlineLexer.prototype.output = function (src) {
        var out = ''
            , link
            , text
            , href
            , cap;

        while (src) {
            // escape
            if (cap = this.rules.escape.exec(src)) {
                src = src.substring(cap[0].length);
                out += cap[1];
                continue;
            }

            // autolink
            if (cap = this.rules.autolink.exec(src)) {
                src = src.substring(cap[0].length);
                if (cap[2] === '@') {
                    text = cap[1].charAt(6) === ':'
                        ? this.mangle(cap[1].substring(7))
                        : this.mangle(cap[1]);
                    href = this.mangle('mailto:') + text;
                } else {
                    text = escape(cap[1]);
                    href = text;
                }
                out += this.renderer.link(href, null, text);
                continue;
            }

            // url (gfm)
            if (!this.inLink && (cap = this.rules.url.exec(src))) {
                src = src.substring(cap[0].length);
                text = escape(cap[1]);
                href = text;
                out += this.renderer.link(href, null, text);
                continue;
            }

            // tag
            if (cap = this.rules.tag.exec(src)) {
                if (!this.inLink && /^<a /i.test(cap[0])) {
                    this.inLink = true;
                } else if (this.inLink && /^<\/a>/i.test(cap[0])) {
                    this.inLink = false;
                }
                src = src.substring(cap[0].length);
                out += this.options.sanitize
                    ? escape(cap[0])
                    : cap[0];
                continue;
            }

            // link
            if (cap = this.rules.link.exec(src)) {
                src = src.substring(cap[0].length);
                this.inLink = true;
                out += this.outputLink(cap, {
                    href: cap[2],
                    title: cap[3]
                });
                this.inLink = false;
                continue;
            }

            // reflink, nolink
            if ((cap = this.rules.reflink.exec(src))
                || (cap = this.rules.nolink.exec(src))) {
                src = src.substring(cap[0].length);
                link = (cap[2] || cap[1]).replace(/\s+/g, ' ');
                link = this.links[link.toLowerCase()];
                if (!link || !link.href) {
                    out += cap[0].charAt(0);
                    src = cap[0].substring(1) + src;
                    continue;
                }
                this.inLink = true;
                out += this.outputLink(cap, link);
                this.inLink = false;
                continue;
            }

            // strong
            if (cap = this.rules.strong.exec(src)) {
                src = src.substring(cap[0].length);
                out += this.renderer.strong(this.output(cap[2] || cap[1]));
                continue;
            }

            // em
            if (cap = this.rules.em.exec(src)) {
                src = src.substring(cap[0].length);
                out += this.renderer.em(this.output(cap[2] || cap[1]));
                continue;
            }

            // code
            if (cap = this.rules.code.exec(src)) {
                src = src.substring(cap[0].length);
                out += this.renderer.codespan(escape(cap[2], true));
                continue;
            }

            // br
            if (cap = this.rules.br.exec(src)) {
                src = src.substring(cap[0].length);
                out += this.renderer.br();
                continue;
            }

            // del (gfm)
            if (cap = this.rules.del.exec(src)) {
                src = src.substring(cap[0].length);
                out += this.renderer.del(this.output(cap[1]));
                continue;
            }

            // emoji (gfm)
            if (cap = this.rules.emoji.exec(src)) {
                src = src.substring(cap[0].length);
                out += this.emoji(cap[1]);
                continue;
            }

            // text
            if (cap = this.rules.text.exec(src)) {
                src = src.substring(cap[0].length);
                out += escape(this.smartypants(cap[0]));
                continue;
            }

            if (src) {
                throw new
                    Error('Infinite loop on byte: ' + src.charCodeAt(0));
            }
        }

        return out;
    };

    /**
     * Compile Link
     */

    InlineLexer.prototype.outputLink = function (cap, link) {
        var href = escape(link.href)
            , title = link.title ? escape(link.title) : null;

        return cap[0].charAt(0) !== '!'
            ? this.renderer.link(href, title, this.output(cap[1]))
            : this.renderer.image(href, title, escape(cap[1]));
    };

    /**
     * Emoji Transformations
     */

    function emojiDefaultTemplate(emoji) {
        var _emoji = ',' + emoji + ',';
        if (emojiNames.indexOf(_emoji) < 0)
            return ":" + emoji + ":";
        var _class = emoji.match(/fa-\S+/) === null ? '' : 'fa ' + emoji;
        return '<emoji '
                /* + 'src="'
                 + '../img/emoji/people/'
                 + encodeURIComponent(emoji)
                 + '.png"'
                 + ' alt=":'
                 + escape(emoji)
                 + ':"'
                 + ' title=":'
                 + escape(emoji)
                 + ':"'*/
            + ' class="'
            + _class
            + '"'
            + ' data-name="'
            + escape(emoji)
            + '"'
            + ' data-emoji="emoji '
            + escape(emoji)
            + '" align="absmiddle"><\/emoji>';
    }

    function getEmojiTemplate(options) {
        if (options.emoji) {
            if (typeof options.emoji === 'function') {
                return options.emoji;
            }

            if (typeof options.emoji === 'string') {
                var emojiSplit = options.emoji.split(/\{emoji\}/g);
                return function (emoji) {
                    return emojiSplit.join(emoji);
                }
            }
        }
        return emojiDefaultTemplate;
    }

    InlineLexer.prototype.emojiTemplate = emojiDefaultTemplate;
    InlineLexer.prototype.emoji = function (name) {
        if (!this.options.emoji) return ':' + name + ':';

        return this.emojiTemplate(name);
    };

    /**
     * Smartypants Transformations
     */

    InlineLexer.prototype.smartypants = function (text) {
        if (!this.options.smartypants) return text;
        return text
            // em-dashes
            .replace(/--/g, '\u2014')
            // opening singles
            .replace(/(^|[-\u2014/(\[{"\s])'/g, '$1\u2018')
            // closing singles & apostrophes
            .replace(/'/g, '\u2019')
            // opening doubles
            .replace(/(^|[-\u2014/(\[{\u2018\s])"/g, '$1\u201c')
            // closing doubles
            .replace(/"/g, '\u201d')
            // ellipses
            .replace(/\.{3}/g, '\u2026');
    };

    /**
     * Mangle Links
     */

    InlineLexer.prototype.mangle = function (text) {
        var out = ''
            , l = text.length
            , i = 0
            , ch;

        for (; i < l; i++) {
            ch = text.charCodeAt(i);
            if (Math.random() > 0.5) {
                ch = 'x' + ch.toString(16);
            }
            out += '&#' + ch + ';';
        }

        return out;
    };

    /**
     * Renderer
     */

    function Renderer(options) {
        this.options = options || {};
    }

    Renderer.prototype.code = function (code, lang, escaped) {
        if (this.options.highlight) {
            var out = this.options.highlight(code, lang);
            if (out != null && out !== code) {
                escaped = true;
                code = out;
            }
        }

        if (!lang) {
            return '<pre><code class="hljs">'
                + (escaped ? code : escape(code, true))
                + '\n</code></pre>';
        }

        return '<pre><code class="'
            + this.options.langPrefix
            + escape(lang, true)
            + ' hljs">'
            + (escaped ? code : escape(code, true))
            + '\n</code></pre>\n';
    };

    Renderer.prototype.blockquote = function (quote) {
        return '<blockquote>\n' + quote + '</blockquote>\n';
    };

    Renderer.prototype.html = function (html) {
        return html;
    };

    Renderer.prototype.heading = function (text, level, raw) {
        return '<h'
            + level
            + ' id="'
            + this.options.headerPrefix
            + raw.toLowerCase().replace(/[^\w]+/g, '-')
            + '">'
            + text
            + '</h'
            + level
            + '>\n';
    };

    Renderer.prototype.hr = function () {
        return this.options.xhtml ? '<hr/>\n' : '<hr>\n';
    };

    Renderer.prototype.list = function (body, ordered) {
        var type = ordered ? 'ol' : 'ul';
        return '<' + type + '>\n' + body + '</' + type + '>\n';
    };

    Renderer.prototype.listitem = function (text) {
        return '<li>' + text + '</li>\n';
    };

    Renderer.prototype.paragraph = function (text) {
        return '<p>' + text + '</p>\n';
    };

    Renderer.prototype.table = function (header, body) {
        return '<table>\n'
            + '<thead>\n'
            + header
            + '</thead>\n'
            + '<tbody>\n'
            + body
            + '</tbody>\n'
            + '</table>\n';
    };

    Renderer.prototype.tablerow = function (content) {
        return '<tr>\n' + content + '</tr>\n';
    };

    Renderer.prototype.tablecell = function (content, flags) {
        var type = flags.header ? 'th' : 'td';
        var tag = flags.align
            ? '<' + type + ' style="text-align:' + flags.align + '">'
            : '<' + type + '>';
        return tag + content + '</' + type + '>\n';
    };

// span level renderer
    Renderer.prototype.strong = function (text) {
        return '<strong>' + text + '</strong>';
    };

    Renderer.prototype.em = function (text) {
        return '<em>' + text + '</em>';
    };

    Renderer.prototype.codespan = function (text) {
        return '<code>' + text + '</code>';
    };

    Renderer.prototype.br = function () {
        return this.options.xhtml ? '<br/>' : '<br>';
    };

    Renderer.prototype.del = function (text) {
        return '<del>' + text + '</del>';
    };

    Renderer.prototype.link = function (href, title, text) {
        if (this.options.sanitize) {
            try {
                var prot = decodeURIComponent(unescape(href))
                    .replace(/[^\w:]/g, '')
                    .toLowerCase();
            } catch (e) {
                return '';
            }
            if (prot.indexOf('javascript:') === 0 || prot.indexOf('vbscript:') === 0) {
                return '';
            }
        }
        var out = '<a href="' + href + '"';
        if (title) {
            out += ' title="' + title + '"';
        }
        out += '>' + text + '</a>';
        return out;
    };

    Renderer.prototype.image = function (href, title, text) {
        var out = '<img src="' + href + '" alt="' + text + '"';
        if (title) {
            out += ' title="' + title + '"';
        }
        out += this.options.xhtml ? '/>' : '>';
        return out;
    };

    /**
     * Parsing & Compiling
     */

    function Parser(options) {
        this.tokens = [];
        this.token = null;
        this.options = options || marked.defaults;
        this.options.renderer = this.options.renderer || new Renderer;
        this.renderer = this.options.renderer;
        this.renderer.options = this.options;
    }

    /**
     * Static Parse Method
     */

    Parser.parse = function (src, options, renderer) {
        var parser = new Parser(options, renderer);
        return parser.parse(src);
    };

    /**
     * Parse Loop
     */

    Parser.prototype.parse = function (src) {
        this.inline = new InlineLexer(src.links, this.options, this.renderer);
        this.tokens = src.reverse();

        var out = '';
        while (this.next()) {
            out += this.tok();
        }

        return out;
    };

    /**
     * Next Token
     */

    Parser.prototype.next = function () {
        return this.token = this.tokens.pop();
    };

    /**
     * Preview Next Token
     */

    Parser.prototype.peek = function () {
        return this.tokens[this.tokens.length - 1] || 0;
    };

    /**
     * Parse Text Tokens
     */

    Parser.prototype.parseText = function () {
        var body = this.token.text;

        while (this.peek().type === 'text') {
            body += '\n' + this.next().text;
        }

        return this.inline.output(body);
    };

    /**
     * Parse Current Token
     */

    Parser.prototype.tok = function () {
        switch (this.token.type) {
            case 'space':
            {
                return '';
            }
            case 'hr':
            {
                return this.renderer.hr();
            }
            case 'heading':
            {
                return this.renderer.heading(
                    this.inline.output(this.token.text),
                    this.token.depth,
                    this.token.text);
            }
            case 'code':
            {
                return this.renderer.code(this.token.text,
                    this.token.lang,
                    this.token.escaped);
            }
            case 'table':
            {
                var header = ''
                    , body = ''
                    , i
                    , row
                    , cell
                    , flags
                    , j;

                // header
                cell = '';
                for (i = 0; i < this.token.header.length; i++) {
                    flags = {header: true, align: this.token.align[i]};
                    cell += this.renderer.tablecell(
                        this.inline.output(this.token.header[i]),
                        {header: true, align: this.token.align[i]}
                    );
                }
                header += this.renderer.tablerow(cell);

                for (i = 0; i < this.token.cells.length; i++) {
                    row = this.token.cells[i];

                    cell = '';
                    for (j = 0; j < row.length; j++) {
                        cell += this.renderer.tablecell(
                            this.inline.output(row[j]),
                            {header: false, align: this.token.align[j]}
                        );
                    }

                    body += this.renderer.tablerow(cell);
                }
                return this.renderer.table(header, body);
            }
            case 'blockquote_start':
            {
                var body = '';

                while (this.next().type !== 'blockquote_end') {
                    body += this.tok();
                }

                return this.renderer.blockquote(body);
            }
            case 'list_start':
            {
                var body = ''
                    , ordered = this.token.ordered;

                while (this.next().type !== 'list_end') {
                    body += this.tok();
                }

                return this.renderer.list(body, ordered);
            }
            case 'list_item_start':
            {
                var body = '';

                while (this.next().type !== 'list_item_end') {
                    body += this.token.type === 'text'
                        ? this.parseText()
                        : this.tok();
                }

                return this.renderer.listitem(body);
            }
            case 'loose_item_start':
            {
                var body = '';

                while (this.next().type !== 'list_item_end') {
                    body += this.tok();
                }

                return this.renderer.listitem(body);
            }
            case 'html':
            {
                var html = !this.token.pre && !this.options.pedantic
                    ? this.inline.output(this.token.text)
                    : this.token.text;
                return this.renderer.html(html);
            }
            case 'paragraph':
            {
                return this.renderer.paragraph(this.inline.output(this.token.text));
            }
            case 'text':
            {
                return this.renderer.paragraph(this.parseText());
            }
        }
    };

    /**
     * Helpers
     */

    function escape(html, encode) {
        return html
            .replace(!encode ? /&(?!#?\w+;)/g : /&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;');
    }

    function unescape(html) {
        return html.replace(/&([#\w]+);/g, function (_, n) {
            n = n.toLowerCase();
            if (n === 'colon') return ':';
            if (n.charAt(0) === '#') {
                return n.charAt(1) === 'x'
                    ? String.fromCharCode(parseInt(n.substring(2), 16))
                    : String.fromCharCode(+n.substring(1));
            }
            return '';
        });
    }

    function replace(regex, opt) {
        regex = regex.source;
        opt = opt || '';
        return function self(name, val) {
            if (!name) return new RegExp(regex, opt);
            val = val.source || val;
            val = val.replace(/(^|[^\[])\^/g, '$1');
            regex = regex.replace(name, val);
            return self;
        };
    }

    function noop() {
    }

    noop.exec = noop;

    function merge(obj) {
        var i = 1
            , target
            , key;

        for (; i < arguments.length; i++) {
            target = arguments[i];
            for (key in target) {
                if (Object.prototype.hasOwnProperty.call(target, key)) {
                    obj[key] = target[key];
                }
            }
        }

        return obj;
    }


    /**
     * Marked
     */

    function marked(src, opt, callback) {
        if (callback || typeof opt === 'function') {
            if (!callback) {
                callback = opt;
                opt = null;
            }

            opt = merge({}, marked.defaults, opt || {});

            var highlight = opt.highlight
                , tokens
                , pending
                , i = 0;

            try {
                tokens = Lexer.lex(src, opt)
            } catch (e) {
                return callback(e);
            }

            pending = tokens.length;

            var done = function (err) {
                if (err) {
                    opt.highlight = highlight;
                    return callback(err);
                }

                var out;

                try {
                    out = Parser.parse(tokens, opt);
                } catch (e) {
                    err = e;
                }

                opt.highlight = highlight;

                return err
                    ? callback(err)
                    : callback(null, out);
            };

            if (!highlight || highlight.length < 3) {
                return done();
            }

            delete opt.highlight;

            if (!pending) return done();

            for (; i < tokens.length; i++) {
                (function (token) {
                    if (token.type !== 'code') {
                        return --pending || done();
                    }
                    return highlight(token.text, token.lang, function (err, code) {
                        if (err) return done(err);
                        if (code == null || code === token.text) {
                            return --pending || done();
                        }
                        token.text = code;
                        token.escaped = true;
                        --pending || done();
                    });
                })(tokens[i]);
            }

            return;
        }
        try {
            if (opt) opt = merge({}, marked.defaults, opt);
            return Parser.parse(Lexer.lex(src, opt), opt);
        } catch (e) {
            e.message += '\nPlease report this to https://github.com/chjj/marked.';
            if ((opt || marked.defaults).silent) {
                return '<p>An error occured:</p><pre>'
                    + escape(e.message + '', true)
                    + '</pre>';
            }
            throw e;
        }
    }

    /**
     * Options
     */

    marked.options =
        marked.setOptions = function (opt) {
            merge(marked.defaults, opt);
            return marked;
        };

    marked.defaults = {
        gfm: true,
        emoji: false,
        tables: true,
        breaks: false,
        pedantic: false,
        sanitize: false,
        smartLists: false,
        silent: false,
        highlight: null,
        langPrefix: 'lang-',
        smartypants: false,
        headerPrefix: '',
        renderer: new Renderer,
        xhtml: false
    };

    /**
     * Expose
     */

    marked.Parser = Parser;
    marked.parser = Parser.parse;

    marked.Renderer = Renderer;

    marked.Lexer = Lexer;
    marked.lexer = Lexer.lex;

    marked.InlineLexer = InlineLexer;
    marked.inlineLexer = InlineLexer.output;

    marked.parse = marked;

    if (typeof module !== 'undefined' && typeof exports === 'object') {
        module.exports = marked;
    } else if (typeof define === 'function' && define.amd) {
        define(function () {
            return marked;
        });
    } else {
        this.marked = marked;
    }

}).call(function () {
        return this || (typeof window !== 'undefined' ? window : global);
    }());