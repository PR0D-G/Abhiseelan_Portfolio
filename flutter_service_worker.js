'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "8439beb8b1732c0a2985d22d90c57484",
".git/config": "733ed8e8152938e9fd4d4ba3c002ba22",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "2a0d1118b1373bd8cf98adb00a89635a",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "257466741d91d157363f9997799add15",
".git/logs/refs/heads/master": "257466741d91d157363f9997799add15",
".git/logs/refs/remotes/origin/gh-pages": "a1b2b867b6702e231cc9dca40c9cb6b1",
".git/objects/01/1842b856d2844c35f671e492a3793c1dea487f": "9a7fa59443b8925d7b787ea6939b9d2f",
".git/objects/02/1d4f3579879a4ac147edbbd8ac2d91e2bc7323": "9e9721befbee4797263ad5370cd904ff",
".git/objects/05/a9c09613574de9b77071261d4429ad6457f4f3": "ac4627b63d6bbc4a63e59c613b45193e",
".git/objects/06/6a3b73c1e4ed30835c26030cf3d5a54dc0a2b1": "e7987742b102ccb7bd4f87cde9c71e92",
".git/objects/09/5d3a9bbd052a2041a4d11b1421fc620169d1de": "408c63682bb4623b1649bf51a7c0dc7c",
".git/objects/12/4499122b5714e69341a17273cc0e8709bf0de6": "df42b0fb14c71eaae0926a9166c73712",
".git/objects/15/e62f93c4154bfa9e8e22374b8bb5965ff55872": "1063731fabd16193abe51b2cb35426e0",
".git/objects/1b/3778bc11b1e5ee6d795b2f8ff29b98d0691af5": "902c2c05e90eb430ffc05dec5ede0f84",
".git/objects/1b/be00559b06a0644d447eba329960dd393c57b3": "18c8f1543397cad701c4ffb65dbc385f",
".git/objects/1c/6b2601898567c11673a580f4e364ea9752d2ae": "f22231454f33dea2ed49d55b1449368f",
".git/objects/1e/19e61e2501ff0d55ad8007faab25294a72607f": "e0cd88cd5c0a8c5d42f210723676eef0",
".git/objects/1e/54a86f80eec9b3da9d72d436cef5639fa8dc66": "3ec681bd76761614c211bd24c8cc4cee",
".git/objects/1f/fdf00c96f5d8fd15d853d213916d56cf68a541": "cd5cfc1d0e3986bb5c4959d0370153ca",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/25/bf0129a1ccbedd06d5e03547d17e9e8b60661a": "3c38a186172a7470fd2afe34220e719c",
".git/objects/26/9a4123558c7107d4e08d6adfd4d64f64a4a2c5": "e35e239b6b61dda5f03df7e2a3311515",
".git/objects/28/6a48c5a453d73fb5ce555f9a0656a923e22e96": "99f80d4c240a77ee916c880b7fc4f03d",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/30/6942dc5bda024438722d4da845f397d2b10e14": "682a06660c7a1bece06811374e7444ab",
".git/objects/31/0895e48a398fbd4046899bc0dd79d5233e248c": "688df3bf26cd8f8847e0b2a6db49d996",
".git/objects/3a/67c75a133cebf96daf9e54c0e84cc7b9fedd3c": "157669c54a682572c99fe5787e72f4de",
".git/objects/42/4f99a459f2dddbec151a59c35cbde4db48f1ac": "631693670724b562d9246e846fca900d",
".git/objects/49/f7d4b3c7f11575c18da76baf6126af5dc50fd4": "b1f4803b23aff24fe4dfc22efcea9738",
".git/objects/4a/8935cd30fef2ccab897a51944df77dda3f87d7": "1f52caa1bd1d9b4600b5530e61478a54",
".git/objects/4c/05c172db788d7b88e2f2c64c6ad1947c9682d9": "d28b92b189a8fd8c923d2c81f8ef885d",
".git/objects/4d/545bd7ab8def466c6fd1b546d19ca87e2effe7": "559d984d2b2b56131171d1e0994f19bd",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/53/e225ee8f69609dab29dc01fdcc9547dc2fa2e4": "27318afb8b3fa87dff16489932ee69a4",
".git/objects/57/c150ff974bbc884ac19ccdc31fb0bb3ddeb6db": "7200cb33cc7173ae12762251021a70d3",
".git/objects/59/62efb2dffef4c259bda261b128fcab4b659c34": "11e1a7683fedc73b6a0da57ee3c6a112",
".git/objects/59/665ccac04837282a28bbe6819975401290e163": "ea7ffc002a45eb528904fe60603653a8",
".git/objects/5a/ffbaa3f2bf53feb27398129f551b331b8dd5bb": "125f5990517aaf21e1c04656f2539a7f",
".git/objects/5c/4639a55f51621baa03c4c0f8f29ddc37d45deb": "78f230df9a55bc1eb1ead0279e0860d5",
".git/objects/5e/8448cfdd8ff56e1090bdec7886e124dc40e632": "bb77138b3a7314f7a73f388f2a84d9ad",
".git/objects/63/4a72529f1122f205d2f08681ad1342ba178370": "ccce36e1a761689099e485d07af3d8c2",
".git/objects/63/ba5d8952af7d683d9882aa012d21003c9b811a": "f487276845e3cb24bb631f37644a0a72",
".git/objects/6a/c675857aa3a299e49eb2c4c483d11cf9d1a17a": "49066677ee939d83e3bdfa6bce03ff65",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6b/df2ebe68c144c030ef9d6a874de6cbd2af0f39": "f0ee18e379ba4f62461a7a48e077bb07",
".git/objects/6d/7f8841d97aed41d5820d7e7c7c6e6e26b6f181": "d5f5b1daa4870f92c8e63ee64da378d1",
".git/objects/6d/f2b253603094de7f39886aae03181c686e375b": "4e432986780adf1da707b08f0bc71809",
".git/objects/73/5fe05d2d9072b1c725a7c5304bd56445371b1e": "60897b768b1848dede52743f3835bccd",
".git/objects/76/10155b509a18e4d1b9faef45f53addf02a682e": "2f43045ea1d8d90f55c11a6b120f8dcd",
".git/objects/76/6dbe9f3da3fc44118408112a3962096e08cd5a": "db3848b88650fc979583865553541c39",
".git/objects/76/cdd6f64291701d7d12221024f1194f279b582d": "fb340f1083b686af4d4e1758c4a869ef",
".git/objects/77/e2c77a6cfffe19a721f8a95db535374b1dc8fc": "b5bf34a16cff65882a919a90ab424b83",
".git/objects/79/d84519a24ddb5b294b8794a228aaa5dd25271c": "dab79eb419474c63d83af02dd687263a",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/objects/7c/202a96ff594773def6c678959f89b181f37ee4": "35316eb9cac8825029c3fce9e0c6e8fe",
".git/objects/7e/29433cac0bc911bbd75b2e5da334a54cda3476": "1228ce383dc11e929e51f3c69a75ac96",
".git/objects/7e/800458506d450cc6764286ee3304adbdde5f8c": "a6cf242ed6b324fbc0ac345a09e3a16c",
".git/objects/80/e37ea0ad20faa94f8d718308a12e1990c1de25": "893bbffc49c0c364b0d769737d927128",
".git/objects/82/a28d1b5ca5a5e6602ac040d66324dc31e5b325": "6619a8396686f9842f703634b0e7ffad",
".git/objects/85/3cae6ab8ffaf6731873638f7f9db881b31589c": "b85c3f5085f1f89472df555733192540",
".git/objects/86/34a97c911ebed728ca5d3ca1ecbd526e7e6533": "a19c71a985a50a082c95d30c9c7ade17",
".git/objects/87/09641f868752b8ca89650c934cdf9d9b27e614": "7beddf69215d95cb2ce190983f3f2b9e",
".git/objects/88/0daf581c62e7d1e9f0a40d013cb987968407c0": "bf9e77a4276e9c700f431a744d988b50",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/90/b92906abeebaf6ca6b7ee05ca3d214cfd631dd": "3172f65b122e88b4172c3b3d90b8c1d6",
".git/objects/90/c0db1987930c25fc9cbc9b9187b1aff9a0dae0": "e81e105d33d5b7a15d0b25717e29da00",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/99/6ec04acb0c56a4c8748d693c753fe16dc21f5f": "ed4f328546fa62cac1779f0800edac46",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/a4/b90abe71b424fc24013083e94e3d187f0beefa": "5efbaa30d338ac000e8e3c918b0642d4",
".git/objects/b0/b9a94eb116655bbc52c699408f89d6f3e5c47a": "df4f2198025ac19b73feed9f7e7b8721",
".git/objects/b5/07462597bfb3d330ac5574c8c0893df71ca5f4": "06cc9ab9d2815166d1025575718c739d",
".git/objects/b5/e1b79d845556f36434272a06621e71cfd7ccb8": "1b1d13601c0942224bc85eccb6bf4cf7",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b6/b99d0486e311740de273e602414c4a856ddb51": "77bcd8620ca7bfaa1df373c030fa2777",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/76829273011797dcf0cce50af0a98e90336a31": "191b0e059909f49562f2435f6942c387",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/d42807e91954fbe0fc9051e7f79cd64d7222bc": "ba7a6fd47e679f5b15039f846064b924",
".git/objects/be/fce6af890a4edf6d3c858878b30c1c2e2cd803": "a6c70daafc28408c562234b3d09e0578",
".git/objects/c2/7a7d610cb8afb5c9cd081fddf11f2a41073040": "58f342e43d7791ae358a6d2a927ac469",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/c5/73fb1150eb23ebf9aba03e76b248c48357c314": "72fdaa68e64773e8d004012b9ee9efc8",
".git/objects/c5/b6fd4e7a8627c8427b331eb55031aa20c651ca": "4d366a7852312a1b95efb49a6323b071",
".git/objects/c9/b54b4a5b220400f49d5bfe64155bf34beb4761": "c9c3d9747508c4ce071c21001297b78b",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/cb/25b7c3085627b8c7f34f3a3efcf0ca4ecde05a": "a24f760d228012184591b382255728af",
".git/objects/ce/e20433a895610cf01702e7b9d72fa3a5348063": "c3aeb3b7248c4c7f3672b8d9ec2e95bf",
".git/objects/d3/e5b868263ab50757b45fd10c018235f54da04d": "1eb404d65970f327324606f3918e7005",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/c7918cbbd6a9569b5991ecaacd1c30b4eec438": "c6a6b530b83855a0ffe1d6ebd9772471",
".git/objects/dd/cc8b88237c7a917956b122576f6dc242de9af4": "eca5f83e336e6ba796474e393026db7c",
".git/objects/df/872d9709fb09bb2be00e1b055a1aed83e24eb9": "d01b2090cd3f2a13b196b560caea556a",
".git/objects/df/9fa415b6d4e5691990bdb9cfc09dcd8572cdfc": "43887cd0c7ff80e2f90e9c3bbd3269c5",
".git/objects/e3/e9ee754c75ae07cc3d19f9b8c1e656cc4946a1": "14066365125dcce5aec8eb1454f0d127",
".git/objects/e4/ee250375358a7d5b3be0233f6ccdf236b141ff": "66bc277926fa9e1be6ec2078919b919c",
".git/objects/e5/3d446c197fef1694c385a7df4179070050c0eb": "441157d380118913260a32200a3dff78",
".git/objects/e6/2450a1f2c465ee824ddda3c2c92188128c9cce": "7c11de59fc6b99c62b1c1af596fff0ee",
".git/objects/e6/2ffc78b270de656f9df2a7645d14e194e2b5fe": "cd65989331b249ac8a6942b7cea93a33",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/47207a9ffe98f277178967d652a5e9ed195b7f": "2eb27e93204987be15fb9d6145c80d92",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/f0/051c20522bc5a0a58a42a28050a4279b422ff7": "174abdaee0238220c59eeb2afe15b190",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/c9ebab0d53e1f95e6b4943880321d0dc187ade": "88908e835f3a41103cb8bf0c6848b093",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/72497dd860768cfd15e5ddfc8bf1d8f33cab74": "65a6a210f47395e08258f4e6e914bf7d",
".git/objects/f7/0916c5b1009333d94db40137c9149a5ce299a4": "c690ac2ed442b8cc1641a45904f42943",
".git/objects/fe/3914bcf3baf9d87a873a444cac8aaf9dcd54c1": "372add7dd6cdabc32b9333e8d66bff72",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/objects/fe/ef09b635e13007ef4f68f76f8608bcea16c859": "262aa35037792cc3bec7860142f1acf1",
".git/objects/ff/25b1519fc41fa772f1434427935cef5f752208": "54ef38584bd33f834fc2389014ed2f98",
".git/refs/heads/master": "57b027fa8360f3087c767b74f373967a",
".git/refs/remotes/origin/gh-pages": "57b027fa8360f3087c767b74f373967a",
"assets/AssetManifest.bin": "b35a9cf447c7bc891e35f4342bebe560",
"assets/AssetManifest.bin.json": "f253e0bd0a4206bf76799a1bc7fa4f0d",
"assets/AssetManifest.json": "6f516446f5db74a883640be138630cd9",
"assets/assets/certificates/breakout.png": "487ba2f5d5eff2ad0fb52649bc2e6e28",
"assets/assets/certificates/dart%2520udamey.png": "56c8a2f7abf85853b13fbff3647c781d",
"assets/assets/certificates/desktop.ini": "b70e31516cfc49c8c4c092087461955b",
"assets/assets/certificates/Great%2520learning%2520java.png": "eff941c55e9533772e019f8d1b7ee627",
"assets/assets/certificates/GuviCertification%2520-%2520Python.png": "d2e4532b33d68e91d2b37f49ded8517e",
"assets/assets/certificates/GuviCertification%2520Excel%2520mastering%2520mongodb%2520-.png": "b0842215663043fe0033c102ad49551e",
"assets/assets/certificates/Hackathon.jpeg": "153029d13c5839950d539dfb3537b62c",
"assets/assets/certificates/Introduction%2520to%2520cybersecurity%2520cisco.jpeg": "5d9141d235449105dea6c7f4914ee82d",
"assets/assets/certificates/Introduction%2520to%2520IoT%2520and%2520Digital%2520Cisco.png": "d68cdb1a1f6d9af5139c8a2f27ce77e1",
"assets/assets/certificates/lutter%2520udamey.png": "871a3b94fc19838d3377cbbf3215b090",
"assets/assets/certificates/Mongodb%2520java%2520developer%2520path.png": "030f7b4d2b2feb6aa4f9aae2e1ee1ef1",
"assets/assets/certificates/rest%2520APi%2520hacker%2520rank.png": "482e9921bc3a9fae7206b58574928eb0",
"assets/assets/images/analytics.svg": "d80f355e1a7bcb447f31237faf1ded30",
"assets/assets/images/android-svgrepo-com.svg": "f616d6cba8222526a337473bf056376a",
"assets/assets/images/api_logo.png": "ce0b5923f1c86cdec05517c3a656a490",
"assets/assets/images/code1.jpg": "0fde0e15b14c307031253b4d917e5107",
"assets/assets/images/figma.png": "ec6d1bddc09b18f51ed33babcb72d14a",
"assets/assets/images/firebase_logo.png": "8056769ef520a6e2db63960a8a99433e",
"assets/assets/images/flutter_logo.png": "4262c71228b7aa391e995fe5f1d57795",
"assets/assets/images/header.jpg": "c99c7bfaeda858a75048236e2cb8fac3",
"assets/assets/images/java_logo.png": "74e943d82452f81f6a0bb0b51ac6785d",
"assets/assets/images/logo.png": "babd1e9477e29515c0709b65d63d033c",
"assets/assets/images/man.png": "c22748ab398a23dc72be2144eb29a7ca",
"assets/assets/images/mongodb_logo.png": "529e82c7f69c219af6a3f51883083eef",
"assets/assets/images/pencil-case.svg": "0f1c447697b8be58e054b61fba5f49fa",
"assets/assets/images/postman_logo.png": "19a6fb9f3d456bb9fcab2ed7f8e243cb",
"assets/assets/images/prod.png": "b133ed118486538adb576f7fc33ed95f",
"assets/assets/images/profile.jpg": "74bf4058866c13cba4062c330458f6a4",
"assets/assets/images/responsive.svg": "8f4478a28a56dd1359636ac24af737f2",
"assets/assets/images/review.jpeg": "5f5d8ecc275a90fc33cea7be1c650f4e",
"assets/assets/images/scooter.svg": "60e7da1cd33d368f489d36900d7af77f",
"assets/assets/images/shipped.svg": "38eab17cdae407acd16c2f7482775cdd",
"assets/assets/images/sign%2520language.jpg": "332552dd9f83f3320368df7e1628a8fa",
"assets/assets/images/startup.svg": "f5308f21003552f209df1d3ef266debe",
"assets/assets/images/supabase_logo.png": "0f5eff2b13424820c08c045e2703d240",
"assets/assets/images/toolbox.svg": "6b504b4e84c19eca23ce272865dc8e97",
"assets/assets/images/xml_logo.png": "52f6c842783b0b405b91b83fe58ad566",
"assets/assets/project_preview/beyond_barriers.png": "9f2759cee3a8ad9915fd4233e2489bb6",
"assets/assets/project_preview/meta_dex.png": "6953de196025bbd14943738c07dd4de6",
"assets/assets/project_preview/path_x.png": "8b8d8e891af4f39ec70737fbb6380682",
"assets/assets/project_preview/sign_X.png": "6b7acdf9fa6dcfbc9eb1c5ef922fe113",
"assets/assets/project_preview/streak_mate.png": "fefe2b9ec3eecdd7155a22c2020a40b8",
"assets/assets/resume.pdf": "beffb7772a673864086b3a3289dede9b",
"assets/FontManifest.json": "07da357f1f636a449900bde6f7de338a",
"assets/fonts/MaterialIcons-Regular.otf": "fa6370a3173020b3fd6edf70d5e46d73",
"assets/NOTICES": "6a183f8872ba40c5f0e9914a9b78888b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "ab61f3fd261c47ede2396786657fad7f",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "f54c9f76734f74da2adc53655fbf92aa",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "d0af177ab4f261e9db5593b469bf2781",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/highlight.png": "2aecc31aaa39ad43c978f209962a985c",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/squiggly.png": "68960bf4e16479abb83841e54e1ae6f4",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/strikethrough.png": "72e2d23b4cdd8a9e5e9cadadf0f05a3f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/underline.png": "59886133294dd6587b0beeac054b2ca3",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/highlight.png": "2fbda47037f7c99871891ca5e57e030b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/squiggly.png": "9894ce549037670d25d2c786036b810b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/strikethrough.png": "26f6729eee851adb4b598e3470e73983",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/underline.png": "a98ff6a28215341f764f96d627a5d0f5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "01842f5f36981ea8ed13d49fbe242d01",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fcae2fdd8c779eea712a47a108ece341",
"/": "fcae2fdd8c779eea712a47a108ece341",
"logo.png": "babd1e9477e29515c0709b65d63d033c",
"main.dart.js": "e79cd4a36987446a55d7bc7598a72958",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
