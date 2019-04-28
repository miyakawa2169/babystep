START TRANSACTION;

-- set sequence
SELECT setval('workers_id_seq', 10000);
SELECT setval('clients_id_seq', 10000);
SELECT setval('employees_id_seq', 10000);
SELECT setval('job_categories_id_seq', 10000);
SELECT setval('jobs_id_seq', 10000);
SELECT setval('tags_id_seq', 10000);
SELECT setval('tag_job_idxs_id_seq', 10000);
SELECT setval('worker_likes_id_seq', 10000);
SELECT setval('worker_helps_id_seq', 10000);

delete from tag_job_idxs;
delete from worker_likes;
delete from worker_helps;
delete from employees;
delete from job_details;
delete from tags;
delete from jobs;
delete from clients;
delete from workers;
delete from job_categories;

INSERT INTO workers
(id,last_name,first_name,last_name_ruby,first_name_ruby,age,sex,zip_code,address,phone_number,mail_address,active)
VALUES
(1, '土屋', '良のすけ', 'つちや', 'りょうのすけ', 29, 'male', '1001234','東京都ABC区','09012345678','tuchiya@gmail.com',TRUE);

INSERT INTO clients
(id,name,name_ruby,zip_code,address,phone_number,mail_address,active)
VALUES
(1, '地元の大衆居酒屋', 'じもとのたいしゅういざかや', '1007777', '東京都足立区町はずれ', '09098765432', 'izakaya@gmail.com', TRUE),
(2, 'ガラスの大山', 'がらすのおおやま', '1007777', '東京都江東区', '09011112222', 'garasunoooyama@gmail.com', TRUE);


INSERT INTO employees
(id,client_id,last_name,first_name,last_name_ruby,first_name_ruby,role,representative,active)
VALUES
(1, 1, '宮川', 'ジョン', 'みやかわ', 'じょん','ADMINISTRATOR', TRUE,TRUE),
(2, 2, '宮川', 'ジョン1', 'みやかわ', 'じょん1','ADMINISTRATOR', TRUE,TRUE);

INSERT INTO job_categories
(id,title,active)
VALUES
(1, '飲食', TRUE),
(2, '工芸', TRUE),
(3, '生花', TRUE),
(4, '雑貨', TRUE),
(5, '文具', TRUE);

INSERT INTO jobs
(id,job_category_id,client_id,title,description,desire_date_time,place,active)
VALUES
(1, 1, 1, 'ホールお手伝い', '馴染みの常連さんと飲みながらでいいので、料理を運んだり片付けを手伝ってほしいです', '平日夜18-21時', '本店（住所：XXX）',TRUE),
(2, 1, 1, '秘伝のタレ作り', '当店は昭和30年に創業以来、毎日店主が作り続けてきた秘伝のタレ作りを手伝ってほしいです', '平日朝8-10時', '本店（住所：XXX）',TRUE),
(3, 2, 2, 'ガラス体験教室スタッフ', '毎週土曜に地元の子供たち向けに実施しているガラス体験教室スタッフとして、運営を手伝ってほしいです', '土曜10-15時', '本店（住所：YYY）',TRUE),
(4, 2, 2, '【急募】ガラス屋一日店長', '父が倒れました。つきましては、一日店長をお願いしたいです', '明後日(4/30)', '本店（住所：YYY）',TRUE);

INSERT INTO job_details
(job_id,description,desire_date_time,prerequisite,welcome_condition,gift)
VALUES
(1, '常連さんと飲みながらで構いませんので、次の仕事を手伝ってほしいです。・食事の配膳、片付け、洗い物、テーブルの清掃。・常連さん客とのコミュニケーション', '平日夜18-21時 ※30分前に到着ください。スタッフが説明します', '常連さんとうまくやっていくコミュニケーション力', '皿洗いが得意であること','常連さんから進められたら飲酒OK'),
(2, '店主山本が60年間守り続けた味を一緒に守りませんか？？調味料の種類と調合、熟成方法に至るまで、頑固親父店主が指導します', '平日朝8-10時 ※天候と気温により、仕込み時間が前後する可能性があります', '頑固親父に怒られてもめげない忍耐力', '将来自分のお店出したい方歓迎', NULL),
(3, 'ガラス体験教室（設計・製造・デコレート）の一連の作業をお手伝いしていただきます。地元の江東区焼きの手法で焼き上げた伝統のガラス製作に関われます', '土曜10-15時','子供と接するのが好きな方', NULL, NULL),
(4, '父が倒れました。謝礼は払いますので、ガラス工房の販売を1日お任せできる方を急募してます', '明後日(4/30)','レジ打ちできる方', 'ガラスの知識があれば歓迎', '3万円支給します');

INSERT INTO tags
(id,title,active)
VALUES
(1, 'ホール', TRUE),
(2, '接客', TRUE),
(3, '料理', TRUE),
(4, '伝統', TRUE),
(5, 'イベント運営', TRUE),
(6, '販売', TRUE);

INSERT INTO tag_job_idxs 
(id,tag_id,job_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 4),
(4, 3, 2),
(5, 4, 2),
(6, 4, 3),
(7, 4, 4),
(8, 5, 3),
(9, 6, 4);

COMMIT;
