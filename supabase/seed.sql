-- EduLaluan Seed Data
-- Generated: 2026-03-13T10:56:16.857Z
-- This file contains all education resources migrated from JSON files

-- Clear existing data (in correct order due to foreign keys)
DELETE FROM resource_tags;
DELETE FROM resource_education_levels;
DELETE FROM resource_income_groups;
DELETE FROM resource_languages;
DELETE FROM resources;
DELETE FROM tags;
DELETE FROM providers;

-- Insert categories (already in migration, but included for completeness)
-- Categories: scholarship, mooc, tvet, financial-aid, digital-skills, degree, secondary-education, elite-institutions, community, other

-- Insert Providers
INSERT INTO providers (id, name, is_verified) VALUES ('48aec762-f1d1-4ae8-b3c3-1d7ab29b945b', '42 Network', false);
INSERT INTO providers (id, name, is_verified) VALUES ('5abbe2fe-011a-446a-a4a4-f6b34c9c01ab', 'Aiglon College', false);
INSERT INTO providers (id, name, is_verified) VALUES ('417996bd-1f1a-4de9-9e41-e49ced92fdb4', 'Ministry of Education Malaysia', false);
INSERT INTO providers (id, name, is_verified) VALUES ('ad017887-201f-4eeb-b25f-b5ead81e9261', 'Amazon Web Services', false);
INSERT INTO providers (id, name, is_verified) VALUES ('9ade0d43-0fe4-4465-a37a-50cfc8630b01', 'University of Cambridge', false);
INSERT INTO providers (id, name, is_verified) VALUES ('6b0a7a2d-b4c8-4558-b2b2-538a0c252a37', 'Cheltenham Ladies'' College', false);
INSERT INTO providers (id, name, is_verified) VALUES ('3cfb8a66-6250-4162-be20-068bd30f1f9e', 'CIMB Foundation', false);
INSERT INTO providers (id, name, is_verified) VALUES ('b92a25d4-94fa-4e93-9396-0abd87b2874a', 'Code.org', false);
INSERT INTO providers (id, name, is_verified) VALUES ('40331311-7ce1-47f7-b831-b1e2c41acda0', 'Codecademy', false);
INSERT INTO providers (id, name, is_verified) VALUES ('e3ef9f46-806c-4286-9eeb-b5eadf48d190', 'CodeHS', false);
INSERT INTO providers (id, name, is_verified) VALUES ('ff953cc2-35d0-4e47-8781-d49c4d2a0682', 'Collège du Léman International School', false);
INSERT INTO providers (id, name, is_verified) VALUES ('d605f529-cc90-47d4-ae62-4e0096da724f', 'Columbia University', false);
INSERT INTO providers (id, name, is_verified) VALUES ('fa938e8f-d1f0-4124-a913-8669296c9139', 'Coursera', false);
INSERT INTO providers (id, name, is_verified) VALUES ('aef3ec77-4dec-4ff7-82f9-da406f303aa2', 'Harvard University', false);
INSERT INTO providers (id, name, is_verified) VALUES ('b42dfac0-c197-4c0e-843e-e660f44e5c0d', 'Dartmouth College', false);
INSERT INTO providers (id, name, is_verified) VALUES ('8c50ecc4-225f-4e72-8213-1d10888e3bc4', 'edX', false);
INSERT INTO providers (id, name, is_verified) VALUES ('4bbf4c05-61a5-4a2a-af90-85b1853d796c', 'ETH Zurich - Swiss Federal Institute of Technology', false);
INSERT INTO providers (id, name, is_verified) VALUES ('23c247e3-6989-40f5-af99-40927a972579', 'Eton College', false);
INSERT INTO providers (id, name, is_verified) VALUES ('9b6bd97f-9441-4033-8779-b056d91555ce', 'Ministry of Higher Education Malaysia', false);
INSERT INTO providers (id, name, is_verified) VALUES ('c4e02c80-825a-46e7-995e-a87eb020ecdd', 'freeCodeCamp.org', false);
INSERT INTO providers (id, name, is_verified) VALUES ('e7af191d-c4ca-44c9-bd8c-db9364e6dd0a', 'Giatmara MARA', false);
INSERT INTO providers (id, name, is_verified) VALUES ('e3485a3b-d91b-4355-9c16-d5e7ac36c1d3', 'Google Malaysia', false);
INSERT INTO providers (id, name, is_verified) VALUES ('5dd469bc-c22a-406f-8140-f3d821ffd7bc', 'Gordonstoun School', false);
INSERT INTO providers (id, name, is_verified) VALUES ('34e31f58-879d-49a8-bc87-95ee3807927c', 'Harrow School', false);
INSERT INTO providers (id, name, is_verified) VALUES ('85d90f4a-51b0-4af7-9e84-c9f9040522e7', 'Harvey Mudd College', false);
INSERT INTO providers (id, name, is_verified) VALUES ('e8eaa368-bee0-465b-847a-4f78bd8672c7', 'Imperial College London', false);
INSERT INTO providers (id, name, is_verified) VALUES ('14d620d4-991e-4325-942c-9ca98e8ac93a', 'Institut auf dem Rosenberg', false);
INSERT INTO providers (id, name, is_verified) VALUES ('f9f13aef-ae4a-4b55-89b8-fe5eb7d1702f', 'Johns Hopkins University', false);
INSERT INTO providers (id, name, is_verified) VALUES ('091116fc-1dac-42aa-b9c3-e6b348b0a870', 'Khan Academy', false);
INSERT INTO providers (id, name, is_verified) VALUES ('0cd4b5bb-fb65-4e18-bd57-bffb9450d79b', 'Khazanah Nasional', false);
INSERT INTO providers (id, name, is_verified) VALUES ('5401d60a-b733-4b92-a5d9-7ee50d57a557', 'KrackedDevs Community', false);
INSERT INTO providers (id, name, is_verified) VALUES ('4a5d07e0-443d-44fd-9c56-e0bd19e66f9b', 'The Lawrenceville School', false);
INSERT INTO providers (id, name, is_verified) VALUES ('06760ee6-ae24-47f9-87d6-d3dfd55ab5ba', 'Le Régent International School', false);
INSERT INTO providers (id, name, is_verified) VALUES ('8ca11653-c11e-4040-b7f9-dbc4b8dcc8a4', 'Institut Le Rosey', false);
INSERT INTO providers (id, name, is_verified) VALUES ('ec3a7a6a-2762-4abd-88cc-29913d340e39', 'LinkedIn', false);
INSERT INTO providers (id, name, is_verified) VALUES ('14fa3d4d-c246-4c4b-bbc0-d8a1c350b380', 'London School of Economics and Political Science', false);
INSERT INTO providers (id, name, is_verified) VALUES ('6ccb5b87-1300-4a17-a89b-8bf4e9ccdefc', 'Lyceum Alpinum Zuoz', false);
INSERT INTO providers (id, name, is_verified) VALUES ('491330bf-94a4-467c-aede-403bd89ac886', 'Public Service Department Malaysia', false);
INSERT INTO providers (id, name, is_verified) VALUES ('024cfa6b-bf38-494c-91f2-5fb351f2cca8', 'Majlis Amanah Rakyat', false);
INSERT INTO providers (id, name, is_verified) VALUES ('55ebb694-1e6d-489b-a3a7-a487c2bf8963', 'Mozilla', false);
INSERT INTO providers (id, name, is_verified) VALUES ('2ad24899-d3bd-431e-a807-eb5214a91016', 'Microsoft', false);
INSERT INTO providers (id, name, is_verified) VALUES ('ee85e920-3d7f-42bf-b88c-6902974bc7f6', 'Massachusetts Institute of Technology', false);
INSERT INTO providers (id, name, is_verified) VALUES ('af7dd6ba-bf1b-4d3e-bb2d-eec959cbf82b', 'Major League Hacking', false);
INSERT INTO providers (id, name, is_verified) VALUES ('fd3f181b-3dde-4b60-9d9f-54ea1188be11', 'TalentCorp Malaysia', false);
INSERT INTO providers (id, name, is_verified) VALUES ('13341441-3922-4fd1-b7e7-5ad649312f6b', 'myKasih Foundation', false);
INSERT INTO providers (id, name, is_verified) VALUES ('8f49017c-e176-43f6-83b9-38241815d7fd', 'New York University', false);
INSERT INTO providers (id, name, is_verified) VALUES ('33fb7829-801e-4157-b969-b1861337f236', 'The Odin Project', false);
INSERT INTO providers (id, name, is_verified) VALUES ('4b4380bc-15ad-4819-9cb3-25ff1f6dd1d1', 'OSSU Community', false);
INSERT INTO providers (id, name, is_verified) VALUES ('096b20ce-df69-40cf-b5ed-582d16344f85', 'University of Oxford', false);
INSERT INTO providers (id, name, is_verified) VALUES ('aedfb486-fcfc-4fc1-9f44-f22e2c799c6e', 'Petronas', false);
INSERT INTO providers (id, name, is_verified) VALUES ('48ceee54-efce-49cf-b3fe-b02b86a70e5e', 'Phillips Academy', false);
INSERT INTO providers (id, name, is_verified) VALUES ('1c08165c-baee-4f25-ab9d-a5b03ddd6689', 'Phillips Exeter Academy', false);
INSERT INTO providers (id, name, is_verified) VALUES ('3ad282e7-5588-4b44-a716-2656dafdaec7', 'Kumpulan Wang Pinjaman Pelajaran Kerajaan', false);
INSERT INTO providers (id, name, is_verified) VALUES ('b6960614-cf53-4210-b2b8-5da05692a367', 'Perbadanan Tabung Pendidikan Tinggi Nasional', false);
INSERT INTO providers (id, name, is_verified) VALUES ('ac983dce-2f20-49a7-97a6-b59766f662c9', 'Hadley Wickham & Garrett Grolemund', false);
INSERT INTO providers (id, name, is_verified) VALUES ('228857ea-4178-430d-a16d-fc3d2423e747', 'Scrimba', false);
INSERT INTO providers (id, name, is_verified) VALUES ('57cba752-792a-4ce2-a8af-ee7fe262c563', 'SOLS 24/7', false);
INSERT INTO providers (id, name, is_verified) VALUES ('f81e4072-9c93-4052-a051-3e2ecf42676b', 'Stanford University', false);
INSERT INTO providers (id, name, is_verified) VALUES ('a20a22c5-5f6c-476e-848d-1137a26c45dc', 'TASIS The American School in England', false);
INSERT INTO providers (id, name, is_verified) VALUES ('ad55b4b5-df24-4008-a89a-4d47c5a57608', 'The American School in Switzerland', false);
INSERT INTO providers (id, name, is_verified) VALUES ('0d34064d-4585-4bb1-8d2c-7fc6b99f846d', 'Oz Nova & Myles Byrne', false);
INSERT INTO providers (id, name, is_verified) VALUES ('42dca451-0804-4e3f-b424-db9e9310456f', 'Tenaga Nasional Berhad', false);
INSERT INTO providers (id, name, is_verified) VALUES ('b8e9bbf8-7c33-493d-8922-619d6add1e9c', 'Udemy', false);
INSERT INTO providers (id, name, is_verified) VALUES ('841e274b-98f9-4f48-9e1c-2d781cba7d61', 'University of Chicago', false);
INSERT INTO providers (id, name, is_verified) VALUES ('4f15bce8-6b2d-48de-8ea9-58540e9d4bd1', 'University of Pennsylvania', false);
INSERT INTO providers (id, name, is_verified) VALUES ('eaf3448c-1747-468d-a911-7e33942dc3c0', 'W3Schools', false);
INSERT INTO providers (id, name, is_verified) VALUES ('4739f9a8-ab19-4ec7-b171-e43b6fd224be', 'Yayasan Khind', false);
INSERT INTO providers (id, name, is_verified) VALUES ('028d9e34-a875-4ca9-ab55-ef7c10392b78', 'Yayasan Peneraju Pendidikan Bumiputera', false);

-- Insert Tags
INSERT INTO tags (id, name, slug) VALUES ('f26169b7-4d4d-4689-92df-f5236ee645c2', 'coding', 'coding');
INSERT INTO tags (id, name, slug) VALUES ('5e3d7ea9-aedd-4a4e-af67-58b92957d447', 'peer-learning', 'peer-learning');
INSERT INTO tags (id, name, slug) VALUES ('90017eb4-a344-4bb6-a60f-275edb2ff78f', 'project-based', 'project-based');
INSERT INTO tags (id, name, slug) VALUES ('4fe42165-d94c-455b-a60c-457dbd4c152c', 'tuition-free', 'tuition-free');
INSERT INTO tags (id, name, slug) VALUES ('cecd33b6-ba6b-4ab4-8a41-a78ceff23933', 'boarding-school', 'boarding-school');
INSERT INTO tags (id, name, slug) VALUES ('0d98943a-4d47-434b-b847-5f9422cde685', 'switzerland', 'switzerland');
INSERT INTO tags (id, name, slug) VALUES ('74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4', 'ib-curriculum', 'ib-curriculum');
INSERT INTO tags (id, name, slug) VALUES ('983ededb-a3aa-487a-a73f-e887cabd6cf3', 'alpine', 'alpine');
INSERT INTO tags (id, name, slug) VALUES ('2b1984ad-286b-4f09-b438-aa9a344f80b6', 'outdoor-education', 'outdoor-education');
INSERT INTO tags (id, name, slug) VALUES ('106eae2c-4ebf-4760-91f7-c38cc02eb7cc', 'government', 'government');
INSERT INTO tags (id, name, slug) VALUES ('e714bd4d-0ce2-450d-b88b-bbe7b74d48f1', 'science-school', 'science-school');
INSERT INTO tags (id, name, slug) VALUES ('301d600b-425c-4a5a-afcf-a83d5b5c3ca6', 'stem', 'stem');
INSERT INTO tags (id, name, slug) VALUES ('b0a4c8c6-36fb-4b4d-b6b8-ee991351b616', 'sbp', 'sbp');
INSERT INTO tags (id, name, slug) VALUES ('2290ab8a-b8da-413e-91a3-ce88147cbdb9', 'kuala-lumpur', 'kuala-lumpur');
INSERT INTO tags (id, name, slug) VALUES ('2648da4e-491d-438f-94f1-ef25b6cc1907', 'kedah', 'kedah');
INSERT INTO tags (id, name, slug) VALUES ('dcff9496-fda3-4eb3-8e53-7cc9f2c5e7af', 'cloud', 'cloud');
INSERT INTO tags (id, name, slug) VALUES ('9db8db5d-1097-42a5-9532-6d6adeed8168', 'aws', 'aws');
INSERT INTO tags (id, name, slug) VALUES ('a411bab7-68b3-4084-851c-de838797bca8', 'certifications', 'certifications');
INSERT INTO tags (id, name, slug) VALUES ('d0523523-605b-4acb-8729-1da16eb1bde8', 'tech', 'tech');
INSERT INTO tags (id, name, slug) VALUES ('2ab386ae-bc17-400d-b1f2-2b2c985b7b1c', 'selangor', 'selangor');
INSERT INTO tags (id, name, slug) VALUES ('389bcb5f-5e1f-4284-aff1-5133862c241c', 'integrated-curriculum', 'integrated-curriculum');
INSERT INTO tags (id, name, slug) VALUES ('5e234c1b-253d-4b3d-9f7a-8adc97c344fb', 'terengganu', 'terengganu');
INSERT INTO tags (id, name, slug) VALUES ('988379ee-9847-4ab6-bc26-ab45bf6dea41', 'zon-timur', 'zon-timur');
INSERT INTO tags (id, name, slug) VALUES ('a643424e-f0c7-4a89-b3c6-db6868b68b92', 'university', 'university');
INSERT INTO tags (id, name, slug) VALUES ('cf46a197-8de8-4991-9a5d-991a208e5add', 'uk', 'uk');
INSERT INTO tags (id, name, slug) VALUES ('a060f67e-953d-4a1b-912f-c4fac22aa473', 'historic', 'historic');
INSERT INTO tags (id, name, slug) VALUES ('b55aa445-b5d1-4f02-9e3f-3aa9ca36b1d1', 'prestigious', 'prestigious');
INSERT INTO tags (id, name, slug) VALUES ('cddc88fe-32d9-431f-b916-1f510a0a5f5b', 'oxbridge', 'oxbridge');
INSERT INTO tags (id, name, slug) VALUES ('035af851-81dd-4b35-aba2-0f92497638b2', 'nobel-laureates', 'nobel-laureates');
INSERT INTO tags (id, name, slug) VALUES ('a3ecdefa-1996-4679-9013-9cae23da3ccc', 'girls-school', 'girls-school');
INSERT INTO tags (id, name, slug) VALUES ('fd2b9a04-479e-4fea-b630-9e2b99240a89', 'premier', 'premier');
INSERT INTO tags (id, name, slug) VALUES ('7eed99f9-e972-40da-b0fe-5cd41320cb7d', 'scholarship', 'scholarship');
INSERT INTO tags (id, name, slug) VALUES ('32a1b140-3913-4ec9-9a7d-41bdd881e5db', 'asean', 'asean');
INSERT INTO tags (id, name, slug) VALUES ('5034adc8-67a8-40e8-82ec-7eacd0084eba', 'undergraduate', 'undergraduate');
INSERT INTO tags (id, name, slug) VALUES ('87cf6765-f074-4356-8082-8871788112bd', 'banking', 'banking');
INSERT INTO tags (id, name, slug) VALUES ('d4d30c02-7041-4b30-ad4f-56b70cd55aaf', 'computer-science', 'computer-science');
INSERT INTO tags (id, name, slug) VALUES ('c506714c-a846-402a-9453-979a035bc158', 'programming', 'programming');
INSERT INTO tags (id, name, slug) VALUES ('1f588112-14d7-4d60-86fa-64eff14b79fc', 'beginner-friendly', 'beginner-friendly');
INSERT INTO tags (id, name, slug) VALUES ('8a6de863-2d86-4f4c-aef3-833c09eecd9e', 'k12', 'k12');
INSERT INTO tags (id, name, slug) VALUES ('4375ef2a-b85b-4672-8ecd-f5d25957ba72', 'free', 'free');
INSERT INTO tags (id, name, slug) VALUES ('2ab9c17b-01cf-4d41-abd6-2caa9f3bf043', 'hour-of-code', 'hour-of-code');
INSERT INTO tags (id, name, slug) VALUES ('d50c14b4-aa89-4558-949b-f720616fefce', 'interactive', 'interactive');
INSERT INTO tags (id, name, slug) VALUES ('94cf0221-2c58-49a8-9ab0-61e94c4ecd32', 'lessons', 'lessons');
INSERT INTO tags (id, name, slug) VALUES ('dc985f9e-41f6-4499-a008-f3c7ab7de314', 'bilingual', 'bilingual');
INSERT INTO tags (id, name, slug) VALUES ('f8464126-e2dd-4d26-afb8-006bb9c2a683', 'geneva', 'geneva');
INSERT INTO tags (id, name, slug) VALUES ('dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2', 'usa', 'usa');
INSERT INTO tags (id, name, slug) VALUES ('902be6ab-3b69-4a15-8863-d5caab3190d8', 'ivy-league', 'ivy-league');
INSERT INTO tags (id, name, slug) VALUES ('49086635-1b04-4d38-a02e-e5e3e62f77c5', 'new-york', 'new-york');
INSERT INTO tags (id, name, slug) VALUES ('bf9cad32-5a54-4748-a824-91efbdb05250', 'liberal-arts', 'liberal-arts');
INSERT INTO tags (id, name, slug) VALUES ('518b6db4-9ec4-421c-b2c7-5e52ac132f91', 'research', 'research');
INSERT INTO tags (id, name, slug) VALUES ('771f976b-a4f7-4e0d-b674-dac659bac222', 'mooc', 'mooc');
INSERT INTO tags (id, name, slug) VALUES ('5362e8d2-e187-4ffb-a9f4-26d6fe381b80', 'universities', 'universities');
INSERT INTO tags (id, name, slug) VALUES ('edd375b9-75cc-42e2-9cc9-8d550c653a07', 'courses', 'courses');
INSERT INTO tags (id, name, slug) VALUES ('21cd0c74-c7c6-40f2-a435-044aa52c4614', 'audit', 'audit');
INSERT INTO tags (id, name, slug) VALUES ('1d322339-fee3-4253-9002-8234ae9f45ff', 'harvard', 'harvard');
INSERT INTO tags (id, name, slug) VALUES ('eb8958a9-f810-4ac6-82bb-78fae8dbbdcd', 'new-england', 'new-england');
INSERT INTO tags (id, name, slug) VALUES ('d87e3036-d212-4f9b-b7c0-9dad4e25ecd3', 'engineering', 'engineering');
INSERT INTO tags (id, name, slug) VALUES ('be57e3a6-a1ab-43f4-bf60-51616350cff3', 'royalty', 'royalty');
INSERT INTO tags (id, name, slug) VALUES ('69661814-6f02-4137-94f2-70ce7f5cdc47', 'boys-school', 'boys-school');
INSERT INTO tags (id, name, slug) VALUES ('fffce20f-d2d5-46a7-968e-0fcab5f5b588', 'elite', 'elite');
INSERT INTO tags (id, name, slug) VALUES ('c1cf9119-2a8b-4b62-bb45-55a1b3831b3f', 'b40', 'b40');
INSERT INTO tags (id, name, slug) VALUES ('4b38ac62-dfcf-48cc-a0f9-0371c26dfe45', 'public-universities', 'public-universities');
INSERT INTO tags (id, name, slug) VALUES ('0ef7c4e4-d0d9-487a-953d-e252dc643f90', 'bootcamp', 'bootcamp');
INSERT INTO tags (id, name, slug) VALUES ('07b14005-2d05-4845-8ef5-db7a9a126292', 'web-development', 'web-development');
INSERT INTO tags (id, name, slug) VALUES ('7eb21c6b-fd17-4193-8792-da27c2681065', 'vocational', 'vocational');
INSERT INTO tags (id, name, slug) VALUES ('aa8dfaa8-7910-4851-ab96-d1c144fda6a5', 'technical', 'technical');
INSERT INTO tags (id, name, slug) VALUES ('9fd18beb-2593-422a-a439-65c524dfc968', 'youth', 'youth');
INSERT INTO tags (id, name, slug) VALUES ('84edea9b-7108-4a36-89c9-f30db5bcc3fc', 'mara', 'mara');
INSERT INTO tags (id, name, slug) VALUES ('cbcec774-41e9-4090-a9e6-a0f25636e4cc', 'google', 'google');
INSERT INTO tags (id, name, slug) VALUES ('f7fa99d8-c7d0-46d6-b1fc-daae02589fff', 'digital-skills', 'digital-skills');
INSERT INTO tags (id, name, slug) VALUES ('510538ae-6f30-4561-8877-1e001255db22', 'employability', 'employability');
INSERT INTO tags (id, name, slug) VALUES ('9a480f11-e2d8-4002-900e-7a54347ca74d', 'scotland', 'scotland');
INSERT INTO tags (id, name, slug) VALUES ('459659e3-6f42-4e5c-82b7-c36ae26504ce', 'kelantan', 'kelantan');
INSERT INTO tags (id, name, slug) VALUES ('ad8083ca-2cc0-41ee-b9a0-78496f6fd570', 'london', 'london');
INSERT INTO tags (id, name, slug) VALUES ('22d012b0-6d32-4e9b-80fb-fc1928a6b04f', 'perak', 'perak');
INSERT INTO tags (id, name, slug) VALUES ('97496881-6052-45ce-a983-6d39d4140e03', 'medicine', 'medicine');
INSERT INTO tags (id, name, slug) VALUES ('fdf04f88-f7b8-4a3f-982e-0311fd55b928', 'pahang', 'pahang');
INSERT INTO tags (id, name, slug) VALUES ('1983abad-8b6e-460d-a93f-73c3603b2d2d', 'luxury', 'luxury');
INSERT INTO tags (id, name, slug) VALUES ('d102ec3e-4ab9-4c11-a4df-8e564352511c', 'entrepreneurship', 'entrepreneurship');
INSERT INTO tags (id, name, slug) VALUES ('83466eed-22f2-4007-bfe1-ea8cbd2e088a', 'top-ranked', 'top-ranked');
INSERT INTO tags (id, name, slug) VALUES ('52b86312-c515-40ea-bfb9-b9156cafa200', 'islamic', 'islamic');
INSERT INTO tags (id, name, slug) VALUES ('868b05e5-58b4-41ef-ace2-46ab65428aee', 'gps-093', 'gps-093');
INSERT INTO tags (id, name, slug) VALUES ('fe467450-a6fa-4016-adf5-4a770a197d3a', 'islamic-education', 'islamic-education');
INSERT INTO tags (id, name, slug) VALUES ('4d342282-39e1-4640-aae3-aaf587a9e97b', 'negeri-sembilan', 'negeri-sembilan');
INSERT INTO tags (id, name, slug) VALUES ('6f949d9f-568d-4ea4-a904-96f6c92f873d', 'johor', 'johor');
INSERT INTO tags (id, name, slug) VALUES ('68e16cf4-7415-4cb2-b92d-679d40597a55', 'biomedical', 'biomedical');
INSERT INTO tags (id, name, slug) VALUES ('feb7175f-0449-4825-b649-d2ba4e2aa8c3', 'education', 'education');
INSERT INTO tags (id, name, slug) VALUES ('374926c1-142b-4c58-8f87-7804ee9aa311', 'math', 'math');
INSERT INTO tags (id, name, slug) VALUES ('1d174ec1-975c-40a4-bfbe-df70b7d9187f', 'science', 'science');
INSERT INTO tags (id, name, slug) VALUES ('af0bdeaf-730d-4b81-8da2-a9bc9933cb31', 'postgraduate', 'postgraduate');
INSERT INTO tags (id, name, slug) VALUES ('698f7507-9e94-4225-9929-3a1d577cde3a', 'corporate', 'corporate');
INSERT INTO tags (id, name, slug) VALUES ('66d27815-be82-4712-892d-3dbd0a7a6f3b', 'leadership', 'leadership');
INSERT INTO tags (id, name, slug) VALUES ('2dbbad61-9062-4fcc-a29b-ad9b4e51be45', 'community', 'community');
INSERT INTO tags (id, name, slug) VALUES ('41c06242-5b96-4d95-b8e3-27f84ab2ed96', 'developers', 'developers');
INSERT INTO tags (id, name, slug) VALUES ('c1012cca-491f-4c4c-9a53-ffcf4f9e6d06', 'selective', 'selective');
INSERT INTO tags (id, name, slug) VALUES ('b296bda2-3c80-4aef-ad6c-0e1aa9a705d0', 'prep-school', 'prep-school');
INSERT INTO tags (id, name, slug) VALUES ('7d8ed546-f827-42d9-b775-70c47fb81be5', 'house-system', 'house-system');
INSERT INTO tags (id, name, slug) VALUES ('0bd90d4a-f22e-4839-a6b0-71abef98db9b', 'financial-aid', 'financial-aid');
INSERT INTO tags (id, name, slug) VALUES ('00577207-ddda-4f75-a2b1-9d49e293a6ff', 'small-class', 'small-class');
INSERT INTO tags (id, name, slug) VALUES ('d77bbf8b-bca1-4431-abf0-10003e97956d', 'professional', 'professional');
INSERT INTO tags (id, name, slug) VALUES ('821de224-e76b-49d8-a61b-3ea6e37a26fd', 'skills', 'skills');
INSERT INTO tags (id, name, slug) VALUES ('1bed5564-61ef-4852-94cb-df558aa1232c', 'career', 'career');
INSERT INTO tags (id, name, slug) VALUES ('920bda5b-000e-4064-a9ee-488ec8721452', 'business', 'business');
INSERT INTO tags (id, name, slug) VALUES ('fc00e5de-4f51-4dd0-945d-d9b4d388275b', 'economics', 'economics');
INSERT INTO tags (id, name, slug) VALUES ('14885f3d-3120-4b30-baad-8d216b10827b', 'social-sciences', 'social-sciences');
INSERT INTO tags (id, name, slug) VALUES ('87b63e75-8481-4c3a-ba72-5269f2f33800', 'politics', 'politics');
INSERT INTO tags (id, name, slug) VALUES ('8b33fa27-17c4-411d-b730-666e82f23e9d', 'traditional', 'traditional');
INSERT INTO tags (id, name, slug) VALUES ('67f65a20-446a-4934-9112-0b7bb3ec0fa9', 'jpa', 'jpa');
INSERT INTO tags (id, name, slug) VALUES ('4e9ac02d-ab57-4ce1-9991-2ffc8c326db7', 'overseas', 'overseas');
INSERT INTO tags (id, name, slug) VALUES ('4fec24bb-abec-466d-b05d-fbc620a15889', 'malaysian-universities', 'malaysian-universities');
INSERT INTO tags (id, name, slug) VALUES ('388c3b8e-8d57-424e-8fb5-90e75731db07', 'bumiputera', 'bumiputera');
INSERT INTO tags (id, name, slug) VALUES ('6919d829-41fa-4319-9e74-e74c8076789b', 'local', 'local');
INSERT INTO tags (id, name, slug) VALUES ('cc4fc119-17b0-4eb8-93ad-ce92877e9e25', 'documentation', 'documentation');
INSERT INTO tags (id, name, slug) VALUES ('1a823b92-fe47-4679-8bbb-c0e6b9e669b1', 'mozilla', 'mozilla');
INSERT INTO tags (id, name, slug) VALUES ('7d4baf95-8d52-455f-b102-bfb76001086b', 'reference', 'reference');
INSERT INTO tags (id, name, slug) VALUES ('f0786c0c-6a21-4016-8e6c-0fd47873dca7', 'microsoft', 'microsoft');
INSERT INTO tags (id, name, slug) VALUES ('64eb96c5-db10-4c7d-a059-d1c22f4d8d5b', 'azure', 'azure');
INSERT INTO tags (id, name, slug) VALUES ('08d5d5f0-2c29-408e-a698-086375b07b10', 'mit', 'mit');
INSERT INTO tags (id, name, slug) VALUES ('f1818b33-1138-4b0c-bdcb-8739f1eca321', 'hackathon', 'hackathon');
INSERT INTO tags (id, name, slug) VALUES ('f0c8fa59-2f99-44ca-a406-d127e7ff0033', 'students', 'students');
INSERT INTO tags (id, name, slug) VALUES ('e1fb11cb-d0d2-416f-ba7a-3f90d9c19f4e', 'melaka', 'melaka');
INSERT INTO tags (id, name, slug) VALUES ('0ef65ebd-b439-434e-b10e-967097b94993', 'jobs', 'jobs');
INSERT INTO tags (id, name, slug) VALUES ('6f8ba33a-5b95-45f5-af2f-e159936da70d', 'training', 'training');
INSERT INTO tags (id, name, slug) VALUES ('f4c03ce1-c7cc-4efb-90d7-571ced8a768a', 'ngo', 'ngo');
INSERT INTO tags (id, name, slug) VALUES ('f72f260a-67b7-4c11-9239-b03bcd7d38a7', 'assistance', 'assistance');
INSERT INTO tags (id, name, slug) VALUES ('dcaa5e44-ac02-4e2a-b262-64f3b5865807', 'food-aid', 'food-aid');
INSERT INTO tags (id, name, slug) VALUES ('0d891926-1616-4e06-8ad5-6d17dd47c097', 'urban', 'urban');
INSERT INTO tags (id, name, slug) VALUES ('8b0e9f7e-f4b7-4939-a63d-f548d3d1ba35', 'arts', 'arts');
INSERT INTO tags (id, name, slug) VALUES ('2172ad01-b39d-44e6-9e25-7686b1ff7613', 'international', 'international');
INSERT INTO tags (id, name, slug) VALUES ('64f573ac-eca3-4c09-b5d9-e8e12a55371d', 'full-stack', 'full-stack');
INSERT INTO tags (id, name, slug) VALUES ('d3e87f96-d2a8-4e2a-80fd-3adc59173861', 'curriculum', 'curriculum');
INSERT INTO tags (id, name, slug) VALUES ('b1e67fe2-d2e3-4307-ab2d-8bc57c2043b5', 'self-paced', 'self-paced');
INSERT INTO tags (id, name, slug) VALUES ('a2acf51b-0dc8-41a9-8ec3-d8864b16269e', 'tutorial-system', 'tutorial-system');
INSERT INTO tags (id, name, slug) VALUES ('2b385c54-8852-43f2-8848-bb6f26fb7e2e', 'harkness-method', 'harkness-method');
INSERT INTO tags (id, name, slug) VALUES ('81732784-de78-493b-9e1c-7d28cb0f182d', 'diploma', 'diploma');
INSERT INTO tags (id, name, slug) VALUES ('30bad845-7553-4e17-88be-3f70f0e0f8a6', 'degree', 'degree');
INSERT INTO tags (id, name, slug) VALUES ('e56b7049-1575-451e-b545-0e8e356a8233', 'loan', 'loan');
INSERT INTO tags (id, name, slug) VALUES ('706ad109-dcd8-4fdb-917c-e37f4bc6c83b', 'tertiary', 'tertiary');
INSERT INTO tags (id, name, slug) VALUES ('40aa1101-b5a3-4c68-b0d7-b92f78b78f0b', 'data-science', 'data-science');
INSERT INTO tags (id, name, slug) VALUES ('f6738209-c5a3-4dd0-aa0e-34a5f0fd4c24', 'r-programming', 'r-programming');
INSERT INTO tags (id, name, slug) VALUES ('95723606-c922-4889-a8a2-007e669f423c', 'visualization', 'visualization');
INSERT INTO tags (id, name, slug) VALUES ('20d94cae-c8d9-46ff-9e94-b4418f3c0a13', 'book', 'book');
INSERT INTO tags (id, name, slug) VALUES ('b9c83235-be23-49f0-8f56-75f1911b97f3', 'sarawak', 'sarawak');
INSERT INTO tags (id, name, slug) VALUES ('999da399-782f-4427-97fd-4e8ef77b4aeb', 'east-malaysia', 'east-malaysia');
INSERT INTO tags (id, name, slug) VALUES ('69ffb3ae-86b1-41a5-b797-dccd5ab0bfca', 'pulau-pinang', 'pulau-pinang');
INSERT INTO tags (id, name, slug) VALUES ('ab972bd4-5450-4f06-b531-a75e71f251ab', 'putrajaya', 'putrajaya');
INSERT INTO tags (id, name, slug) VALUES ('318ca6ed-6b04-4fab-8f46-4f15e4f5cd46', 'gps-117', 'gps-117');
INSERT INTO tags (id, name, slug) VALUES ('d304fc23-4004-467a-9bd2-8c3b68df1b41', 'gps-116', 'gps-116');
INSERT INTO tags (id, name, slug) VALUES ('b104a5d6-5044-46e6-b1f8-8d4bc9464f77', 'screencasts', 'screencasts');
INSERT INTO tags (id, name, slug) VALUES ('b739343e-a4d9-406c-837e-35fe4b5e5ef5', 'practice', 'practice');
INSERT INTO tags (id, name, slug) VALUES ('c560e3fd-abd1-40df-b3c8-1eaa3137b131', 'sabah', 'sabah');
INSERT INTO tags (id, name, slug) VALUES ('bd0a618c-e66d-428c-9a22-984debd9cc5a', 'labuan', 'labuan');
INSERT INTO tags (id, name, slug) VALUES ('6033a862-9fa2-4529-80eb-db0247d02392', 'free-education', 'free-education');
INSERT INTO tags (id, name, slug) VALUES ('0e395b9f-c37e-4b65-9b45-22840242495e', 'technology', 'technology');
INSERT INTO tags (id, name, slug) VALUES ('577475cb-6dcc-4b50-9586-36da0eed01a4', 'silicon-valley', 'silicon-valley');
INSERT INTO tags (id, name, slug) VALUES ('1713db3e-fe0d-4824-ba1d-474313b453c6', 'gps-104', 'gps-104');
INSERT INTO tags (id, name, slug) VALUES ('e6361bb1-7547-4ada-acaa-bb92ea36d47a', 'perlis', 'perlis');
INSERT INTO tags (id, name, slug) VALUES ('adaf1d62-7905-4b22-98d6-d81fed236c15', 'american', 'american');
INSERT INTO tags (id, name, slug) VALUES ('d38006d2-5311-4456-9d2e-f0de88153ec7', 'self-study', 'self-study');
INSERT INTO tags (id, name, slug) VALUES ('c89902d0-fcad-4e7a-9892-4e3cf7298b61', 'fundamentals', 'fundamentals');
INSERT INTO tags (id, name, slug) VALUES ('c41ccd9d-bd3e-41f9-9ec2-bfa2235ecf36', 'resources', 'resources');
INSERT INTO tags (id, name, slug) VALUES ('f8a4d798-d32f-429a-9ca8-74e5e30d150c', 'gps-105', 'gps-105');
INSERT INTO tags (id, name, slug) VALUES ('bf1b5ab7-06d0-49b6-936a-81e7210431db', 'expensive', 'expensive');
INSERT INTO tags (id, name, slug) VALUES ('1339d8ba-96c6-4d34-9cf3-fdeef4244346', 'wharton', 'wharton');
INSERT INTO tags (id, name, slug) VALUES ('3f678772-4f7c-4193-8954-c529bbbc4f8e', 'tutorials', 'tutorials');
INSERT INTO tags (id, name, slug) VALUES ('8b3fc2d9-5a0e-4ec5-a9d3-9abf99b2fb8e', 'html', 'html');
INSERT INTO tags (id, name, slug) VALUES ('3988639b-11e0-4e5c-a4b2-9813dd44ca63', 'css', 'css');
INSERT INTO tags (id, name, slug) VALUES ('acee2463-6167-48d6-a0dd-0a017c9326e2', 'javascript', 'javascript');
INSERT INTO tags (id, name, slug) VALUES ('a2cf9b09-db26-4c48-a68f-1d31bf100ca9', 'foundation', 'foundation');
INSERT INTO tags (id, name, slug) VALUES ('8e70e8ad-c342-4c5e-9770-bce785322dda', 'top-universities', 'top-universities');

-- Insert Resources
-- 42 Penang
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'eb55ad47-e0b3-4317-a305-9cb481c28097',
  '42 Penang',
  '48aec762-f1d1-4ae8-b3c3-1d7ab29b945b',
  '42 Network',
  'Tuition-free peer-to-peer coding school in Penang. No teachers, no classrooms, just project-based learning.',
  'https://42penang.edu.my/',
  true
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = 'eb55ad47-e0b3-4317-a305-9cb481c28097';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'eb55ad47-e0b3-4317-a305-9cb481c28097';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'eb55ad47-e0b3-4317-a305-9cb481c28097';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', 'f26169b7-4d4d-4689-92df-f5236ee645c2'); -- coding
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', '5e3d7ea9-aedd-4a4e-af67-58b92957d447'); -- peer-learning
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', '90017eb4-a344-4bb6-a60f-275edb2ff78f'); -- project-based
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb55ad47-e0b3-4317-a305-9cb481c28097', '4fe42165-d94c-455b-a60c-457dbd4c152c'); -- tuition-free

-- Aiglon College
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'b7d66e1e-c210-41d3-b880-32029cd12bf9',
  'Aiglon College',
  '5abbe2fe-011a-446a-a4a4-f6b34c9c01ab',
  'Aiglon College',
  'Aiglon College is a prestigious international boarding school located in the Swiss Alps at Villars-sur-Ollon, serving students aged 9-18. Founded in 1949, the school combines academic excellence with alpine adventure, offering the IB Diploma and IGCSE programs. Annual fees range from $90,000-$120,000 USD including tuition, boarding, and activities. The school''s unique location at 1,300 meters altitude enables an educational philosophy centered on mountaineering, skiing, and outdoor expeditions as character-building experiences. With approximately 400 students from over 60 nationalities, Aiglon maintains a diverse international community. The school offers need-based financial aid and merit scholarships covering up to 100% of fees for exceptional students. Graduates consistently gain admission to leading universities worldwide including Oxbridge, Ivy League, and top European institutions.',
  'https://www.aiglon.ch',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'b7d66e1e-c210-41d3-b880-32029cd12bf9';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'b7d66e1e-c210-41d3-b880-32029cd12bf9';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'b7d66e1e-c210-41d3-b880-32029cd12bf9';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', '983ededb-a3aa-487a-a73f-e887cabd6cf3'); -- alpine
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b7d66e1e-c210-41d3-b880-32029cd12bf9', '2b1984ad-286b-4f09-b438-aa9a344f80b6'); -- outdoor-education

-- Sekolah Menengah Sains Alam Shah (ASiS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '29d08305-a05e-45ad-8a84-d64069e67c03',
  'Sekolah Menengah Sains Alam Shah (ASiS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Alam Shah (ASiS) in Cheras, Kuala Lumpur, is a renowned science boarding school established in 2000. ASiS specializes in STEM education, offering Form 1-5 education with strong emphasis on science, technology, engineering, and mathematics. Named after Sultan Alam Shah of Selangor, the school has built an excellent reputation for academic achievement and university placement success. As a government Sekolah Berasrama Penuh, fees are highly subsidized, making specialized science education accessible to talented students from B40 and M40 families. Located in the capital city, ASiS students benefit from proximity to universities, research institutions, and science museums for educational enrichment. The school features advanced science laboratories (physics, chemistry, biology), ICT facilities, mathematics resource centers, library, sports complex, and modern dormitories. ASiS''s curriculum emphasizes hands-on science experiments, research methodology, problem-solving, and critical thinking. Students participate in national science competitions and research fairs. The boarding environment promotes collaborative learning, peer tutoring, and development of independence. Experienced science teachers with strong academic backgrounds provide mentorship and guidance. Admission is highly competitive, prioritizing students with strong aptitude in science and mathematics, based on primary school results (formerly UPSR), co-curricular achievements, and interviews. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). ASiS graduates consistently gain admission to competitive medicine, engineering, and science programs at top universities.',
  'https://www.asis.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '29d08305-a05e-45ad-8a84-d64069e67c03';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '29d08305-a05e-45ad-8a84-d64069e67c03';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '29d08305-a05e-45ad-8a84-d64069e67c03';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('29d08305-a05e-45ad-8a84-d64069e67c03', '2290ab8a-b8da-413e-91a3-ce88147cbdb9'); -- kuala-lumpur

-- Akademi Sains Pendang (ASP)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9',
  'Akademi Sains Pendang (ASP)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Akademi Sains Pendang in Pendang, Kedah is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, ASP provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education with an academy approach, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, research projects, innovation competitions, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. ASP emphasizes scientific research methodology and independent investigation, preparing students for higher education and research careers. The school encourages participation in national science fairs and competitions to develop innovation and presentation skills. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). ASP graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://www.facebook.com/asp.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c29deeb-a9b9-4d38-b1d0-5df457ee1ea9', '2648da4e-491d-438f-94f1-ef25b6cc1907'); -- kedah

-- AWS Skill Builder
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '1e9461b7-ea9f-4247-be22-9beb30058646',
  'AWS Skill Builder',
  'ad017887-201f-4eeb-b25f-b5ead81e9261',
  'Amazon Web Services',
  'Free cloud computing courses and certifications from AWS.',
  'https://skillbuilder.aws/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '1e9461b7-ea9f-4247-be22-9beb30058646';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '1e9461b7-ea9f-4247-be22-9beb30058646';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '1e9461b7-ea9f-4247-be22-9beb30058646';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', 'dcff9496-fda3-4eb3-8e53-7cc9f2c5e7af'); -- cloud
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', '9db8db5d-1097-42a5-9532-6d6adeed8168'); -- aws
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', 'a411bab7-68b3-4084-851c-de838797bca8'); -- certifications
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1e9461b7-ea9f-4247-be22-9beb30058646', 'd0523523-605b-4acb-8729-1da16eb1bde8'); -- tech

-- Sekolah Menengah Sains Banting (BASiS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e',
  'Sekolah Menengah Sains Banting (BASiS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Banting (BASiS) in Banting, Selangor is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification with specialized focus on science and STEM education. As a fully residential science school, BASiS provides comprehensive boarding facilities and structured environment promoting academic excellence, scientific inquiry, and innovation. The school is highly subsidized by the Malaysian government, with minimal fees making quality science boarding education accessible to B40 and M40 families. BASiS specializes in developing future scientists, engineers, and STEM professionals through intensive science and mathematics curriculum emphasizing hands-on laboratory work, scientific research, problem-solving, and critical thinking. The school maintains well-equipped science laboratories, computer facilities, and research resources enabling students to conduct experiments and develop practical scientific skills. Advanced courses in Physics, Chemistry, Biology, Mathematics, and Additional Mathematics prepare students for STEM careers and university programs. The curriculum integrates theoretical knowledge with practical applications, encouraging innovation, creativity, and scientific reasoning. Students benefit from experienced science teachers, modern facilities, and extensive co-curricular programs including science clubs, robotics, coding, mathematics competitions, and research projects. Participation in national and international science competitions and olympiads provides students opportunities to showcase their talents and compete at high levels. The boarding system instills discipline, time management, and collaborative skills essential for future success in scientific fields. BASiS''s STEM-focused environment cultivates curiosity, analytical thinking, and passion for science. Admission is highly competitive, prioritizing students with strong aptitude and interest in science and mathematics, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). BASiS graduates consistently gain admission to top Form 6 science programs, matriculation, A-Levels, and foundation courses, with many proceeding to prestigious Malaysian public universities in STEM fields including engineering, medicine, pharmacy, and pure sciences.',
  'https://basis.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('61e3ef0e-1d97-47bc-9f96-d7bfaf402e1e', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school

-- Sekolah Berasrama Penuh Integrasi Batu Rakit (BRaInS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'df87c113-2aa0-4a25-8cb6-6ec6dd9b784b',
  'Sekolah Berasrama Penuh Integrasi Batu Rakit (BRaInS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Batu Rakit, popularly known as BRaInS, is a distinguished integrated residential school located in Batu Rakit, Kuala Nerus, Terengganu. As part of Malaysia''s elite Integrasi school network, BRaInS delivers comprehensive education that balances academic excellence with character development through an innovative integrated curriculum. The school serves Forms 1-5 students (ages 13-17) leading to SPM certification, offering both science and arts streams with a holistic approach that integrates Islamic values, critical thinking, and leadership development into mainstream education. BRaInS emphasizes producing well-rounded students who excel academically while possessing strong moral character, ethical grounding, and social responsibility. The school features modern educational facilities including well-equipped classrooms, advanced laboratories, computer centers, extensive library resources, sports complexes, and comfortable boarding accommodations. Students participate in diverse co-curricular activities spanning academic clubs, sports teams, cultural programs, uniformed bodies, and community service projects, fostering comprehensive personal development. The integrated curriculum ensures students develop not only subject mastery but also critical thinking skills, emotional intelligence, and leadership qualities. The boarding environment promotes discipline, independence, teamwork, and lasting friendships while maintaining high academic standards. As a government SBP, BRaInS is highly subsidized with minimal fees, making quality integrated education accessible to deserving students from B40 and M40 families throughout Terengganu and beyond. Admission is selective based on academic performance, aptitude assessments, and personal interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). BRaInS graduates are recognized for their balanced excellence in academics and character, successfully pursuing higher education in various fields and becoming responsible leaders in their communities and professions.',
  'https://brains.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'df87c113-2aa0-4a25-8cb6-6ec6dd9b784b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'df87c113-2aa0-4a25-8cb6-6ec6dd9b784b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'df87c113-2aa0-4a25-8cb6-6ec6dd9b784b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', '5e234c1b-253d-4b3d-9f7a-8adc97c344fb'); -- terengganu
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('df87c113-2aa0-4a25-8cb6-6ec6dd9b784b', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur

-- University of Cambridge
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '14a63f23-bdb6-4872-998d-a69096907059',
  'University of Cambridge',
  '9ade0d43-0fe4-4465-a37a-50cfc8630b01',
  'University of Cambridge',
  'The University of Cambridge, founded in 1209, is one of the world''s oldest and most prestigious universities, consistently ranking in the global top 5. For international students, annual costs range from $45,000-$80,000 USD depending on program, including tuition (£25,734 for arts, £38,352 for sciences, up to £67,194 for medicine), college fees, accommodation, and living expenses. Cambridge offers substantial financial aid through the Cambridge Bursary Scheme and college-specific awards, with many Malaysian students receiving support through Cambridge-Malaysia scholarships and government sponsorships. The collegiate system divides approximately 24,000 students (12,000 undergraduates) across 31 colleges, each providing independent living and learning communities. Cambridge''s supervision system offers personalized small-group teaching with leading academics. The university has produced 121 Nobel laureates—more than any other institution. Excellence spans all disciplines including mathematics, sciences, engineering, humanities, and social sciences. Acceptance rates for international students vary by course but typically range 10-20%. Malaysian students have significant historical presence, including prominent political and business leaders. The historic city provides inspiring architecture, libraries, and museums. Graduates achieve outstanding career outcomes worldwide.',
  'https://www.cam.ac.uk',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '14a63f23-bdb6-4872-998d-a69096907059';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '14a63f23-bdb6-4872-998d-a69096907059';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '14a63f23-bdb6-4872-998d-a69096907059';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', 'b55aa445-b5d1-4f02-9e3f-3aa9ca36b1d1'); -- prestigious
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', 'cddc88fe-32d9-431f-b916-1f510a0a5f5b'); -- oxbridge
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('14a63f23-bdb6-4872-998d-a69096907059', '035af851-81dd-4b35-aba2-0f92497638b2'); -- nobel-laureates

-- Cheltenham Ladies' College
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '52ab6651-b6c0-4e5e-9816-7be538d2cdf2',
  'Cheltenham Ladies'' College',
  '6b0a7a2d-b4c8-4558-b2b2-538a0c252a37',
  'Cheltenham Ladies'' College',
  'Cheltenham Ladies'' College is one of the UK''s leading independent boarding and day schools for girls, founded in 1853. Located in the spa town of Cheltenham, the school serves girls aged 11-18 and has a reputation for academic excellence and empowering young women. Annual boarding fees range from $50,000-$60,000 USD. The college offers A-Levels and IB Diploma, consistently achieving outstanding results with graduates progressing to Oxford, Cambridge, Imperial, and top international universities. The school provides substantial bursaries and scholarships, with over £2.5 million awarded annually based on financial need and merit. With approximately 850 students including 450 boarders from over 40 countries, CLC maintains a diverse international community. The college emphasizes STEM education, with exceptional science and mathematics programs, while also maintaining strong arts, humanities, and sports offerings. Notable alumnae include scientists, politicians, artists, and business leaders. The school''s modern facilities include state-of-the-art laboratories, performance spaces, and sports centers.',
  'https://www.cheltladiescollege.org',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '52ab6651-b6c0-4e5e-9816-7be538d2cdf2';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '52ab6651-b6c0-4e5e-9816-7be538d2cdf2';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '52ab6651-b6c0-4e5e-9816-7be538d2cdf2';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', 'a3ecdefa-1996-4679-9013-9cae23da3ccc'); -- girls-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', 'fd2b9a04-479e-4fea-b630-9e2b99240a89'); -- premier
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('52ab6651-b6c0-4e5e-9816-7be538d2cdf2', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum

-- CIMB Foundation Scholarship
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '72e57f03-7cec-4c30-863f-4e98f53eea3f',
  'CIMB Foundation Scholarship',
  '3cfb8a66-6250-4162-be20-068bd30f1f9e',
  'CIMB Foundation',
  'Scholarship for ASEAN students pursuing undergraduate studies.',
  'https://www.cimbfoundation.com/',
  false
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = '72e57f03-7cec-4c30-863f-4e98f53eea3f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '72e57f03-7cec-4c30-863f-4e98f53eea3f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '72e57f03-7cec-4c30-863f-4e98f53eea3f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', '32a1b140-3913-4ec9-9a7d-41bdd881e5db'); -- asean
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', '5034adc8-67a8-40e8-82ec-7eacd0084eba'); -- undergraduate
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('72e57f03-7cec-4c30-863f-4e98f53eea3f', '87cf6765-f074-4356-8082-8871788112bd'); -- banking

-- Code.org
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '62c382d9-6e89-4793-9d55-bd9a86fd241e',
  'Code.org',
  'b92a25d4-94fa-4e93-9396-0abd87b2874a',
  'Code.org',
  'Non-profit organization providing free computer science education for students of all ages. Offers interactive coding courses from basic block-based programming to advanced JavaScript and Python. Features the popular ''Hour of Code'' initiative with one-hour tutorials on various topics. Includes comprehensive K-12 CS curriculum, professional development for teachers, and resources in 70+ languages. All courses are completely free with no ads. Perfect for beginners starting their coding journey or students building foundational programming skills. Courses cover game development, web design, app creation, and core CS concepts. Trusted by millions of students worldwide and integrated into schools across 180+ countries. Certificates available upon course completion. Self-paced learning with video tutorials, interactive exercises, and projects.',
  'https://code.org/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '62c382d9-6e89-4793-9d55-bd9a86fd241e';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '62c382d9-6e89-4793-9d55-bd9a86fd241e';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '62c382d9-6e89-4793-9d55-bd9a86fd241e';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', (SELECT id FROM education_levels WHERE slug = 'primary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', 'f26169b7-4d4d-4689-92df-f5236ee645c2'); -- coding
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', 'd4d30c02-7041-4b30-ad4f-56b70cd55aaf'); -- computer-science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', 'c506714c-a846-402a-9453-979a035bc158'); -- programming
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', '1f588112-14d7-4d60-86fa-64eff14b79fc'); -- beginner-friendly
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', '8a6de863-2d86-4f4c-aef3-833c09eecd9e'); -- k12
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', '4375ef2a-b85b-4672-8ecd-f5d25957ba72'); -- free
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('62c382d9-6e89-4793-9d55-bd9a86fd241e', '2ab9c17b-01cf-4d41-abd6-2caa9f3bf043'); -- hour-of-code

-- Codecademy Free Courses
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '1ed32a7f-b86b-4fdb-bc0c-04bad1217831',
  'Codecademy Free Courses',
  '40331311-7ce1-47f7-b831-b1e2c41acda0',
  'Codecademy',
  'Interactive coding lessons with free courses in various programming languages.',
  'https://www.codecademy.com/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '1ed32a7f-b86b-4fdb-bc0c-04bad1217831';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '1ed32a7f-b86b-4fdb-bc0c-04bad1217831';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '1ed32a7f-b86b-4fdb-bc0c-04bad1217831';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', 'f26169b7-4d4d-4689-92df-f5236ee645c2'); -- coding
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', 'd50c14b4-aa89-4558-949b-f720616fefce'); -- interactive
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', 'c506714c-a846-402a-9453-979a035bc158'); -- programming
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1ed32a7f-b86b-4fdb-bc0c-04bad1217831', '94cf0221-2c58-49a8-9ab0-61e94c4ecd32'); -- lessons

-- CodeHS
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '8add9553-a38b-45e2-9d5e-9b9ea11fa124',
  'CodeHS',
  'e3ef9f46-806c-4286-9eeb-b5eadf48d190',
  'CodeHS',
  'Free online computer science curriculum with interactive coding exercises and courses.',
  'https://codehs.com/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '8add9553-a38b-45e2-9d5e-9b9ea11fa124';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '8add9553-a38b-45e2-9d5e-9b9ea11fa124';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '8add9553-a38b-45e2-9d5e-9b9ea11fa124';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', 'f26169b7-4d4d-4689-92df-f5236ee645c2'); -- coding
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', 'd4d30c02-7041-4b30-ad4f-56b70cd55aaf'); -- computer-science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', 'd50c14b4-aa89-4558-949b-f720616fefce'); -- interactive
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8add9553-a38b-45e2-9d5e-9b9ea11fa124', '4375ef2a-b85b-4672-8ecd-f5d25957ba72'); -- free

-- Collège du Léman
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '3057abf8-b131-4d5c-8734-ee9791ad37f5',
  'Collège du Léman',
  'ff953cc2-35d0-4e47-8781-d49c4d2a0682',
  'Collège du Léman International School',
  'Collège du Léman is a leading bilingual international boarding and day school in Geneva, Switzerland, serving students aged 2-18. Founded in 1960, the school offers French Baccalaureate, IB Diploma, Swiss Matura, and US High School Diploma programs. Annual boarding fees range from $80,000-$100,000 USD. The school''s bilingual approach (French-English) from early years gives students fluency in both languages. With over 2,000 students from 120+ nationalities, it''s one of Switzerland''s largest international schools. The school maintains modern facilities including innovation labs, sports centers, and arts studios. Financial aid and merit scholarships are available, covering up to 50% of tuition for qualified international students. Located on Lake Geneva''s shores with views of Mont Blanc, the campus provides an inspiring learning environment. Graduates progress to top universities worldwide with strong placement records at Swiss Federal Institutes, European universities, and North American institutions.',
  'https://www.cdl.ch',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '3057abf8-b131-4d5c-8734-ee9791ad37f5';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '3057abf8-b131-4d5c-8734-ee9791ad37f5';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '3057abf8-b131-4d5c-8734-ee9791ad37f5';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', 'dc985f9e-41f6-4499-a008-f3c7ab7de314'); -- bilingual
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3057abf8-b131-4d5c-8734-ee9791ad37f5', 'f8464126-e2dd-4d26-afb8-006bb9c2a683'); -- geneva

-- Columbia University
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'a59b71d5-2b28-4af1-aa61-19627cec363b',
  'Columbia University',
  'd605f529-cc90-47d4-ae62-4e0096da724f',
  'Columbia University',
  'Columbia University, founded in 1754, is an Ivy League institution in New York City and one of the world''s most prestigious universities. Annual costs total approximately $88,992 USD including tuition ($68,400), fees, and living expenses in Manhattan. Columbia is need-blind for US applicants and provides substantial financial aid—the average grant is $66,350, with families earning under $66,000 typically paying nothing. International students receive need-aware consideration with significant aid available. The university enrolls approximately 8,500 undergraduates from 150+ countries. Columbia''s Core Curriculum, established in 1919, provides rigorous liberal arts education mandatory for all students. Located in Morningside Heights, students access unparalleled New York City internship and cultural opportunities. The university excels across all disciplines including engineering (Columbia SEAS), journalism, business, and humanities. Acceptance rate is approximately 4%, making it highly selective. Notable alumni include US Presidents, Nobel laureates, and industry leaders. Malaysian students are part of Columbia''s international community, with strong representation in STEM and business programs.',
  'https://www.columbia.edu',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'a59b71d5-2b28-4af1-aa61-19627cec363b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'a59b71d5-2b28-4af1-aa61-19627cec363b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'a59b71d5-2b28-4af1-aa61-19627cec363b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', '902be6ab-3b69-4a15-8863-d5caab3190d8'); -- ivy-league
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', '49086635-1b04-4d38-a02e-e5e3e62f77c5'); -- new-york
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', 'bf9cad32-5a54-4748-a824-91efbdb05250'); -- liberal-arts
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a59b71d5-2b28-4af1-aa61-19627cec363b', '518b6db4-9ec4-421c-b2c7-5e52ac132f91'); -- research

-- Coursera
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'c55c71c0-4310-4dfa-b65f-7c071678f6bf',
  'Coursera',
  'fa938e8f-d1f0-4124-a913-8669296c9139',
  'Coursera',
  'Online courses from top universities and companies. Many free audit options available.',
  'https://www.coursera.org/',
  true
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = 'c55c71c0-4310-4dfa-b65f-7c071678f6bf';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'c55c71c0-4310-4dfa-b65f-7c071678f6bf';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'c55c71c0-4310-4dfa-b65f-7c071678f6bf';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', '771f976b-a4f7-4e0d-b674-dac659bac222'); -- mooc
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', '5362e8d2-e187-4ffb-a9f4-26d6fe381b80'); -- universities
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', 'edd375b9-75cc-42e2-9cc9-8d550c653a07'); -- courses
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c55c71c0-4310-4dfa-b65f-7c071678f6bf', '21cd0c74-c7c6-40f2-a435-044aa52c4614'); -- audit

-- CS50 by Harvard
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8',
  'CS50 by Harvard',
  'aef3ec77-4dec-4ff7-82f9-da406f303aa2',
  'Harvard University',
  'Harvard''s famous introduction to computer science course, available free online.',
  'https://cs50.harvard.edu/',
  true
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = 'ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', 'd4d30c02-7041-4b30-ad4f-56b70cd55aaf'); -- computer-science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', '1d322339-fee3-4253-9002-8234ae9f45ff'); -- harvard
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', 'c506714c-a846-402a-9453-979a035bc158'); -- programming
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ef2b34d6-e6a3-4b77-8d3c-a5c5d71bd0b8', '4375ef2a-b85b-4672-8ecd-f5d25957ba72'); -- free

-- Dartmouth College
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'c4b38fcb-9605-4316-b09e-6b354d1a2b03',
  'Dartmouth College',
  'b42dfac0-c197-4c0e-843e-e660f44e5c0d',
  'Dartmouth College',
  'Dartmouth College, founded in 1769, is an Ivy League institution in Hanover, New Hampshire, combining liberal arts education with research excellence. Annual costs total approximately $87,161 USD including tuition ($65,511), fees, and living expenses. Dartmouth is need-blind for all applicants including internationals and meets 100% of demonstrated financial need—families earning under $125,000 typically pay nothing for tuition. The average grant exceeds $65,000. Dartmouth enrolls approximately 4,500 undergraduates in an intimate learning environment emphasizing close faculty-student relationships. The unique D-Plan allows students flexibility in scheduling with year-round quarters. The college excels in liberal arts, engineering, business (Tuck School), and medicine. Located in a picturesque New England town, Dartmouth offers outdoor opportunities including skiing and hiking alongside rigorous academics. Acceptance rate is approximately 6%. The tight-knit community and strong alumni network provide exceptional career support. Notable alumni include numerous US Cabinet members, CEOs, and scholars. Malaysian and international students receive comprehensive support services. Graduates achieve strong outcomes across all sectors.',
  'https://www.dartmouth.edu',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'c4b38fcb-9605-4316-b09e-6b354d1a2b03';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'c4b38fcb-9605-4316-b09e-6b354d1a2b03';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'c4b38fcb-9605-4316-b09e-6b354d1a2b03';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', '902be6ab-3b69-4a15-8863-d5caab3190d8'); -- ivy-league
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', 'bf9cad32-5a54-4748-a824-91efbdb05250'); -- liberal-arts
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', '518b6db4-9ec4-421c-b2c7-5e52ac132f91'); -- research
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c4b38fcb-9605-4316-b09e-6b354d1a2b03', 'eb8958a9-f810-4ac6-82bb-78fae8dbbdcd'); -- new-england

-- edX
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '1803561a-6ae4-4087-a88b-d97c9861781f',
  'edX',
  '8c50ecc4-225f-4e72-8213-1d10888e3bc4',
  'edX',
  'Free online courses from top universities including Harvard, MIT, and more.',
  'https://www.edx.org/',
  true
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = '1803561a-6ae4-4087-a88b-d97c9861781f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '1803561a-6ae4-4087-a88b-d97c9861781f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '1803561a-6ae4-4087-a88b-d97c9861781f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', '771f976b-a4f7-4e0d-b674-dac659bac222'); -- mooc
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', '5362e8d2-e187-4ffb-a9f4-26d6fe381b80'); -- universities
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', 'edd375b9-75cc-42e2-9cc9-8d550c653a07'); -- courses
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1803561a-6ae4-4087-a88b-d97c9861781f', 'a411bab7-68b3-4084-851c-de838797bca8'); -- certifications

-- ETH Zurich
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'd403704d-81d6-4174-84b1-2990315512c7',
  'ETH Zurich',
  '4bbf4c05-61a5-4a2a-af90-85b1853d796c',
  'ETH Zurich - Swiss Federal Institute of Technology',
  'ETH Zurich (Swiss Federal Institute of Technology), founded in 1855, is one of the world''s leading universities for science and technology, consistently ranked in the global top 10. Despite relatively low tuition fees (CHF 1,460/~$1,650 per year for all students including internationals), total annual costs for international students exceed $86,000 USD due to Switzerland''s high cost of living—accommodation, food, health insurance, and living expenses in Zurich total approximately $24,000-$30,000 per year. ETH offers limited scholarships for international students, primarily the Excellence Scholarship covering living expenses. The university enrolls approximately 24,000 students (11,000 undergraduates) from 120+ countries. ETH has produced 21 Nobel laureates including Albert Einstein. The institution excels in engineering, computer science, mathematics, natural sciences, and architecture. Teaching is primarily in German for undergraduate programs, with English options in master''s programs. Acceptance rates vary but undergraduate admission is moderately selective. Malaysian students studying at ETH often receive Malaysian government scholarships. The Zurich location provides access to a global business hub and exceptional quality of life. Graduates achieve outstanding outcomes with high placement at tech companies and research institutions worldwide.',
  'https://ethz.ch',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'd403704d-81d6-4174-84b1-2990315512c7';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'd403704d-81d6-4174-84b1-2990315512c7';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'd403704d-81d6-4174-84b1-2990315512c7';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', '518b6db4-9ec4-421c-b2c7-5e52ac132f91'); -- research
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', 'd87e3036-d212-4f9b-b7c0-9dad4e25ecd3'); -- engineering
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d403704d-81d6-4174-84b1-2990315512c7', 'd4d30c02-7041-4b30-ad4f-56b70cd55aaf'); -- computer-science

-- Eton College
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'c9e970d6-502e-4f4a-a4fc-9dfab578cda8',
  'Eton College',
  '23c247e3-6989-40f5-af99-40927a972579',
  'Eton College',
  'Eton College is one of the world''s most prestigious boys'' boarding schools, founded in 1440 by King Henry VI. Located in Windsor, England, Eton has educated 20 British Prime Ministers and numerous members of royal families worldwide. The school serves boys aged 13-18, offering A-Levels and the IB Diploma. Annual fees are approximately $55,000-$65,000 USD. Despite its elite reputation, Eton operates one of the UK''s most generous financial aid programs, with over £7 million awarded annually and approximately 20% of students receiving support. The school maintains exceptional academic standards with nearly all graduates gaining admission to top Russell Group universities, Oxbridge, and international institutions. Eton''s distinctive traditions, combined with modern facilities and teaching methods, create a unique educational environment. The school emphasizes character development, leadership, and public service alongside academic achievement. International students, including Malaysians, are welcomed and supported through comprehensive pastoral care systems.',
  'https://www.etoncollege.com',
  true
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'c9e970d6-502e-4f4a-a4fc-9dfab578cda8';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'c9e970d6-502e-4f4a-a4fc-9dfab578cda8';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'c9e970d6-502e-4f4a-a4fc-9dfab578cda8';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', 'be57e3a6-a1ab-43f4-bf60-51616350cff3'); -- royalty
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', '69661814-6f02-4137-94f2-70ce7f5cdc47'); -- boys-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c9e970d6-502e-4f4a-a4fc-9dfab578cda8', 'fffce20f-d2d5-46a7-968e-0fcab5f5b588'); -- elite

-- Free Tertiary Education for B40
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '06ebafef-6b5a-42e8-b136-991c1ae41c1a',
  'Free Tertiary Education for B40',
  '9b6bd97f-9441-4033-8779-b056d91555ce',
  'Ministry of Higher Education Malaysia',
  'Free tertiary education at public universities for B40 families with household income below RM4,850.',
  'https://www.mohe.gov.my/',
  true
);
-- Link to category: degree
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'degree') WHERE id = '06ebafef-6b5a-42e8-b136-991c1ae41c1a';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '06ebafef-6b5a-42e8-b136-991c1ae41c1a';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '06ebafef-6b5a-42e8-b136-991c1ae41c1a';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', 'c1cf9119-2a8b-4b62-bb45-55a1b3831b3f'); -- b40
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('06ebafef-6b5a-42e8-b136-991c1ae41c1a', '4b38ac62-dfcf-48cc-a0f9-0371c26dfe45'); -- public-universities

-- freeCodeCamp
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '418d7010-6b84-4af0-8084-fdaa11165f6c',
  'freeCodeCamp',
  'c4e02c80-825a-46e7-995e-a87eb020ecdd',
  'freeCodeCamp.org',
  'Free online coding bootcamp with certifications in web development, data science, and more.',
  'https://www.freecodecamp.org/',
  true
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '418d7010-6b84-4af0-8084-fdaa11165f6c';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '418d7010-6b84-4af0-8084-fdaa11165f6c';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '418d7010-6b84-4af0-8084-fdaa11165f6c';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', 'f26169b7-4d4d-4689-92df-f5236ee645c2'); -- coding
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', '0ef7c4e4-d0d9-487a-953d-e252dc643f90'); -- bootcamp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', 'a411bab7-68b3-4084-851c-de838797bca8'); -- certifications
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('418d7010-6b84-4af0-8084-fdaa11165f6c', '07b14005-2d05-4845-8ef5-db7a9a126292'); -- web-development

-- Giatmara
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5',
  'Giatmara',
  'e7af191d-c4ca-44c9-bd8c-db9364e6dd0a',
  'Giatmara MARA',
  'Vocational training centers offering technical skills programs for youth.',
  'https://giatmara.edu.my/',
  false
);
-- Link to category: tvet
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'tvet') WHERE id = '5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', '7eb21c6b-fd17-4193-8792-da27c2681065'); -- vocational
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', 'aa8dfaa8-7910-4851-ab96-d1c144fda6a5'); -- technical
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', '9fd18beb-2593-422a-a439-65c524dfc968'); -- youth
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5eee2ecd-29b9-4d2f-84d3-ce2fe0ee68e5', '84edea9b-7108-4a36-89c9-f30db5bcc3fc'); -- mara

-- Google Gemilang Program
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '916917c9-a848-4a13-8fa1-7bfe901a7aa8',
  'Google Gemilang Program',
  'e3485a3b-d91b-4355-9c16-d5e7ac36c1d3',
  'Google Malaysia',
  'Digital skills training program for Malaysians to improve employability in tech.',
  'https://grow.google/intl/en_my/',
  true
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '916917c9-a848-4a13-8fa1-7bfe901a7aa8';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '916917c9-a848-4a13-8fa1-7bfe901a7aa8';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '916917c9-a848-4a13-8fa1-7bfe901a7aa8';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', 'cbcec774-41e9-4090-a9e6-a0f25636e4cc'); -- google
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', 'f7fa99d8-c7d0-46d6-b1fc-daae02589fff'); -- digital-skills
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', '510538ae-6f30-4561-8877-1e001255db22'); -- employability
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('916917c9-a848-4a13-8fa1-7bfe901a7aa8', 'd0523523-605b-4acb-8729-1da16eb1bde8'); -- tech

-- Gordonstoun
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'a45e84f3-960e-4d48-8fb8-5b1df7d17c86',
  'Gordonstoun',
  '5dd469bc-c22a-406f-8140-f3d821ffd7bc',
  'Gordonstoun School',
  'Gordonstoun is a co-educational boarding school in Moray, Scotland, founded in 1934 by educationalist Kurt Hahn. Famous for being attended by Prince Philip and Prince Charles, the school serves students aged 8-18. Annual boarding fees range from $45,000-$55,000 USD. Gordonstoun is renowned for its distinctive educational philosophy emphasizing outdoor education, service, and character development alongside academic achievement. Students complete A-Levels or IB Diploma while participating in expeditions, seamanship training (the school has its own sailing vessel), and community service projects. The school''s "Round Square" approach develops resilience, leadership, and social responsibility. Financial assistance is available through the school''s bursary program, supporting approximately 20% of students. With around 550 students from over 40 countries, Gordonstoun maintains a strong international community. The school''s unique combination of academic rigor and adventurous outdoor education produces graduates who progress to leading universities and develop into well-rounded global citizens.',
  'https://www.gordonstoun.org.uk',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'a45e84f3-960e-4d48-8fb8-5b1df7d17c86';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'a45e84f3-960e-4d48-8fb8-5b1df7d17c86';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'a45e84f3-960e-4d48-8fb8-5b1df7d17c86';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', '2b1984ad-286b-4f09-b438-aa9a344f80b6'); -- outdoor-education
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', 'be57e3a6-a1ab-43f4-bf60-51616350cff3'); -- royalty
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', '9a480f11-e2d8-4002-900e-7a54347ca74d'); -- scotland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a45e84f3-960e-4d48-8fb8-5b1df7d17c86', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum

-- Sekolah Menengah Sains Gua Musang (GUAMSS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '39fa3b85-66b2-4333-8cfc-91c95431a2e5',
  'Sekolah Menengah Sains Gua Musang (GUAMSS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Gua Musang, abbreviated as GUAMSS, is a premier science secondary school located in Gua Musang, Kelantan. As a Sekolah Berasrama Penuh (SBP), GUAMSS provides fully residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) disciplines. The school offers an intensive science-focused curriculum leading to SPM certification, designed to nurture future scientists, engineers, medical professionals, and researchers from Kelantan''s interior and Orang Asli communities. GUAMSS features modern science laboratories, advanced technology infrastructure, comprehensive library resources, and experienced teaching staff committed to excellence in science education. Students engage actively in research projects, science fairs, innovation competitions, and academic olympiads at district, state, and national levels, developing strong scientific foundations and practical research skills. The school''s strategic location in Gua Musang allows it to serve diverse communities including indigenous populations, providing quality education opportunities that promote social mobility and equity. Beyond academics, GUAMSS promotes holistic development through extensive co-curricular activities including robotics clubs, science societies, mathematics associations, sports teams, uniformed bodies, and cultural programs that celebrate diversity. The boarding environment fosters discipline, independence, multicultural understanding, and supportive peer relationships while maintaining high academic standards. Students develop critical thinking, problem-solving skills, and scientific inquiry abilities essential for success in higher education and professional careers. As a government SBP, GUAMSS is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families, with special emphasis on reaching underserved rural and indigenous communities. Admission is competitive based on academic merit, science aptitude tests, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). GUAMSS graduates have excelled in universities and professional fields, serving as role models and change agents in their communities.',
  'https://guamss.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '39fa3b85-66b2-4333-8cfc-91c95431a2e5';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '39fa3b85-66b2-4333-8cfc-91c95431a2e5';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '39fa3b85-66b2-4333-8cfc-91c95431a2e5';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', '459659e3-6f42-4e5c-82b7-c36ae26504ce'); -- kelantan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('39fa3b85-66b2-4333-8cfc-91c95431a2e5', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Harrow School
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '508a8f8b-cf62-4651-b3dd-9f628cc80226',
  'Harrow School',
  '34e31f58-879d-49a8-bc87-95ee3807927c',
  'Harrow School',
  'Harrow School is one of England''s most famous boys'' boarding schools, founded in 1572 under a Royal Charter. Located in northwest London, Harrow has educated seven British Prime Ministers, including Winston Churchill, and numerous distinguished alumni across politics, business, and the arts. The school serves boys aged 13-18, offering A-Levels and Pre-U qualifications. Annual fees range from $55,000-$65,000 USD. Harrow provides substantial financial assistance through its Bursary Fund, with over £4 million distributed annually to support talented students regardless of background. The school maintains a distinctive house system with 12 boarding houses, each fostering a strong community identity. Students wear the iconic Harrow straw hat and traditional uniform. Academic standards are exceptional, with graduates regularly gaining places at Oxford, Cambridge, Imperial, LSE, and top US universities. Harrow emphasizes all-round education including sports, music, drama, and leadership development. International students form approximately 20% of the student body.',
  'https://www.harrowschool.org.uk',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '508a8f8b-cf62-4651-b3dd-9f628cc80226';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '508a8f8b-cf62-4651-b3dd-9f628cc80226';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '508a8f8b-cf62-4651-b3dd-9f628cc80226';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', '69661814-6f02-4137-94f2-70ce7f5cdc47'); -- boys-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', 'fffce20f-d2d5-46a7-968e-0fcab5f5b588'); -- elite
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('508a8f8b-cf62-4651-b3dd-9f628cc80226', 'ad8083ca-2cc0-41ee-b9a0-78496f6fd570'); -- london

-- Harvey Mudd College
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '838f72dd-5670-429f-b343-8733e3144e7f',
  'Harvey Mudd College',
  '85d90f4a-51b0-4af7-9e84-c9f9040522e7',
  'Harvey Mudd College',
  'Harvey Mudd College is an elite private STEM college in Claremont, California, founded in 1955. Annual costs total approximately $88,396 USD including tuition ($64,527), fees, room, and board. Despite high costs, Harvey Mudd meets 100% of demonstrated financial need—the average need-based grant is $47,000, with merit scholarships also available. The college enrolls approximately 900 undergraduates focused on engineering, science, mathematics, and computer science, while maintaining liberal arts breadth through the Claremont Colleges consortium. Harvey Mudd is renowned for rigorous academics and producing the highest-paid graduates among liberal arts colleges, with median starting salaries exceeding $95,000. The student-faculty ratio of 8:1 ensures personalized attention. Acceptance rate is approximately 13%, highly selective for STEM programs. The diverse student body includes international students from 20+ countries. Harvey Mudd emphasizes hands-on learning, undergraduate research, and the Clinic Program where students solve real-world problems for companies. Graduates progress to top graduate schools or tech companies including Google, Microsoft, and SpaceX.',
  'https://www.hmc.edu',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '838f72dd-5670-429f-b343-8733e3144e7f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '838f72dd-5670-429f-b343-8733e3144e7f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '838f72dd-5670-429f-b343-8733e3144e7f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', 'bf9cad32-5a54-4748-a824-91efbdb05250'); -- liberal-arts
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', 'd87e3036-d212-4f9b-b7c0-9dad4e25ecd3'); -- engineering
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('838f72dd-5670-429f-b343-8733e3144e7f', 'd4d30c02-7041-4b30-ad4f-56b70cd55aaf'); -- computer-science

-- Sekolah Berasrama Penuh Integrasi Gopeng (I-GOP)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '9310c4c6-ccb5-412c-9aa0-b13fcf9f3850',
  'Sekolah Berasrama Penuh Integrasi Gopeng (I-GOP)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Gopeng in Gopeng, Perak is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school with an integrated curriculum approach, I-GOP provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The integrated curriculum combines academic subjects with Islamic studies and character education, providing holistic development grounded in national values and religious principles. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Students benefit from experienced teachers, modern facilities, and extensive co-curricular programs including sports, uniformed bodies, clubs, and Islamic activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located in the historic town of Gopeng, I-GOP serves students from across Perak and neighboring states. The integrated approach ensures students develop strong moral foundations alongside academic competencies, preparing them to become responsible and ethical citizens. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). I-GOP graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities.',
  'https://igop.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '9310c4c6-ccb5-412c-9aa0-b13fcf9f3850';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '9310c4c6-ccb5-412c-9aa0-b13fcf9f3850';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '9310c4c6-ccb5-412c-9aa0-b13fcf9f3850';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('9310c4c6-ccb5-412c-9aa0-b13fcf9f3850', '22d012b0-6d32-4e9b-80fb-fc1928a6b04f'); -- perak

-- Sekolah Berasrama Penuh Integrasi Kubang Pasu (I-KUPS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'af3d8cef-a034-44b0-a060-004d7675f44b',
  'Sekolah Berasrama Penuh Integrasi Kubang Pasu (I-KUPS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Kubang Pasu in Bukit Kayu Hitam, Kedah is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school with an integrated curriculum approach, I-KUPS provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The integrated curriculum combines academic subjects with Islamic studies and character education, providing holistic development grounded in national values and religious principles. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Students benefit from experienced teachers, modern facilities, and extensive co-curricular programs including sports, uniformed bodies, clubs, and Islamic activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located near the Malaysia-Thailand border, I-KUPS serves students from across Kedah and neighboring states. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). I-KUPS graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities.',
  'https://ikups.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'af3d8cef-a034-44b0-a060-004d7675f44b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'af3d8cef-a034-44b0-a060-004d7675f44b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'af3d8cef-a034-44b0-a060-004d7675f44b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('af3d8cef-a034-44b0-a060-004d7675f44b', '2648da4e-491d-438f-94f1-ef25b6cc1907'); -- kedah

-- Imperial College London
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'c09feaa0-aa83-4c05-985c-ea6ff3508712',
  'Imperial College London',
  'e8eaa368-bee0-465b-847a-4f78bd8672c7',
  'Imperial College London',
  'Imperial College London, founded in 1907, is one of the world''s leading universities specializing in science, engineering, medicine, and business. For international students, annual costs range from $50,000-$80,000 USD depending on program, including tuition (£37,900-£40,940 for most courses), accommodation, and London living expenses. Imperial offers limited financial aid for international students, but the President''s Undergraduate Scholarships provide full tuition coverage for exceptional students from underrepresented countries. The university enrolls approximately 10,000 undergraduates from 140+ countries, with over 60% international students creating a globally diverse environment. Imperial consistently ranks in the global top 10 for engineering and technology. Located in South Kensington, London, students access world-class museums and cultural institutions. The university maintains strong industry connections, particularly in tech, finance, and healthcare sectors. Acceptance rates are highly competitive at 10-15% for international students. Malaysian students form one of the largest international cohorts. Graduates achieve exceptional outcomes with high starting salaries (median £35,000+) and strong placement at tech companies, consulting firms, and graduate schools. The Imperial network provides extensive career support.',
  'https://www.imperial.ac.uk',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'c09feaa0-aa83-4c05-985c-ea6ff3508712';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'c09feaa0-aa83-4c05-985c-ea6ff3508712';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'c09feaa0-aa83-4c05-985c-ea6ff3508712';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', 'ad8083ca-2cc0-41ee-b9a0-78496f6fd570'); -- london
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', 'd87e3036-d212-4f9b-b7c0-9dad4e25ecd3'); -- engineering
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c09feaa0-aa83-4c05-985c-ea6ff3508712', '97496881-6052-45ce-a983-6d39d4140e03'); -- medicine

-- Sekolah Berasrama Penuh Integrasi Temerloh (InSofT)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '7df6e289-3664-4f8e-aa48-4880d941700a',
  'Sekolah Berasrama Penuh Integrasi Temerloh (InSofT)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Temerloh, known as InSofT, is a distinguished integrated residential school located in Temerloh, Pahang. As part of Malaysia''s elite Integrasi school network, InSofT delivers comprehensive education that balances academic rigor with character formation through an innovative integrated curriculum. The school provides Forms 1-5 education (ages 13-17) leading to SPM certification, offering both science and arts streams with a unique approach that weaves Islamic values, critical thinking, and leadership development into every aspect of learning. InSofT emphasizes holistic student development, combining strong academic foundations with moral education, soft skills training, and cultural awareness. The campus features modern educational infrastructure including advanced laboratories, multimedia learning centers, library resources, sports facilities, and comfortable boarding amenities. Students participate in extensive co-curricular programs including academic clubs, sports teams, cultural activities, and community outreach initiatives. The residential environment cultivates discipline, independence, teamwork, and lifelong friendships while maintaining high academic standards. As a government SBP, InSofT is highly subsidized with minimal fees, making premium integrated education accessible to talented students from B40 and M40 families. Admission is selective based on academic performance, aptitude tests, and personal interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). InSofT alumni are recognized for their balanced excellence in academics and character, successfully pursuing tertiary education and becoming responsible leaders in various professional fields.',
  'https://insoft.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '7df6e289-3664-4f8e-aa48-4880d941700a';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '7df6e289-3664-4f8e-aa48-4880d941700a';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '7df6e289-3664-4f8e-aa48-4880d941700a';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', 'fdf04f88-f7b8-4a3f-982e-0311fd55b928'); -- pahang
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7df6e289-3664-4f8e-aa48-4880d941700a', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur

-- Sekolah Berasrama Penuh Integrasi Tun Abdul Razak (InSTAR)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '91c97325-b1a2-41e6-9247-9ce12254f569',
  'Sekolah Berasrama Penuh Integrasi Tun Abdul Razak (InSTAR)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Tun Abdul Razak, abbreviated as InSTAR, is a premier integrated residential school named after Malaysia''s second Prime Minister. Located in Pahang, InSTAR exemplifies educational excellence through its distinctive integrated curriculum approach. The school serves Forms 1-5 students (ages 13-17) leading to SPM certification, offering comprehensive education that seamlessly blends academic achievement with character development, Islamic values, and leadership training. InSTAR''s integrated methodology ensures students receive not just subject knowledge but also critical thinking skills, ethical grounding, and global competencies essential for 21st-century success. The school offers both science and arts streams, supported by state-of-the-art facilities including modern classrooms, well-equipped laboratories, computer centers, extensive library collections, sports complexes, and quality boarding accommodations. Students engage in diverse co-curricular activities spanning academic competitions, sports, performing arts, uniformed bodies, and community service projects. The residential setting fosters discipline, self-management, collaborative skills, and strong peer relationships. Named after a visionary leader, InSTAR instills leadership qualities and social responsibility in every student. As a government SBP, the school is highly subsidized with minimal fees, ensuring quality integrated education remains accessible to deserving students from B40 and M40 families. Admission is highly competitive based on academic merit, aptitude assessments, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). InSTAR graduates consistently excel in higher education and professional careers, embodying the school''s commitment to producing well-rounded, ethical leaders.',
  'https://instar.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '91c97325-b1a2-41e6-9247-9ce12254f569';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '91c97325-b1a2-41e6-9247-9ce12254f569';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '91c97325-b1a2-41e6-9247-9ce12254f569';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', 'fdf04f88-f7b8-4a3f-982e-0311fd55b928'); -- pahang
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('91c97325-b1a2-41e6-9247-9ce12254f569', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur

-- Institut auf dem Rosenberg
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '4a89992e-8312-4a1d-ba1e-21c865796b9d',
  'Institut auf dem Rosenberg',
  '14d620d4-991e-4325-942c-9ca98e8ac93a',
  'Institut auf dem Rosenberg',
  'Often regarded as the world''s most expensive boarding school, Institut auf dem Rosenberg in St. Gallen, Switzerland offers an ultra-luxury educational experience for students aged 6-18. Founded in 1889, the school provides individualized education with a student-to-teacher ratio of 3:1. Students can pursue Swiss Matura, German Abitur, IB Diploma, A-Levels, or US High School Diploma. Annual costs exceed $150,000 USD, covering tuition, boarding, and comprehensive extracurricular programs including entrepreneurship initiatives and global expeditions. The school emphasizes innovation, entrepreneurship, and preparing future leaders through its "Artisans of Life" philosophy. Financial aid is limited but available for exceptional candidates. The institution attracts students from over 50 countries and maintains strong university placement records at top global institutions.',
  'https://www.instrosenberg.ch',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '4a89992e-8312-4a1d-ba1e-21c865796b9d';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '4a89992e-8312-4a1d-ba1e-21c865796b9d';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '4a89992e-8312-4a1d-ba1e-21c865796b9d';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', '1983abad-8b6e-460d-a93f-73c3603b2d2d'); -- luxury
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4a89992e-8312-4a1d-ba1e-21c865796b9d', 'd102ec3e-4ab9-4c11-a4df-8e564352511c'); -- entrepreneurship

-- Sekolah Berasrama Penuh Integrasi Gombak (INTEGOMB)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '7c9ed493-51c0-493d-97da-16e020ee504d',
  'Sekolah Berasrama Penuh Integrasi Gombak (INTEGOMB)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Gombak (INTEGOMB) is currently ranked as the #1 SBP in Malaysia for 2025, achieving an outstanding Gred Purata Sekolah (GPS) of 0.93 in the SPM 2024 examination. Located in Gombak, Selangor, this government fully residential school offers Form 1-5 education with exceptional academic standards and comprehensive facilities. INTEGOMB follows the integrated curriculum combining academic excellence with Islamic education and character development. As an SBP, the school is highly subsidized by the Malaysian government, with minimal fees making quality boarding school education accessible to B40 and M40 families. Admission is highly competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Students benefit from modern facilities, experienced teachers, and a structured boarding environment that promotes discipline and self-management. The school emphasizes STEM subjects while maintaining strong humanities and language programs. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). INTEGOMB''s recent top ranking demonstrates the quality of affordable, merit-based education available through Malaysia''s SBP system, proving that excellence is accessible beyond expensive private institutions.',
  'https://www.integomb.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '7c9ed493-51c0-493d-97da-16e020ee504d';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '7c9ed493-51c0-493d-97da-16e020ee504d';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '7c9ed493-51c0-493d-97da-16e020ee504d';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', '83466eed-22f2-4007-bfe1-ea8cbd2e088a'); -- top-ranked
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', '52b86312-c515-40ea-bfb9-b9156cafa200'); -- islamic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7c9ed493-51c0-493d-97da-16e020ee504d', '868b05e5-58b4-41ef-ace2-46ab65428aee'); -- gps-093

-- Sekolah Berasrama Penuh Integrasi Jempol (INTEJ)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '1c883721-e0b2-499d-b18d-d0a183b2cabb',
  'Sekolah Berasrama Penuh Integrasi Jempol (INTEJ)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Jempol (INTEJ) in Jempol, Negeri Sembilan, is an integrated boarding school offering a unique blend of academic and Islamic education. Established to provide comprehensive education combining secular subjects with Islamic studies, INTEJ serves both boys and girls in a fully residential setting. The school offers Form 1-5 education leading to SPM certification, with an integrated curriculum that balances modern academic subjects with Quranic studies, Islamic jurisprudence, Arabic language, and Islamic values. As a government SBP school, fees are highly subsidized, making quality integrated education accessible to B40 and M40 families seeking both academic excellence and Islamic education for their children. INTEJ features modern facilities including science laboratories, computer labs, Islamic studies centers, well-stocked library, surau, sports facilities, and separate boarding quarters for male and female students. The integrated curriculum ensures students develop strong foundations in mathematics, sciences, and languages while deepening their understanding of Islamic principles and practices. Teachers are experienced in both conventional and Islamic education methodologies. The boarding environment promotes Islamic values, discipline, mutual respect, and academic diligence. Students participate in co-curricular activities including Quran recitation competitions, Islamic debates, sports, and uniformed bodies. Admission is competitive, based on academic performance, co-curricular records, and demonstrated interest in Islamic education. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). INTEJ graduates are well-prepared for higher education in both conventional and Islamic institutions.',
  'https://intej.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '1c883721-e0b2-499d-b18d-d0a183b2cabb';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '1c883721-e0b2-499d-b18d-d0a183b2cabb';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '1c883721-e0b2-499d-b18d-d0a183b2cabb';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', 'fe467450-a6fa-4016-adf5-4a770a197d3a'); -- islamic-education
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1c883721-e0b2-499d-b18d-d0a183b2cabb', '4d342282-39e1-4640-aae3-aaf587a9e97b'); -- negeri-sembilan

-- Sekolah Berasrama Penuh Integrasi Kuantan (INTEK)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '8a47b1e5-ceda-49b8-9b6d-28ea891b2eac',
  'Sekolah Berasrama Penuh Integrasi Kuantan (INTEK)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Kuantan, or INTEK, is an integrated residential secondary school located in Kuantan, the capital of Pahang. As part of the prestigious Integrasi network, INTEK combines academic excellence with comprehensive character development through an innovative integrated curriculum. The school serves Forms 1-5 students (ages 13-17) leading to SPM certification, offering both science and arts streams with equal emphasis on academic achievement and holistic education. INTEK''s integrated approach incorporates Islamic values, leadership training, and 21st-century skills into the mainstream curriculum, preparing students for higher education and global citizenship. The school features modern facilities including well-equipped classrooms, science laboratories, computer labs, sports complexes, and comfortable boarding accommodations. Students engage in diverse co-curricular activities spanning academics, sports, arts, and community service. The boarding environment promotes discipline, self-reliance, and strong interpersonal skills while fostering a supportive learning community. As a government SBP, INTEK is highly subsidized with minimal fees, ensuring quality integrated education remains accessible to deserving students from B40 and M40 families regardless of socioeconomic background. Admission is competitive based on academic merit, aptitude assessments, and interviews. Applications open annually through the official SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). INTEK graduates are known for their academic excellence, strong character, and leadership qualities, successfully pursuing higher education and contributing meaningfully to Malaysian society.',
  'https://intek.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '8a47b1e5-ceda-49b8-9b6d-28ea891b2eac';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '8a47b1e5-ceda-49b8-9b6d-28ea891b2eac';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '8a47b1e5-ceda-49b8-9b6d-28ea891b2eac';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', 'fdf04f88-f7b8-4a3f-982e-0311fd55b928'); -- pahang
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8a47b1e5-ceda-49b8-9b6d-28ea891b2eac', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur

-- Sekolah Berasrama Penuh Integrasi Sabak Bernam (INTESABER)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'bc11b649-bf62-4c18-bae6-84473b67682a',
  'Sekolah Berasrama Penuh Integrasi Sabak Bernam (INTESABER)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Sabak Bernam (INTESABER) in Sabak Bernam, Selangor is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, INTESABER provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families, particularly benefiting students from rural areas of Sabak Bernam and surrounding districts. As an integrated school, INTESABER delivers a balanced curriculum that combines strong academic foundations across science, mathematics, language, and humanities with comprehensive co-curricular development. The integrated approach ensures students develop versatile skills and knowledge preparing them for diverse career pathways. Located in the coastal district of Sabak Bernam, INTESABER serves as an educational hub providing quality boarding education to students who might otherwise have limited access to advanced educational facilities. Students benefit from experienced teachers, modern facilities, and extensive co-curricular programs including sports, uniformed bodies, clubs, and community service initiatives. The boarding system instills discipline, time management, and collaborative skills essential for future success. INTESABER''s commitment to holistic development produces graduates who excel academically while possessing strong character and leadership qualities. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). INTESABER graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities.',
  'https://intesaber.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'bc11b649-bf62-4c18-bae6-84473b67682a';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'bc11b649-bf62-4c18-bae6-84473b67682a';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'bc11b649-bf62-4c18-bae6-84473b67682a';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bc11b649-bf62-4c18-bae6-84473b67682a', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum

-- Sekolah Menengah Sains Sultan Iskandar (ISKANDAR)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'ce92046c-b06d-438c-af58-ea6aa2bb918d',
  'Sekolah Menengah Sains Sultan Iskandar (ISKANDAR)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Sultan Iskandar (ISKANDAR) in Mersing, Johor, is a science-focused boarding school named after Sultan Iskandar of Johor. ISKANDAR specializes in providing advanced STEM education to academically talented students in a fully residential setting. The school offers Form 1-5 education with strong curriculum emphasis on science, technology, engineering, and mathematics, preparing students for competitive university placements in technical and medical fields. As a government Sekolah Menengah Sains, fees are highly subsidized, enabling bright students from B40 and M40 families to access specialized science education without financial constraints. ISKANDAR features state-of-the-art facilities including advanced science laboratories for physics, chemistry, biology, and specialized scientific disciplines, modern computer centers equipped with latest technology, mathematics resource centers, comprehensive library with extensive scientific literature, sports complexes, and comfortable boarding facilities. The STEM-focused curriculum emphasizes hands-on experimentation, scientific inquiry, research methodology, analytical thinking, and active participation in science competitions, olympiads, and innovation challenges at district, state, and national levels. Experienced science educators with strong academic credentials provide rigorous instruction, personalized guidance, and mentorship to develop students'' problem-solving abilities and scientific reasoning. The boarding environment fosters collaborative learning, academic discipline, peer tutoring, and development of critical thinking and innovation skills essential for scientific careers. Students engage in diverse activities including science clubs, robotics teams, innovation projects, mathematics competitions, and research initiatives. ISKANDAR balances intensive academic excellence with comprehensive co-curricular programs including sports, uniformed bodies, clubs, and leadership development. The school emphasizes character building, teamwork, and holistic development. Admission is highly competitive, prioritizing students with exceptional academic performance and demonstrated passion for science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). ISKANDAR graduates consistently achieve excellent results and secure competitive placements in medicine, engineering, and science programs at top Malaysian universities.',
  'https://iskandar.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'ce92046c-b06d-438c-af58-ea6aa2bb918d';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'ce92046c-b06d-438c-af58-ea6aa2bb918d';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'ce92046c-b06d-438c-af58-ea6aa2bb918d';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ce92046c-b06d-438c-af58-ea6aa2bb918d', '6f949d9f-568d-4ea4-a904-96f6c92f873d'); -- johor

-- Sekolah Menengah Sains Jeli (JeSS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '260abae5-2aee-4611-91d1-123acfe647bd',
  'Sekolah Menengah Sains Jeli (JeSS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Jeli, popularly known as JeSS, is a distinguished science secondary school located in Jeli, Kelantan. As a Sekolah Berasrama Penuh (SBP), JeSS provides comprehensive residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) education. The school offers an intensive science-focused curriculum leading to SPM certification, designed to develop future scientists, engineers, medical professionals, and technology innovators from Kelantan''s interior regions. JeSS features well-equipped science laboratories, modern technology infrastructure, digital learning resources, and dedicated educators committed to excellence in science education. Students actively participate in research projects, science competitions, innovation challenges, and academic olympiads at various levels, developing strong scientific foundations and analytical thinking skills. The school''s location in Jeli, near the Thai border, provides unique opportunities for cross-cultural learning and environmental science studies. Beyond academics, JeSS promotes holistic development through diverse co-curricular activities including robotics clubs, science societies, mathematics associations, sports programs, uniformed bodies, and community service initiatives. The boarding environment cultivates discipline, independence, teamwork, and lasting friendships while maintaining rigorous academic standards. Students develop critical thinking, problem-solving abilities, and scientific inquiry methods essential for success in higher education and STEM careers. As a government SBP, JeSS is highly subsidized with minimal fees, ensuring quality science education remains accessible to talented students from B40 and M40 families, particularly those from rural and border areas. The school plays a crucial role in providing quality education to underserved communities. Admission is competitive based on academic achievement, science aptitude assessments, and personal interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). JeSS graduates consistently excel in universities, particularly in medicine, engineering, and pure sciences, bringing positive transformation to their communities and contributing to national development.',
  'https://jess.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '260abae5-2aee-4611-91d1-123acfe647bd';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '260abae5-2aee-4611-91d1-123acfe647bd';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '260abae5-2aee-4611-91d1-123acfe647bd';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', '459659e3-6f42-4e5c-82b7-c36ae26504ce'); -- kelantan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('260abae5-2aee-4611-91d1-123acfe647bd', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Johns Hopkins University
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '658ad0ba-a2f0-42cb-910c-73388aa65abb',
  'Johns Hopkins University',
  'f9f13aef-ae4a-4b55-89b8-fe5eb7d1702f',
  'Johns Hopkins University',
  'Johns Hopkins University, founded in 1876, is a world-leading research university in Baltimore, Maryland. Annual costs average $86,065 USD including tuition ($63,340), fees, room, and board. Hopkins meets 100% of demonstrated financial need for all admitted students, including internationals—the average need-based grant exceeds $60,000, making it accessible despite high sticker price. The university enrolls approximately 6,000 undergraduates from 120+ countries. Hopkins is renowned for biomedical engineering, public health, medicine, and international studies, hosting the #1 ranked engineering program and world-class medical institutions. The university invests over $3 billion annually in research, providing unparalleled undergraduate research opportunities. Students can access resources at the Johns Hopkins Hospital and Applied Physics Laboratory. Acceptance rate is approximately 7%. The diverse student body includes significant international representation with Malaysian students particularly strong in engineering and pre-medicine tracks. Graduates achieve outstanding outcomes with high medical school acceptance rates and placement at top companies and graduate programs. The Baltimore location provides urban engagement opportunities.',
  'https://www.jhu.edu',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '658ad0ba-a2f0-42cb-910c-73388aa65abb';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '658ad0ba-a2f0-42cb-910c-73388aa65abb';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '658ad0ba-a2f0-42cb-910c-73388aa65abb';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', '518b6db4-9ec4-421c-b2c7-5e52ac132f91'); -- research
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', '97496881-6052-45ce-a983-6d39d4140e03'); -- medicine
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', 'd87e3036-d212-4f9b-b7c0-9dad4e25ecd3'); -- engineering
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('658ad0ba-a2f0-42cb-910c-73388aa65abb', '68e16cf4-7415-4cb2-b92d-679d40597a55'); -- biomedical

-- Khan Academy
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '16be47bd-73d4-455d-937a-10919738cf40',
  'Khan Academy',
  '091116fc-1dac-42aa-b9c3-e6b348b0a870',
  'Khan Academy',
  'Free educational resources covering math, science, programming, and more for all ages.',
  'https://www.khanacademy.org/',
  true
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = '16be47bd-73d4-455d-937a-10919738cf40';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '16be47bd-73d4-455d-937a-10919738cf40';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '16be47bd-73d4-455d-937a-10919738cf40';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', (SELECT id FROM education_levels WHERE slug = 'primary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', 'feb7175f-0449-4825-b649-d2ba4e2aa8c3'); -- education
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', '374926c1-142b-4c58-8f87-7804ee9aa311'); -- math
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', '1d174ec1-975c-40a4-bfbe-df70b7d9187f'); -- science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', 'c506714c-a846-402a-9453-979a035bc158'); -- programming
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('16be47bd-73d4-455d-937a-10919738cf40', '4375ef2a-b85b-4672-8ecd-f5d25957ba72'); -- free

-- Khazanah Scholarship
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '7a264a3f-4211-4898-8a59-89256322ec02',
  'Khazanah Scholarship',
  '0cd4b5bb-fb65-4e18-bd57-bffb9450d79b',
  'Khazanah Nasional',
  'Prestigious scholarship for outstanding Malaysian students for degree and postgraduate studies.',
  'https://www.khazanah.com.my/',
  true
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = '7a264a3f-4211-4898-8a59-89256322ec02';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '7a264a3f-4211-4898-8a59-89256322ec02';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'hybrid') WHERE id = '7a264a3f-4211-4898-8a59-89256322ec02';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', 'b55aa445-b5d1-4f02-9e3f-3aa9ca36b1d1'); -- prestigious
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', 'af0bdeaf-730d-4b81-8da2-a9bc9933cb31'); -- postgraduate
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a264a3f-4211-4898-8a59-89256322ec02', '698f7507-9e94-4225-9929-3a1d577cde3a'); -- corporate

-- Kolej Islam Sultan Alam Shah (KISAS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '4304c5f4-8954-4d24-886d-57521b172a76',
  'Kolej Islam Sultan Alam Shah (KISAS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Kolej Islam Sultan Alam Shah (KISAS) in Klang, Selangor, is Malaysia''s premier Islamic boarding school, established in 2007. KISAS uniquely combines academic excellence with comprehensive Islamic education, offering an integrated curriculum that prepares students for both SPM examinations and strong Islamic scholarship. The school serves Form 1-5 students (ages 13-17) in a fully residential setting that emphasizes moral development, Islamic values, and modern knowledge. As a government Sekolah Berasrama Penuh, KISAS is highly subsidized, making integrated Islamic education accessible to B40 and M40 families. The school features modern facilities including Islamic studies resource centers, science laboratories, ICT facilities, a central mosque, library, sports complex, and comfortable dormitories. KISAS''s curriculum balances mainstream academic subjects (science, mathematics, languages, humanities) with extensive Islamic studies including Quran, Hadith, Fiqh, and Arabic language. Students benefit from qualified teachers in both academic and religious subjects. The boarding environment promotes Islamic character, discipline, and community values while preparing students for university admissions. Admission is competitive, assessing both academic merit (primary school results, formerly UPSR) and religious knowledge. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). KISAS graduates excel in diverse fields while maintaining strong Islamic identity and values, serving as role models in their communities.',
  'https://www.kisas.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '4304c5f4-8954-4d24-886d-57521b172a76';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '4304c5f4-8954-4d24-886d-57521b172a76';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '4304c5f4-8954-4d24-886d-57521b172a76';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', 'fe467450-a6fa-4016-adf5-4a770a197d3a'); -- islamic-education
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', '66d27815-be82-4712-892d-3dbd0a7a6f3b'); -- leadership
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4304c5f4-8954-4d24-886d-57521b172a76', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor

-- KrackedDevs
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '2a5b4e39-2df3-48eb-bfeb-640f52b3a924',
  'KrackedDevs',
  '5401d60a-b733-4b92-a5d9-7ee50d57a557',
  'KrackedDevs Community',
  'Free tech education resources and community for Malaysian developers and learners.',
  'https://krackeddevs.com/',
  true
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '2a5b4e39-2df3-48eb-bfeb-640f52b3a924';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '2a5b4e39-2df3-48eb-bfeb-640f52b3a924';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '2a5b4e39-2df3-48eb-bfeb-640f52b3a924';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', 'd0523523-605b-4acb-8729-1da16eb1bde8'); -- tech
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', '2dbbad61-9062-4fcc-a29b-ad9b4e51be45'); -- community
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', '41c06242-5b96-4d95-b8e3-27f84ab2ed96'); -- developers
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2a5b4e39-2df3-48eb-bfeb-640f52b3a924', '4375ef2a-b85b-4672-8ecd-f5d25957ba72'); -- free

-- Sekolah Menengah Sains Kubang Pasu (KUPSIS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '5dc719c3-edc4-4ae9-ad91-fad35654ee92',
  'Sekolah Menengah Sains Kubang Pasu (KUPSIS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Kubang Pasu in Jitra, Kedah is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, KUPSIS provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, mathematics competitions, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. KUPSIS has established itself as a leading science school in northern Kedah, consistently producing excellent SPM results and nurturing future scientists and engineers. The school emphasizes inquiry-based learning and hands-on experimentation to develop critical thinking and problem-solving skills. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). KUPSIS graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://www.kupsis.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '5dc719c3-edc4-4ae9-ad91-fad35654ee92';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '5dc719c3-edc4-4ae9-ad91-fad35654ee92';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '5dc719c3-edc4-4ae9-ad91-fad35654ee92';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5dc719c3-edc4-4ae9-ad91-fad35654ee92', '2648da4e-491d-438f-94f1-ef25b6cc1907'); -- kedah

-- Sekolah Menengah Sains Kuala Selangor (KUSESS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'c1e05ae5-0dda-4fae-b26f-0ce395024727',
  'Sekolah Menengah Sains Kuala Selangor (KUSESS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Kuala Selangor (KUSESS) in Kuala Selangor, Selangor is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification with specialized focus on science and STEM education. As a fully residential science school, KUSESS provides comprehensive boarding facilities and structured environment promoting academic excellence, scientific inquiry, and innovation. The school is highly subsidized by the Malaysian government, with minimal fees making quality science boarding education accessible to B40 and M40 families. KUSESS specializes in developing future scientists, engineers, and STEM professionals through intensive science and mathematics curriculum emphasizing hands-on laboratory work, scientific research, problem-solving, and critical thinking. The school maintains well-equipped science laboratories for Physics, Chemistry, and Biology, computer facilities, and research resources enabling students to conduct experiments and develop practical scientific skills. Advanced courses in sciences and mathematics prepare students for competitive STEM careers and university programs. The curriculum integrates theoretical knowledge with practical applications, encouraging innovation, creativity, and scientific reasoning essential for 21st-century STEM fields. Students benefit from experienced science teachers, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, coding workshops, mathematics olympiad preparation, and environmental science projects. Active participation in national science competitions, STEM fairs, and innovation challenges provides students opportunities to showcase their scientific talents and compete at high levels. The boarding system instills discipline, time management, and collaborative skills essential for future success in scientific and engineering fields. KUSESS''s STEM-focused environment cultivates scientific curiosity, analytical thinking, and passion for discovery. The school emphasizes both academic excellence and character development, producing graduates who are not only scientifically competent but also socially responsible. Admission is highly competitive, prioritizing students with strong aptitude and genuine interest in science and mathematics, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). KUSESS graduates consistently gain admission to top Form 6 science programs, matriculation colleges, A-Levels, and foundation courses, with many proceeding to prestigious Malaysian public universities in STEM fields including engineering, medicine, pharmacy, biotechnology, and pure sciences.',
  'https://kusess.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'c1e05ae5-0dda-4fae-b26f-0ce395024727';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'c1e05ae5-0dda-4fae-b26f-0ce395024727';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'c1e05ae5-0dda-4fae-b26f-0ce395024727';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c1e05ae5-0dda-4fae-b26f-0ce395024727', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school

-- The Lawrenceville School
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '0de3fb16-2a52-46d5-97f9-38c8ca2343ae',
  'The Lawrenceville School',
  '4a5d07e0-443d-44fd-9c56-e0bd19e66f9b',
  'The Lawrenceville School',
  'The Lawrenceville School in Lawrenceville, New Jersey, founded in 1810, is one of America''s most selective and prestigious boarding schools. Serving grades 9-12, Lawrenceville enrolls approximately 820 students from 35+ countries. Annual tuition and boarding fees total around $70,000 USD. The school operates a generous financial aid program distributing over $13 million annually, with 35% of students receiving assistance averaging $57,000. Lawrenceville''s unique "House System" organizes students into small communities of 30-40 students living and learning together with faculty members. The school offers over 150 courses including advanced seminars equivalent to college-level work. Graduates achieve outstanding university placements with strong representation at Princeton, Penn, Yale, and other top institutions. The school is consistently ranked among the top 5 boarding schools in the US. Notable alumni include Pulitzer Prize winners, Olympic athletes, and business leaders. The 700-acre campus near Princeton features stunning architecture and exceptional facilities including innovation labs and athletics complexes.',
  'https://www.lawrenceville.org',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '0de3fb16-2a52-46d5-97f9-38c8ca2343ae';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '0de3fb16-2a52-46d5-97f9-38c8ca2343ae';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '0de3fb16-2a52-46d5-97f9-38c8ca2343ae';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', 'c1012cca-491f-4c4c-9a53-ffcf4f9e6d06'); -- selective
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', 'b296bda2-3c80-4aef-ad6c-0e1aa9a705d0'); -- prep-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', '7d8ed546-f827-42d9-b775-70c47fb81be5'); -- house-system
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0de3fb16-2a52-46d5-97f9-38c8ca2343ae', '0bd90d4a-f22e-4839-a6b0-71abef98db9b'); -- financial-aid

-- Le Régent Crans-Montana College
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'e3b5c3aa-1884-44e9-91cb-7349869c9da4',
  'Le Régent Crans-Montana College',
  '06760ee6-ae24-47f9-87d6-d3dfd55ab5ba',
  'Le Régent International School',
  'Le Régent Crans-Montana College is a luxury alpine boarding school in the Swiss Alps at 1,500 meters altitude, offering boutique education for students aged 4-18. Founded in 2015, the school provides British curriculum (IGCSE and A-Levels), American High School Diploma, and IB Diploma programs. Annual boarding fees range from $100,000-$120,000 USD, positioning it among the most expensive schools globally. The school maintains small class sizes with maximum 8-12 students per class and a 1:4 student-teacher ratio. With approximately 100 boarding students from 35+ countries, Le Régent offers an intimate, family-style environment with personalized attention. The school''s alpine location provides exceptional opportunities for skiing, mountain sports, and outdoor leadership programs. Facilities include modern classrooms, innovation labs, recording studios, and sports facilities. Limited financial aid is available for exceptional students. The school emphasizes entrepreneurship, creativity, and holistic development. Graduates progress to prestigious universities worldwide, with dedicated university counseling ensuring strong placements at Russell Group, Ivy League, and top European institutions.',
  'https://www.leregent.ch',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'e3b5c3aa-1884-44e9-91cb-7349869c9da4';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'e3b5c3aa-1884-44e9-91cb-7349869c9da4';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'e3b5c3aa-1884-44e9-91cb-7349869c9da4';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', '1983abad-8b6e-460d-a93f-73c3603b2d2d'); -- luxury
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', '983ededb-a3aa-487a-a73f-e887cabd6cf3'); -- alpine
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e3b5c3aa-1884-44e9-91cb-7349869c9da4', '00577207-ddda-4f75-a2b1-9d49e293a6ff'); -- small-class

-- Institut Le Rosey
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '476645dd-f5d7-40b6-a8e6-18099d28f220',
  'Institut Le Rosey',
  '8ca11653-c11e-4040-b7f9-dbc4b8dcc8a4',
  'Institut Le Rosey',
  'Known as the "School of Kings," Institut Le Rosey is one of the world''s most prestigious and expensive boarding schools, founded in 1880. The school operates from two campuses: Rolle on Lake Geneva (September-March) and Gstaad in the Alps (January-March). Serving ages 8-18, Le Rosey offers French and Swiss Matura, IB Diploma, and a bilingual French-English curriculum. Annual fees exceed $130,000 USD, making it one of the most expensive schools globally. Notable alumni include royalty from multiple countries, business leaders, and influential figures. The school maintains a 1:5 teacher-student ratio and enrolls approximately 420 students from over 60 countries. While expensive, Le Rosey offers limited need-based financial aid. The institution provides exceptional facilities including a concert hall, sailing center, equestrian center, and comprehensive arts programs. Graduates attend the world''s top universities.',
  'https://www.rosey.ch',
  true
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '476645dd-f5d7-40b6-a8e6-18099d28f220';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '476645dd-f5d7-40b6-a8e6-18099d28f220';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '476645dd-f5d7-40b6-a8e6-18099d28f220';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', 'b55aa445-b5d1-4f02-9e3f-3aa9ca36b1d1'); -- prestigious
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', 'be57e3a6-a1ab-43f4-bf60-51616350cff3'); -- royalty
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', 'dc985f9e-41f6-4499-a008-f3c7ab7de314'); -- bilingual
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('476645dd-f5d7-40b6-a8e6-18099d28f220', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum

-- LinkedIn Learning Free Courses
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'ad534c84-3e88-4e04-b164-f475bf6c0566',
  'LinkedIn Learning Free Courses',
  'ec3a7a6a-2762-4abd-88cc-29913d340e39',
  'LinkedIn',
  'Professional development courses with some free content available.',
  'https://www.linkedin.com/learning/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = 'ad534c84-3e88-4e04-b164-f475bf6c0566';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'ad534c84-3e88-4e04-b164-f475bf6c0566';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'ad534c84-3e88-4e04-b164-f475bf6c0566';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', 'd77bbf8b-bca1-4431-abf0-10003e97956d'); -- professional
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', '821de224-e76b-49d8-a61b-3ea6e37a26fd'); -- skills
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', '1bed5564-61ef-4852-94cb-df558aa1232c'); -- career
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ad534c84-3e88-4e04-b164-f475bf6c0566', '920bda5b-000e-4064-a9ee-488ec8721452'); -- business

-- London School of Economics
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '059812e8-f15f-48d2-805a-276fdffdc594',
  'London School of Economics',
  '14fa3d4d-c246-4c4b-bbc0-d8a1c350b380',
  'London School of Economics and Political Science',
  'The London School of Economics and Political Science (LSE), founded in 1895, is the world''s leading social science university, specializing in economics, politics, law, sociology, and related fields. For international students, annual costs total approximately $55,000-$65,000 USD including tuition (£27,500-$34,000), accommodation, and London living expenses. LSE offers competitive undergraduate support through the LSE Undergraduate Support Scheme with awards up to £22,000 annually, though international student aid is limited compared to US universities. The university enrolls approximately 12,500 students (5,000 undergraduates) from 150+ countries, creating the most internationally diverse campus in the UK with 70% international students. Located in Holborn, central London, students access Parliament, courts, museums, and global businesses. LSE has produced 18 Nobel laureates, 37 world leaders, and numerous influential economists and social scientists. The university excels in economics (#2 globally), politics, international relations, law, and sociology. Acceptance rate is approximately 12% for undergraduates. Malaysian students have strong representation, particularly in economics and finance programs. Graduates achieve exceptional career outcomes with high employability in finance, consulting, government, and international organizations. Starting salaries average £35,000+.',
  'https://www.lse.ac.uk',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '059812e8-f15f-48d2-805a-276fdffdc594';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '059812e8-f15f-48d2-805a-276fdffdc594';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '059812e8-f15f-48d2-805a-276fdffdc594';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', 'fc00e5de-4f51-4dd0-945d-d9b4d388275b'); -- economics
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', '14885f3d-3120-4b30-baad-8d216b10827b'); -- social-sciences
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', 'ad8083ca-2cc0-41ee-b9a0-78496f6fd570'); -- london
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('059812e8-f15f-48d2-805a-276fdffdc594', '87b63e75-8481-4c3a-ba72-5269f2f33800'); -- politics

-- Lyceum Alpinum Zuoz
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '7a3141bc-e77f-41df-90fd-44de719b8a42',
  'Lyceum Alpinum Zuoz',
  '6ccb5b87-1300-4a17-a89b-8bf4e9ccdefc',
  'Lyceum Alpinum Zuoz',
  'Lyceum Alpinum Zuoz is a traditional Swiss boarding school founded in 1904, located in the alpine village of Zuoz in the Engadin valley at 1,750 meters altitude. Serving grades 6-12, the school offers Swiss Matura, IB Diploma, and German Abitur programs with instruction primarily in German and English. Annual boarding fees range from $75,000-$90,000 USD. The school emphasizes academic excellence combined with alpine sports including skiing, mountaineering, and outdoor expeditions. With approximately 200-300 boarding students from over 30 countries, the school maintains an intimate learning community with small class sizes. The institution is known for its rigorous academic standards and strong science and mathematics programs. Financial aid is available on a need basis for exceptional students. The school''s alpine location provides unique opportunities for environmental studies and outdoor education. Graduates achieve strong university placement rates at ETH Zurich, other Swiss universities, and international institutions.',
  'https://www.lyceum-alpinum.ch',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '7a3141bc-e77f-41df-90fd-44de719b8a42';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '7a3141bc-e77f-41df-90fd-44de719b8a42';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '7a3141bc-e77f-41df-90fd-44de719b8a42';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', '8b33fa27-17c4-411d-b730-666e82f23e9d'); -- traditional
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', '983ededb-a3aa-487a-a73f-e887cabd6cf3'); -- alpine
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7a3141bc-e77f-41df-90fd-44de719b8a42', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Malaysia Government Scholarships
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'd2850829-c036-41f7-8536-e150d3bbc9c9',
  'Malaysia Government Scholarships',
  '491330bf-94a4-467c-aede-403bd89ac886',
  'Public Service Department Malaysia',
  'Various scholarship programs for outstanding students to pursue degree and postgraduate studies.',
  'https://www.jpa.gov.my/',
  true
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = 'd2850829-c036-41f7-8536-e150d3bbc9c9';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'd2850829-c036-41f7-8536-e150d3bbc9c9';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'hybrid') WHERE id = 'd2850829-c036-41f7-8536-e150d3bbc9c9';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', '67f65a20-446a-4934-9112-0b7bb3ec0fa9'); -- jpa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', 'af0bdeaf-730d-4b81-8da2-a9bc9933cb31'); -- postgraduate
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d2850829-c036-41f7-8536-e150d3bbc9c9', '4e9ac02d-ab57-4ce1-9991-2ffc8c326db7'); -- overseas

-- Malaysia MOOCs
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '2ff598b4-a1cf-4516-ac03-5f019760c254',
  'Malaysia MOOCs',
  '9b6bd97f-9441-4033-8779-b056d91555ce',
  'Ministry of Higher Education Malaysia',
  'Free online courses from Malaysian universities on various subjects.',
  'https://moocs.gov.my/',
  true
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = '2ff598b4-a1cf-4516-ac03-5f019760c254';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '2ff598b4-a1cf-4516-ac03-5f019760c254';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '2ff598b4-a1cf-4516-ac03-5f019760c254';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', '771f976b-a4f7-4e0d-b674-dac659bac222'); -- mooc
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', '4fec24bb-abec-466d-b05d-fbc620a15889'); -- malaysian-universities
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2ff598b4-a1cf-4516-ac03-5f019760c254', 'edd375b9-75cc-42e2-9cc9-8d550c653a07'); -- courses

-- MARA Scholarships
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '11776bf1-f428-4cee-91c6-49a1e326a73e',
  'MARA Scholarships',
  '024cfa6b-bf38-494c-91f2-5fb351f2cca8',
  'Majlis Amanah Rakyat',
  'Various scholarship programs for Bumiputera students to pursue higher education locally and overseas.',
  'https://www.mara.gov.my/',
  true
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = '11776bf1-f428-4cee-91c6-49a1e326a73e';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '11776bf1-f428-4cee-91c6-49a1e326a73e';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'hybrid') WHERE id = '11776bf1-f428-4cee-91c6-49a1e326a73e';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', '388c3b8e-8d57-424e-8fb5-90e75731db07'); -- bumiputera
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', '4e9ac02d-ab57-4ce1-9991-2ffc8c326db7'); -- overseas
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('11776bf1-f428-4cee-91c6-49a1e326a73e', '6919d829-41fa-4319-9e74-e74c8076789b'); -- local

-- Kolej Melayu Kuala Kangsar (MCKK)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'dc23adbf-42f4-4c0f-9343-a27afd022efc',
  'Kolej Melayu Kuala Kangsar (MCKK)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Kolej Melayu Kuala Kangsar, often called the ''Eton of the East'', is Malaysia''s oldest and most prestigious fully residential school, founded in 1905. Located in Kuala Kangsar, Perak, MCKK has educated numerous Malaysian prime ministers, ministers, and leaders across various sectors. The school offers Form 1-5 education (ages 13-17) leading to SPM certification, with a strong emphasis on academic excellence, leadership, and character development. As a government Sekolah Berasrama Penuh (SBP), MCKK is highly subsidized with minimal fees, making elite education accessible to B40 and M40 families. Admission is extremely competitive, based on UPSR results (now replaced by school-based assessment), interview performance, and co-curricular achievements. The school combines rigorous academics with extensive co-curricular programs including sports, uniformed bodies, and cultural activities. MCKK''s historic campus features colonial-era buildings alongside modern facilities. Applications open annually through the official SPM portal. Form 1: https://spskt1.moe.gov.my (typically January-February). The school''s alumni network, known as ''Old Boys'', is one of the most influential in Malaysia, providing mentorship and career opportunities for graduates.',
  'https://www.mckk.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'dc23adbf-42f4-4c0f-9343-a27afd022efc';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'dc23adbf-42f4-4c0f-9343-a27afd022efc';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'dc23adbf-42f4-4c0f-9343-a27afd022efc';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', 'b55aa445-b5d1-4f02-9e3f-3aa9ca36b1d1'); -- prestigious
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', '66d27815-be82-4712-892d-3dbd0a7a6f3b'); -- leadership
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dc23adbf-42f4-4c0f-9343-a27afd022efc', '22d012b0-6d32-4e9b-80fb-fc1928a6b04f'); -- perak

-- MDN Web Docs
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'aa74463a-a00c-464a-a7c2-82c0bc4a40ef',
  'MDN Web Docs',
  '55ebb694-1e6d-489b-a3a7-a487c2bf8963',
  'Mozilla',
  'Comprehensive web development documentation and learning resources from Mozilla.',
  'https://developer.mozilla.org/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = 'aa74463a-a00c-464a-a7c2-82c0bc4a40ef';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'aa74463a-a00c-464a-a7c2-82c0bc4a40ef';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'aa74463a-a00c-464a-a7c2-82c0bc4a40ef';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', '07b14005-2d05-4845-8ef5-db7a9a126292'); -- web-development
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', 'cc4fc119-17b0-4eb8-93ad-ce92877e9e25'); -- documentation
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', '1a823b92-fe47-4679-8bbb-c0e6b9e669b1'); -- mozilla
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('aa74463a-a00c-464a-a7c2-82c0bc4a40ef', '7d4baf95-8d52-455f-b102-bfb76001086b'); -- reference

-- Microsoft Learn
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'fd3640b3-4cc6-40f1-9d27-3e38c47af376',
  'Microsoft Learn',
  '2ad24899-d3bd-431e-a807-eb5214a91016',
  'Microsoft',
  'Free training modules and certifications for Microsoft technologies and Azure.',
  'https://learn.microsoft.com/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = 'fd3640b3-4cc6-40f1-9d27-3e38c47af376';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'fd3640b3-4cc6-40f1-9d27-3e38c47af376';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'fd3640b3-4cc6-40f1-9d27-3e38c47af376';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', 'f0786c0c-6a21-4016-8e6c-0fd47873dca7'); -- microsoft
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', '64eb96c5-db10-4c7d-a059-d1c22f4d8d5b'); -- azure
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', 'a411bab7-68b3-4084-851c-de838797bca8'); -- certifications
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fd3640b3-4cc6-40f1-9d27-3e38c47af376', 'dcff9496-fda3-4eb3-8e53-7cc9f2c5e7af'); -- cloud

-- MIT OpenCourseWare
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'e875e350-0549-44f3-a3fd-3f8a270cf127',
  'MIT OpenCourseWare',
  'ee85e920-3d7f-42bf-b88c-6902974bc7f6',
  'Massachusetts Institute of Technology',
  'Free access to MIT course materials across all subjects.',
  'https://ocw.mit.edu/',
  true
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = 'e875e350-0549-44f3-a3fd-3f8a270cf127';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'e875e350-0549-44f3-a3fd-3f8a270cf127';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'e875e350-0549-44f3-a3fd-3f8a270cf127';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', '08d5d5f0-2c29-408e-a698-086375b07b10'); -- mit
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', 'edd375b9-75cc-42e2-9cc9-8d550c653a07'); -- courses
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e875e350-0549-44f3-a3fd-3f8a270cf127', '4375ef2a-b85b-4672-8ecd-f5d25957ba72'); -- free

-- Major League Hacking (MLH)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '0362dbca-8049-47a9-899c-966ef8cc6fff',
  'Major League Hacking (MLH)',
  'af7dd6ba-bf1b-4d3e-bb2d-eec959cbf82b',
  'Major League Hacking',
  'Global hackathon community connecting students to tech opportunities and competitions.',
  'https://mlh.io/',
  false
);
-- Link to category: community
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'community') WHERE id = '0362dbca-8049-47a9-899c-966ef8cc6fff';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '0362dbca-8049-47a9-899c-966ef8cc6fff';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'hybrid') WHERE id = '0362dbca-8049-47a9-899c-966ef8cc6fff';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', 'f1818b33-1138-4b0c-bdcb-8739f1eca321'); -- hackathon
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', '2dbbad61-9062-4fcc-a29b-ad9b4e51be45'); -- community
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', 'd0523523-605b-4acb-8729-1da16eb1bde8'); -- tech
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0362dbca-8049-47a9-899c-966ef8cc6fff', 'f0c8fa59-2f99-44ca-a406-d127e7ff0033'); -- students

-- Sekolah Menengah Sains Muzaffar Shah (MOZAC)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'b1a98d69-f4fd-4806-a13d-4fb8d366e411',
  'Sekolah Menengah Sains Muzaffar Shah (MOZAC)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Muzaffar Shah (MOZAC) in Ayer Keroh, Melaka, is a prestigious science-focused boarding school named after the former Yang di-Pertua Negeri of Melaka. MOZAC specializes in providing advanced STEM education to academically talented students from across Malaysia. The school offers Form 1-5 education with strong emphasis on science, technology, engineering, and mathematics, preparing students for competitive university placements in technical fields. As a government Sekolah Menengah Sains, fees are highly subsidized, enabling bright students from B40 and M40 families to access specialized science education without financial burden. MOZAC features state-of-the-art facilities including advanced science laboratories for physics, chemistry, biology, and specialized sciences, modern computer centers with latest educational technology, mathematics resource centers, comprehensive library with extensive scientific literature, sports complexes, swimming pool, and comfortable boarding facilities. The STEM-focused curriculum emphasizes hands-on experimentation, scientific inquiry, research projects, and participation in science competitions and olympiads at national and international levels. Experienced science teachers with strong academic credentials provide rigorous instruction, mentorship, and guidance. The boarding environment fosters collaborative learning, academic discipline, peer tutoring, and development of critical thinking and problem-solving skills essential for scientific careers. Students engage in science clubs, innovation projects, robotics, mathematics competitions, and research initiatives. MOZAC balances intensive academic programs with comprehensive co-curricular activities including sports, uniformed bodies, and leadership development. Admission is highly competitive, prioritizing students with exceptional aptitude and passion for science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). MOZAC graduates consistently secure placements in top medicine, engineering, and science programs at premier universities.',
  'https://mozac.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'b1a98d69-f4fd-4806-a13d-4fb8d366e411';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'b1a98d69-f4fd-4806-a13d-4fb8d366e411';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'b1a98d69-f4fd-4806-a13d-4fb8d366e411';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b1a98d69-f4fd-4806-a13d-4fb8d366e411', 'e1fb11cb-d0d2-416f-ba7a-3f90d9c19f4e'); -- melaka

-- MyFutureJobs
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'eea105a4-ae25-4712-a448-81b1a2ff191d',
  'MyFutureJobs',
  'fd3f181b-3dde-4b60-9d9f-54ea1188be11',
  'TalentCorp Malaysia',
  'Career guidance and job portal for Malaysians with skills training resources.',
  'https://www.myfuturejobs.gov.my/',
  false
);
-- Link to category: community
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'community') WHERE id = 'eea105a4-ae25-4712-a448-81b1a2ff191d';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'eea105a4-ae25-4712-a448-81b1a2ff191d';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'eea105a4-ae25-4712-a448-81b1a2ff191d';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', (SELECT id FROM education_levels WHERE slug = 'all-levels'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', '1bed5564-61ef-4852-94cb-df558aa1232c'); -- career
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', '0ef65ebd-b439-434e-b10e-967097b94993'); -- jobs
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', '6f8ba33a-5b95-45f5-af2f-e159936da70d'); -- training
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eea105a4-ae25-4712-a448-81b1a2ff191d', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government

-- myKasih Foundation
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'd60a9602-d467-4b7a-9fe5-460453f6c18b',
  'myKasih Foundation',
  '13341441-3922-4fd1-b7e7-5ad649312f6b',
  'myKasih Foundation',
  'Education assistance and food aid programs for poor families in Malaysia.',
  'https://www.mykasih.com/',
  false
);
-- Link to category: financial-aid
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'financial-aid') WHERE id = 'd60a9602-d467-4b7a-9fe5-460453f6c18b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'd60a9602-d467-4b7a-9fe5-460453f6c18b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'd60a9602-d467-4b7a-9fe5-460453f6c18b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', (SELECT id FROM education_levels WHERE slug = 'primary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', 'f4c03ce1-c7cc-4efb-90d7-571ced8a768a'); -- ngo
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', 'f72f260a-67b7-4c11-9239-b03bcd7d38a7'); -- assistance
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', 'dcaa5e44-ac02-4e2a-b262-64f3b5865807'); -- food-aid
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d60a9602-d467-4b7a-9fe5-460453f6c18b', 'feb7175f-0449-4825-b649-d2ba4e2aa8c3'); -- education

-- New York University
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'fa9d9357-8d67-4e6c-b5fa-175b5d2e215e',
  'New York University',
  '8f49017c-e176-43f6-83b9-38241815d7fd',
  'New York University',
  'New York University (NYU), founded in 1831, is a major private research university in the heart of Manhattan and one of the largest private universities in the US. Annual costs total approximately $86,606 USD including tuition ($60,438), fees, and living expenses in New York City. NYU provides substantial financial aid with over $800 million distributed annually—the average need-based grant is approximately $45,000, though international students face more limited aid options compared to US students. NYU enrolls approximately 30,000 undergraduates from 133 countries, making it one of the most internationally diverse US universities. The university excels in business (Stern School), arts (Tisch School), law, medicine, and liberal arts. With no traditional campus, NYU integrates into Greenwich Village, offering unparalleled access to NYC''s cultural, business, and internship opportunities. The university operates global campuses in Abu Dhabi and Shanghai. Acceptance rate is approximately 13%. Notable alumni include multiple Nobel laureates, Academy Award winners, and business leaders. Malaysian students have strong representation across programs, particularly in business and arts. Graduates benefit from extensive NYC networking and career opportunities.',
  'https://www.nyu.edu',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'fa9d9357-8d67-4e6c-b5fa-175b5d2e215e';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'fa9d9357-8d67-4e6c-b5fa-175b5d2e215e';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'fa9d9357-8d67-4e6c-b5fa-175b5d2e215e';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', '0d891926-1616-4e06-8ad5-6d17dd47c097'); -- urban
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', '8b0e9f7e-f4b7-4939-a63d-f548d3d1ba35'); -- arts
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', '920bda5b-000e-4064-a9ee-488ec8721452'); -- business
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('fa9d9357-8d67-4e6c-b5fa-175b5d2e215e', '2172ad01-b39d-44e6-9e25-7686b1ff7613'); -- international

-- The Odin Project
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '100db3d4-851c-490f-a1f1-eb0b45d86680',
  'The Odin Project',
  '33fb7829-801e-4157-b969-b1861337f236',
  'The Odin Project',
  'Free full-stack web development curriculum with a supportive community.',
  'https://www.theodinproject.com/',
  true
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '100db3d4-851c-490f-a1f1-eb0b45d86680';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '100db3d4-851c-490f-a1f1-eb0b45d86680';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '100db3d4-851c-490f-a1f1-eb0b45d86680';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', '07b14005-2d05-4845-8ef5-db7a9a126292'); -- web-development
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', '64f573ac-eca3-4c09-b5d9-e8e12a55371d'); -- full-stack
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', 'd3e87f96-d2a8-4e2a-80fd-3adc59173861'); -- curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('100db3d4-851c-490f-a1f1-eb0b45d86680', '2dbbad61-9062-4fcc-a29b-ad9b4e51be45'); -- community

-- Open Source Society University (OSSU)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '33e48dfa-8106-4fed-99b8-b3bf3840a7eb',
  'Open Source Society University (OSSU)',
  '4b4380bc-15ad-4819-9cb3-25ff1f6dd1d1',
  'OSSU Community',
  'Free self-taught computer science education curriculum equivalent to a complete undergraduate degree.',
  'https://github.com/ossu/computer-science',
  true
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = '33e48dfa-8106-4fed-99b8-b3bf3840a7eb';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '33e48dfa-8106-4fed-99b8-b3bf3840a7eb';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '33e48dfa-8106-4fed-99b8-b3bf3840a7eb';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', 'd4d30c02-7041-4b30-ad4f-56b70cd55aaf'); -- computer-science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', 'b1e67fe2-d2e3-4307-ab2d-8bc57c2043b5'); -- self-paced
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', 'd3e87f96-d2a8-4e2a-80fd-3adc59173861'); -- curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33e48dfa-8106-4fed-99b8-b3bf3840a7eb', '4375ef2a-b85b-4672-8ecd-f5d25957ba72'); -- free

-- University of Oxford
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '7e7c2214-fcee-46d9-b577-13807a77fb59',
  'University of Oxford',
  '096b20ce-df69-40cf-b5ed-582d16344f85',
  'University of Oxford',
  'The University of Oxford, founded in the 12th century, is the oldest university in the English-speaking world and consistently ranks #1 globally. For international students, annual costs range from $65,000-$80,000+ USD depending on the program, including tuition (£28,950-£44,240) and college fees, accommodation, and living expenses. Oxford operates a generous financial aid program distributing over £8.5 million annually to students from lower-income countries—Malaysian students may qualify for Oxford-Malaysia scholarships and college-specific awards. The collegiate system divides 24,000 students (including 12,000 undergraduates) across 39 independent colleges providing intimate learning communities. Oxford''s tutorial system offers personalized one-on-one or small group teaching with world-leading academics. The university excels across all disciplines with particular strength in humanities, sciences, medicine, and PPE (Philosophy, Politics, Economics). Acceptance rate for international students is approximately 10-15% depending on the course. Malaysian students have strong historical representation. Graduates achieve exceptional outcomes with high employability and admission to top graduate programs worldwide. The historic city provides inspiring environment with unparalleled library and museum resources.',
  'https://www.ox.ac.uk',
  true
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '7e7c2214-fcee-46d9-b577-13807a77fb59';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '7e7c2214-fcee-46d9-b577-13807a77fb59';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '7e7c2214-fcee-46d9-b577-13807a77fb59';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', 'b55aa445-b5d1-4f02-9e3f-3aa9ca36b1d1'); -- prestigious
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', 'cddc88fe-32d9-431f-b916-1f510a0a5f5b'); -- oxbridge
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('7e7c2214-fcee-46d9-b577-13807a77fb59', 'a2acf51b-0dc8-41a9-8ec3-d8864b16269e'); -- tutorial-system

-- Petronas Education Sponsorship Programme
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '5f432081-c20d-49e6-b002-7d6bc0f14377',
  'Petronas Education Sponsorship Programme',
  'aedfb486-fcfc-4fc1-9f44-f22e2c799c6e',
  'Petronas',
  'Scholarship program for outstanding students to pursue engineering and science degrees.',
  'https://www.petronas.com/',
  true
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = '5f432081-c20d-49e6-b002-7d6bc0f14377';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '5f432081-c20d-49e6-b002-7d6bc0f14377';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'hybrid') WHERE id = '5f432081-c20d-49e6-b002-7d6bc0f14377';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', 'd87e3036-d212-4f9b-b7c0-9dad4e25ecd3'); -- engineering
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', '1d174ec1-975c-40a4-bfbe-df70b7d9187f'); -- science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5f432081-c20d-49e6-b002-7d6bc0f14377', '698f7507-9e94-4225-9929-3a1d577cde3a'); -- corporate

-- Phillips Academy Andover
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '51e1943c-d768-4d5f-b77d-6d94e2677227',
  'Phillips Academy Andover',
  '48ceee54-efce-49cf-b3fe-b02b86a70e5e',
  'Phillips Academy',
  'Phillips Academy in Andover, Massachusetts, founded in 1778, is one of the oldest and most prestigious boarding schools in the United States. Serving grades 9-12, Andover enrolls approximately 1,150 students from all 50 states and 45+ countries. Annual tuition and boarding total approximately $65,000 USD. Andover is renowned for its need-blind admission policy and exceptional financial aid program—47% of students receive financial assistance averaging $54,000, with the school distributing over $30 million annually in aid. Many families with incomes under $75,000 pay nothing. The school offers over 300 courses across 18 departments, emphasizing inquiry-based learning and critical thinking. Graduates consistently gain admission to Harvard, Yale, MIT, Stanford, and other top universities, with Andover being the #1 feeder school to Harvard. The 500-acre campus features world-class facilities including the Addison Gallery of American Art. Notable alumni include Presidents George H.W. Bush and George W. Bush, and numerous leaders in various fields.',
  'https://www.andover.edu',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '51e1943c-d768-4d5f-b77d-6d94e2677227';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '51e1943c-d768-4d5f-b77d-6d94e2677227';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '51e1943c-d768-4d5f-b77d-6d94e2677227';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', 'b55aa445-b5d1-4f02-9e3f-3aa9ca36b1d1'); -- prestigious
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', '0bd90d4a-f22e-4839-a6b0-71abef98db9b'); -- financial-aid
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('51e1943c-d768-4d5f-b77d-6d94e2677227', 'b296bda2-3c80-4aef-ad6c-0e1aa9a705d0'); -- prep-school

-- Phillips Exeter Academy
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'dcd312fa-fd92-4c52-aade-eb9bf00f5455',
  'Phillips Exeter Academy',
  '1c08165c-baee-4f25-ab9d-a5b03ddd6689',
  'Phillips Exeter Academy',
  'Phillips Exeter Academy in Exeter, New Hampshire, is one of America''s most prestigious boarding schools, founded in 1781. Serving grades 9-12, Exeter pioneered the Harkness teaching method featuring discussion-based learning around oval tables. Annual tuition and boarding fees are approximately $65,000 USD. Remarkably, Exeter operates one of the largest secondary school financial aid programs in the world, with over $27 million distributed annually—approximately 46% of students receive aid averaging $53,000. The school is need-blind for US and Canadian applicants and meets 100% of demonstrated financial need. With 1,100 students from all 50 US states and 45+ countries, Exeter maintains exceptional diversity. The school offers over 450 courses with no AP classes—instead offering more rigorous, college-level coursework. Graduates gain admission to the world''s top universities with strong representation at Ivy League schools, MIT, Stanford, and international institutions. Notable alumni include Mark Zuckerberg and numerous political leaders.',
  'https://www.exeter.edu',
  true
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'dcd312fa-fd92-4c52-aade-eb9bf00f5455';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'dcd312fa-fd92-4c52-aade-eb9bf00f5455';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'dcd312fa-fd92-4c52-aade-eb9bf00f5455';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', 'b296bda2-3c80-4aef-ad6c-0e1aa9a705d0'); -- prep-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', 'fffce20f-d2d5-46a7-968e-0fcab5f5b588'); -- elite
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', '0bd90d4a-f22e-4839-a6b0-71abef98db9b'); -- financial-aid
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('dcd312fa-fd92-4c52-aade-eb9bf00f5455', '2b385c54-8852-43f2-8848-bb6f26fb7e2e'); -- harkness-method

-- PTPK Scholarship
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'e920876c-3dda-48c0-93db-432bbf69a407',
  'PTPK Scholarship',
  '3ad282e7-5588-4b44-a716-2656dafdaec7',
  'Kumpulan Wang Pinjaman Pelajaran Kerajaan',
  'Government Education Loan Fund for students from B40 families pursuing diploma and degree programs.',
  'https://www.ptpk.gov.my/',
  true
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = 'e920876c-3dda-48c0-93db-432bbf69a407';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'e920876c-3dda-48c0-93db-432bbf69a407';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'e920876c-3dda-48c0-93db-432bbf69a407';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', 'c1cf9119-2a8b-4b62-bb45-55a1b3831b3f'); -- b40
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', '81732784-de78-493b-9e1c-7d28cb0f182d'); -- diploma
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e920876c-3dda-48c0-93db-432bbf69a407', '30bad845-7553-4e17-88be-3f70f0e0f8a6'); -- degree

-- PTPTN Loan
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '86cd7c1b-f232-45fe-ada1-624cb082b650',
  'PTPTN Loan',
  'b6960614-cf53-4210-b2b8-5da05692a367',
  'Perbadanan Tabung Pendidikan Tinggi Nasional',
  'National Higher Education Fund for Malaysian students pursuing tertiary education at local institutions.',
  'https://www.ptptn.gov.my/',
  true
);
-- Link to category: financial-aid
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'financial-aid') WHERE id = '86cd7c1b-f232-45fe-ada1-624cb082b650';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '86cd7c1b-f232-45fe-ada1-624cb082b650';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '86cd7c1b-f232-45fe-ada1-624cb082b650';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', 'e56b7049-1575-451e-b545-0e8e356a8233'); -- loan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', '706ad109-dcd8-4fdb-917c-e37f4bc6c83b'); -- tertiary
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86cd7c1b-f232-45fe-ada1-624cb082b650', '6919d829-41fa-4319-9e74-e74c8076789b'); -- local

-- R for Data Science
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '86215d13-86fc-4773-ae79-06df6fd76b35',
  'R for Data Science',
  'ac983dce-2f20-49a7-97a6-b59766f662c9',
  'Hadley Wickham & Garrett Grolemund',
  'Free online book teaching R programming for data science and visualization.',
  'https://r4ds.had.co.nz/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '86215d13-86fc-4773-ae79-06df6fd76b35';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '86215d13-86fc-4773-ae79-06df6fd76b35';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '86215d13-86fc-4773-ae79-06df6fd76b35';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', '40aa1101-b5a3-4c68-b0d7-b92f78b78f0b'); -- data-science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', 'f6738209-c5a3-4dd0-aa0e-34a5f0fd4c24'); -- r-programming
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', '95723606-c922-4889-a8a2-007e669f423c'); -- visualization
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('86215d13-86fc-4773-ae79-06df6fd76b35', '20d94cae-c8d9-46ff-9e94-b4418f3c0a13'); -- book

-- Sekolah Menengah Sains Bagan Datoh (SABDA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '751777e7-290b-4d1b-90e0-aa3b8924bb02',
  'Sekolah Menengah Sains Bagan Datoh (SABDA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Bagan Datoh in Bagan Datoh, Perak is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SABDA provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, mathematics competitions, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. SABDA serves students from the Hilir Perak district and surrounding areas, providing rural and coastal communities with access to quality science education. The school emphasizes experimental learning and scientific research to develop analytical thinking and innovation capabilities. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SABDA graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://sabda.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '751777e7-290b-4d1b-90e0-aa3b8924bb02';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '751777e7-290b-4d1b-90e0-aa3b8924bb02';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '751777e7-290b-4d1b-90e0-aa3b8924bb02';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('751777e7-290b-4d1b-90e0-aa3b8924bb02', '22d012b0-6d32-4e9b-80fb-fc1928a6b04f'); -- perak

-- Sekolah Menengah Sains Hulu Terengganu (SAHUT)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '424b4237-b3a8-4a33-a2f7-d4e9b5d9099f',
  'Sekolah Menengah Sains Hulu Terengganu (SAHUT)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Hulu Terengganu, abbreviated as SAHUT, is a premier science secondary school located in Kuala Berang, Hulu Terengganu. As a Sekolah Berasrama Penuh (SBP), SAHUT provides fully residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) education. The school offers an intensive science-focused curriculum leading to SPM certification, designed to nurture future scientists, engineers, medical professionals, and technology innovators from the rural interior regions of Terengganu. SAHUT features well-equipped science laboratories, modern technology infrastructure, comprehensive library resources, and dedicated teaching staff committed to excellence in science education. Students engage actively in research projects, science competitions, innovation challenges, and academic olympiads at district, state, and national levels, developing strong scientific foundations and practical research skills. The school''s location in Hulu Terengganu provides unique opportunities to connect scientific learning with local environmental and cultural contexts. Beyond academics, SAHUT promotes holistic development through diverse co-curricular activities including robotics clubs, science societies, mathematics associations, sports programs, uniformed bodies, and community service initiatives. The boarding environment fosters discipline, independence, teamwork, and supportive peer relationships while maintaining rigorous academic standards. Students develop critical thinking, problem-solving abilities, and scientific inquiry skills essential for success in higher education and STEM careers. As a government SBP, SAHUT is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families, particularly those from rural areas. Admission is competitive based on academic achievement, science aptitude assessments, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). SAHUT graduates consistently excel in universities, particularly in medicine, engineering, and pure sciences, bringing positive change to their communities.',
  'https://sahut.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '424b4237-b3a8-4a33-a2f7-d4e9b5d9099f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '424b4237-b3a8-4a33-a2f7-d4e9b5d9099f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '424b4237-b3a8-4a33-a2f7-d4e9b5d9099f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', '5e234c1b-253d-4b3d-9f7a-8adc97c344fb'); -- terengganu
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('424b4237-b3a8-4a33-a2f7-d4e9b5d9099f', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Pokok Sena (SAINA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '3f76635f-e9f7-4e51-ab61-14a787ecb403',
  'Sekolah Menengah Sains Pokok Sena (SAINA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Pokok Sena in Pokok Sena, Kedah is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SAINA provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics competitions, mathematics olympiads, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. SAINA serves students from the Pokok Sena district and surrounding areas, providing rural communities with access to quality science education. The school emphasizes experimental learning and scientific inquiry to develop analytical thinking and innovation. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SAINA graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://www.saina.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '3f76635f-e9f7-4e51-ab61-14a787ecb403';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '3f76635f-e9f7-4e51-ab61-14a787ecb403';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '3f76635f-e9f7-4e51-ab61-14a787ecb403';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3f76635f-e9f7-4e51-ab61-14a787ecb403', '2648da4e-491d-438f-94f1-ef25b6cc1907'); -- kedah

-- Sekolah Menengah Sains Kuching (SAINSKU)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'a500d29a-a2e9-4643-ae03-1804dcb3fe0f',
  'Sekolah Menengah Sains Kuching (SAINSKU)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Kuching, known as SAINSKU, is a premier government Sekolah Berasrama Penuh (SBP) in Kuching, Sarawak, offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As one of the oldest and most established science schools in East Malaysia, SAINSKU provides comprehensive boarding facilities and a structured environment designed to nurture academic excellence among Sarawakian youth. The school is highly subsidized by the Malaysian government, with minimal fees ensuring quality boarding education remains accessible to B40 and M40 families across Sarawak''s diverse communities. Located in Sarawak''s capital city, SAINSKU serves as a crucial educational hub for students from throughout the state, including those from rural longhouses and interior regions who face unique geographical challenges in accessing quality education. Specializing in STEM education, SAINSKU features advanced science laboratories, modern technology centers, extensive library resources, and specialized equipment for practical work in physics, chemistry, biology, and mathematics. Students benefit from experienced educators, innovative teaching methodologies, and comprehensive co-curricular programs including science olympiads, robotics competitions, coding clubs, sports, uniformed bodies, and cultural activities celebrating Sarawak''s rich multicultural heritage. The boarding system instills discipline, independence, and collaborative skills while fostering lifelong friendships among students from diverse ethnic backgrounds. SAINSKU particularly emphasizes developing scientific thinking and research capabilities, with many students participating in national-level science competitions and innovation challenges. The school provides strong support systems to help students from rural areas adapt to urban boarding life while maintaining their cultural identities. Admission is highly competitive, based on primary school academic performance, co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SAINSKU graduates consistently achieve outstanding SPM results and gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM, medical, and engineering fields, contributing significantly to Sarawak''s development.',
  'https://sainsku.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'a500d29a-a2e9-4643-ae03-1804dcb3fe0f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'a500d29a-a2e9-4643-ae03-1804dcb3fe0f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'a500d29a-a2e9-4643-ae03-1804dcb3fe0f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', 'b9c83235-be23-49f0-8f56-75f1911b97f3'); -- sarawak
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a500d29a-a2e9-4643-ae03-1804dcb3fe0f', '999da399-782f-4427-97fd-4e8ef77b4aeb'); -- east-malaysia

-- Sekolah Menengah Sains Miri (SAINSRI)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '2e268651-7e7d-4de4-837d-bccc3d937d1a',
  'Sekolah Menengah Sains Miri (SAINSRI)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Miri, known as SAINSRI, is a premier government Sekolah Berasrama Penuh (SBP) in Miri, Sarawak, offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As the flagship science school in Sarawak''s northern region, SAINSRI provides comprehensive boarding facilities and structured academic programs designed to nurture STEM excellence among students from diverse backgrounds. The school is highly subsidized by the Malaysian government, with minimal fees ensuring quality boarding education remains accessible to B40 and M40 families across northern Sarawak. Strategically located in Miri, Malaysia''s petroleum hub, SAINSRI serves students from surrounding divisions including Limbang, Bintulu, and rural interior regions, providing crucial access to quality science education for communities often challenged by geographical distance and limited educational resources. The school features state-of-the-art science laboratories, modern technology centers, well-equipped mathematics facilities, and specialized equipment for practical work in physics, chemistry, biology, and environmental science. Students benefit from experienced educators, innovative teaching methodologies, and extensive co-curricular programs including science olympiads, robotics competitions, coding clubs, environmental conservation projects, sports, uniformed bodies, and cultural activities celebrating Sarawak''s multicultural society. The boarding environment instills discipline, resilience, and collaborative skills while providing supportive community for students far from home. SAINSRI particularly emphasizes scientific inquiry and environmental awareness, given Miri''s unique position as both an industrial center and gateway to important rainforest ecosystems. The school provides strong support systems to help students from longhouse communities and rural areas adapt to urban boarding life while maintaining their cultural identities. Many students overcome significant geographical isolation and economic constraints to pursue their educational dreams at SAINSRI. Admission is competitive, based on primary school academic performance, co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SAINSRI graduates consistently achieve outstanding SPM results and gain admission to top Form 6 programs, matriculation courses, and diploma programs, with many proceeding to Malaysian public universities in STEM, petroleum engineering, medical, and environmental science fields.',
  'https://sainsri.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '2e268651-7e7d-4de4-837d-bccc3d937d1a';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '2e268651-7e7d-4de4-837d-bccc3d937d1a';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '2e268651-7e7d-4de4-837d-bccc3d937d1a';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', 'b9c83235-be23-49f0-8f56-75f1911b97f3'); -- sarawak
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2e268651-7e7d-4de4-837d-bccc3d937d1a', '999da399-782f-4427-97fd-4e8ef77b4aeb'); -- east-malaysia

-- Sekolah Menengah Sains Setiu (SAIS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31',
  'Sekolah Menengah Sains Setiu (SAIS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Setiu, known as SAIS, is a distinguished science secondary school located in Setiu, Terengganu. As a Sekolah Berasrama Penuh (SBP), SAIS provides comprehensive residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) disciplines. The school offers an intensive science-focused curriculum leading to SPM certification, designed to develop future scientists, engineers, medical professionals, and technology innovators from Terengganu and surrounding regions. SAIS features modern science laboratories, advanced technology infrastructure, digital learning resources, and experienced educators passionate about science education excellence. Students actively participate in research projects, science fairs, innovation competitions, and academic olympiads at various levels, developing strong scientific knowledge, practical research skills, and analytical thinking abilities. The school''s coastal location provides unique opportunities for environmental and marine science studies. Beyond academics, SAIS promotes holistic student development through extensive co-curricular programs including robotics clubs, science societies, mathematics associations, sports teams, uniformed bodies, cultural activities, and community outreach initiatives. The boarding environment cultivates discipline, self-reliance, collaborative learning, and supportive peer relationships while maintaining high academic expectations. Students develop critical thinking, problem-solving capabilities, and scientific inquiry methods essential for success in higher education and STEM careers. As a government SBP, SAIS is highly subsidized with minimal fees, ensuring quality science education remains accessible to talented students from B40 and M40 families throughout Terengganu. Admission is competitive based on academic merit, science aptitude tests, and personal interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). SAIS graduates consistently excel in universities, particularly in medicine, engineering, pure sciences, and environmental studies, contributing to Malaysia''s scientific advancement and sustainable development.',
  'https://sais.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', '5e234c1b-253d-4b3d-9f7a-8adc97c344fb'); -- terengganu
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5c12b7a4-26f2-4d3c-ab7e-1290a3cf1a31', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Kepala Batas (SAKBA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '3b3535fb-5c07-4b0a-84e2-d59af6f57cf6',
  'Sekolah Menengah Sains Kepala Batas (SAKBA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Kepala Batas in Kepala Batas, Pulau Pinang is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SAKBA provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, mathematics competitions, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located in northern Penang, SAKBA serves students from across the state and provides access to quality science education in a boarding environment. The school emphasizes hands-on learning and scientific investigation to nurture critical thinking and problem-solving abilities. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SAKBA graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://sakba.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '3b3535fb-5c07-4b0a-84e2-d59af6f57cf6';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '3b3535fb-5c07-4b0a-84e2-d59af6f57cf6';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '3b3535fb-5c07-4b0a-84e2-d59af6f57cf6';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b3535fb-5c07-4b0a-84e2-d59af6f57cf6', '69ffb3ae-86b1-41a5-b797-dccd5ab0bfca'); -- pulau-pinang

-- Sekolah Menengah Sains Kota Tinggi (SAKTI)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '0d38f038-f40e-40a9-9d7f-04d833921fd4',
  'Sekolah Menengah Sains Kota Tinggi (SAKTI)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Kota Tinggi (SAKTI) in Kota Tinggi, Johor, is a science-focused boarding school dedicated to developing Malaysia''s future scientists, engineers, and innovators. SAKTI provides specialized STEM education in a supportive residential environment. The school offers Form 1-5 education with curriculum emphasis on science, technology, engineering, and mathematics, preparing students for competitive placements in technical and medical programs at universities. As a government Sekolah Menengah Sains, fees are highly subsidized, making quality science education accessible to talented students from B40 and M40 families. SAKTI features comprehensive facilities including well-equipped science laboratories for hands-on experiments in physics, chemistry, and biology, modern computer centers with educational technology, mathematics learning centers, library with scientific resources, sports facilities for physical development, and comfortable boarding quarters. The STEM curriculum emphasizes inquiry-based learning, experimental methodology, scientific thinking, problem-solving, and participation in science competitions and research projects. Experienced science teachers provide rigorous instruction and mentorship, guiding students in developing analytical skills and scientific reasoning. The boarding environment promotes collaborative learning, academic discipline, peer support, and development of independence and self-management skills. Students actively participate in science clubs, innovation projects, robotics, mathematics competitions, and various scientific activities. SAKTI balances intensive academic programs with co-curricular activities including sports, uniformed bodies, clubs, and leadership development programs. The school emphasizes character building, teamwork, and preparation for higher education challenges. Admission is competitive, based on primary school academic performance with preference for students showing strong aptitude in science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SAKTI graduates achieve strong academic results and successfully gain admission to medicine, engineering, and science programs at universities across Malaysia.',
  'https://sakti.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '0d38f038-f40e-40a9-9d7f-04d833921fd4';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '0d38f038-f40e-40a9-9d7f-04d833921fd4';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '0d38f038-f40e-40a9-9d7f-04d833921fd4';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0d38f038-f40e-40a9-9d7f-04d833921fd4', '6f949d9f-568d-4ea4-a904-96f6c92f873d'); -- johor

-- Sekolah Menengah Sains Kuching Utara (SAKURA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '4339c309-5c00-40c6-8adb-453e49e7ea0c',
  'Sekolah Menengah Sains Kuching Utara (SAKURA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Kuching Utara, known as SAKURA, is a distinguished government Sekolah Berasrama Penuh (SBP) in Kuching, Sarawak, offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a specialized science boarding school established to meet growing demand for quality STEM education in East Malaysia, SAKURA provides comprehensive residential facilities and structured academic programs promoting excellence. The school is highly subsidized by the Malaysian government, ensuring minimal fees make quality boarding education accessible to B40 and M40 families throughout Sarawak. Located in northern Kuching, SAKURA serves students from across Sarawak, including those from rural divisions, longhouse communities, and interior regions who seek quality science education despite geographical barriers unique to East Malaysia. The school features modern science laboratories, well-equipped technology centers, extensive library resources, and specialized facilities for advanced practical work in physics, chemistry, biology, and computer science. Students benefit from dedicated science educators, innovative teaching approaches, and comprehensive co-curricular programs including science competitions, robotics, mathematics olympiads, environmental clubs, sports, uniformed bodies, and cultural activities reflecting Sarawak''s diverse ethnic traditions. The boarding environment cultivates discipline, independence, and collaborative learning essential for academic success and personal development. SAKURA particularly emphasizes hands-on experimental learning and scientific inquiry to develop critical thinking and innovation capabilities. The school provides strong mentorship and support systems to help students from rural backgrounds adapt to boarding life and urban environments while maintaining connections with their cultural heritage. Many SAKURA students overcome significant geographical and socioeconomic challenges to pursue their educational ambitions. The diverse student community fosters intercultural understanding and lifelong friendships. Admission is highly competitive, based on primary school academic performance, co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SAKURA graduates consistently achieve excellent SPM results and gain admission to top Form 6 programs, matriculation courses, and diploma programs, with many continuing to Malaysian public universities in STEM, medical, and engineering disciplines.',
  'https://sakura.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '4339c309-5c00-40c6-8adb-453e49e7ea0c';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '4339c309-5c00-40c6-8adb-453e49e7ea0c';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '4339c309-5c00-40c6-8adb-453e49e7ea0c';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', 'b9c83235-be23-49f0-8f56-75f1911b97f3'); -- sarawak
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4339c309-5c00-40c6-8adb-453e49e7ea0c', '999da399-782f-4427-97fd-4e8ef77b4aeb'); -- east-malaysia

-- Sekolah Menengah Sains Muar (SAMURA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '77bd2921-8369-4ee5-bb38-4173c79d938a',
  'Sekolah Menengah Sains Muar (SAMURA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Muar (SAMURA) in Muar, Johor, is a science-focused boarding school committed to excellence in STEM education. SAMURA provides specialized science education in a fully residential environment, nurturing academically talented students to become future leaders in science, technology, engineering, and medicine. The school offers Form 1-5 education with strong curriculum emphasis on science, technology, engineering, and mathematics subjects, complemented by comprehensive language and humanities programs. As a government Sekolah Menengah Sains, fees are highly subsidized, enabling bright students from B40 and M40 families to access elite science education regardless of financial background. SAMURA features modern facilities including advanced science laboratories equipped for physics, chemistry, and biology experiments, computer centers with latest educational technology, mathematics resource rooms, extensive library with scientific literature and academic resources, sports complexes, and comfortable boarding facilities. The STEM-focused curriculum emphasizes hands-on experimentation, scientific inquiry, research methodology, analytical thinking, and active participation in science competitions, olympiads, and innovation challenges at various levels. Experienced science educators with strong academic backgrounds provide rigorous instruction, personalized guidance, and mentorship to develop students'' problem-solving abilities and scientific thinking. The boarding environment fosters collaborative learning, academic discipline, peer tutoring, and development of independence and time management skills. Students engage in diverse activities including science clubs, robotics projects, innovation initiatives, mathematics competitions, and research programs. SAMURA maintains balance between intensive academic excellence and comprehensive co-curricular development through sports, uniformed bodies, clubs, and leadership training. The school emphasizes character building, teamwork, and holistic student development. Admission is highly competitive, prioritizing students with exceptional academic performance and strong aptitude in science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SAMURA graduates consistently achieve excellent SPM results and secure competitive placements in medicine, engineering, and science programs at top universities.',
  'https://samura.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '77bd2921-8369-4ee5-bb38-4173c79d938a';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '77bd2921-8369-4ee5-bb38-4173c79d938a';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '77bd2921-8369-4ee5-bb38-4173c79d938a';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77bd2921-8369-4ee5-bb38-4173c79d938a', '6f949d9f-568d-4ea4-a904-96f6c92f873d'); -- johor

-- Sekolah Sultan Alam Shah (SAS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '12dc5b28-2cb0-4175-8c03-9e0b2cf3a762',
  'Sekolah Sultan Alam Shah (SAS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Sultan Alam Shah (SAS) in Putrajaya is a premier boys'' boarding school with a GPS of 1.17 in SPM 2024. Established in 2000 and named after Sultan Alam Shah of Selangor, SAS has quickly built a reputation for academic excellence and leadership development. The school offers Form 1-5 education for boys aged 13-17 in Malaysia''s administrative capital, providing students access to modern facilities and a conducive learning environment. As a government Sekolah Berasrama Penuh, fees are highly subsidized, ensuring talented students from B40 and M40 families can access quality boarding education. SAS emphasizes balanced development through rigorous academics, strong co-curricular programs, and character-building activities. The school''s strategic location in Putrajaya provides unique opportunities for educational visits to government institutions and exposure to national administration. State-of-the-art facilities include advanced science laboratories, ICT centers, sports complex, mosque, and modern dormitories. The boarding system instills discipline, independence, and time management skills essential for future success. Admission is competitive, based on primary school academic results (formerly UPSR), co-curricular achievements, and interviews. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SAS continues to produce outstanding graduates who excel in top Malaysian universities and beyond.',
  'https://www.sas.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '12dc5b28-2cb0-4175-8c03-9e0b2cf3a762';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '12dc5b28-2cb0-4175-8c03-9e0b2cf3a762';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '12dc5b28-2cb0-4175-8c03-9e0b2cf3a762';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', '69661814-6f02-4137-94f2-70ce7f5cdc47'); -- boys-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', '83466eed-22f2-4007-bfe1-ea8cbd2e088a'); -- top-ranked
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', '66d27815-be82-4712-892d-3dbd0a7a6f3b'); -- leadership
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', 'ab972bd4-5450-4f06-b531-a75e71f251ab'); -- putrajaya
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12dc5b28-2cb0-4175-8c03-9e0b2cf3a762', '318ca6ed-6b04-4fab-8f46-4f15e4f5cd46'); -- gps-117

-- Sekolah Menengah Sains Sembrong (SASEM)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '12c31a4b-84f9-44a3-8830-b149bb1d0c6f',
  'Sekolah Menengah Sains Sembrong (SASEM)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Sembrong (SASEM) in Kluang, Johor, is a science-focused boarding school dedicated to nurturing academically talented students with passion for STEM fields. SASEM provides specialized science education in a supportive residential environment, preparing students for higher education in scientific and technical disciplines. The school offers Form 1-5 education with curriculum emphasis on science, technology, engineering, and mathematics, while maintaining strong foundations in languages and humanities. As a government Sekolah Menengah Sains, fees are highly subsidized, making quality science education accessible to bright students from B40 and M40 families without financial burden. SASEM features comprehensive facilities including well-equipped science laboratories for conducting experiments in physics, chemistry, and biology, modern computer centers with educational software and technology, mathematics learning centers, library stocked with scientific resources and academic materials, sports facilities for physical development, and comfortable boarding quarters. The STEM curriculum emphasizes inquiry-based learning, hands-on experimentation, scientific methodology, critical thinking, and participation in science fairs, competitions, and research projects at various levels. Experienced science teachers provide rigorous instruction, guidance, and mentorship, helping students develop analytical abilities and problem-solving skills essential for scientific careers. The boarding environment promotes collaborative learning, academic excellence, peer support, and development of independence and self-discipline. Students actively engage in science clubs, innovation projects, robotics, mathematics olympiads, and various scientific activities. SASEM balances intensive academic programs with comprehensive co-curricular activities including sports, uniformed bodies, clubs, and leadership development. The school emphasizes character building, teamwork, and holistic student development. Admission is competitive, based on primary school academic performance with preference for students demonstrating strong aptitude and interest in science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SASEM graduates achieve strong academic results and successfully secure placements in medicine, engineering, and science programs at universities nationwide.',
  'https://sasem.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '12c31a4b-84f9-44a3-8830-b149bb1d0c6f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '12c31a4b-84f9-44a3-8830-b149bb1d0c6f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '12c31a4b-84f9-44a3-8830-b149bb1d0c6f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('12c31a4b-84f9-44a3-8830-b149bb1d0c6f', '6f949d9f-568d-4ea4-a904-96f6c92f873d'); -- johor

-- Sekolah Menengah Sains Tuanku Munawir (SASER)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '8bc74d75-3528-4742-9284-e60793005a46',
  'Sekolah Menengah Sains Tuanku Munawir (SASER)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Tuanku Munawir (SASER) in Seremban, Negeri Sembilan, is a science-focused boarding school with a GPS of 1.16 in SPM 2024, ranking among Malaysia''s top SBP institutions. Named after Tuanku Munawir, the Yang di-Pertuan Besar of Negeri Sembilan, the school specializes in STEM education while maintaining comprehensive academic programs. SASER offers Form 1-5 education with emphasis on science, technology, engineering, and mathematics, preparing students for competitive university placements in technical fields. As a government Sekolah Berasrama Penuh, fees are highly subsidized, enabling talented students from B40 and M40 families to access specialized science education without financial burden. The school features advanced science laboratories, computer facilities, mathematics resource centers, and modern boarding facilities. SASER''s curriculum combines rigorous academic training with hands-on experiments, research projects, and participation in national science competitions. The boarding environment fosters collaborative learning, peer tutoring, and development of independence and discipline. Experienced teachers with strong science backgrounds provide mentorship and guidance. Admission is highly competitive, prioritizing students with strong aptitude in science and mathematics, based on primary school results (formerly UPSR), co-curricular achievements, and interviews. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SASER graduates consistently gain admission to top engineering, medicine, and science programs at Malaysian and international universities.',
  'https://www.saser.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '8bc74d75-3528-4742-9284-e60793005a46';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '8bc74d75-3528-4742-9284-e60793005a46';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '8bc74d75-3528-4742-9284-e60793005a46';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', '83466eed-22f2-4007-bfe1-ea8cbd2e088a'); -- top-ranked
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', '4d342282-39e1-4640-aae3-aaf587a9e97b'); -- negeri-sembilan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8bc74d75-3528-4742-9284-e60793005a46', 'd304fc23-4004-467a-9bd2-8c3b68df1b41'); -- gps-116

-- Scrimba
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '3b05fe8b-6f44-47cb-8358-05f4bebe4c15',
  'Scrimba',
  '228857ea-4178-430d-a16d-fc3d2423e747',
  'Scrimba',
  'Interactive coding screencasts for learning web development with hands-on practice.',
  'https://scrimba.com/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = '3b05fe8b-6f44-47cb-8358-05f4bebe4c15';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '3b05fe8b-6f44-47cb-8358-05f4bebe4c15';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '3b05fe8b-6f44-47cb-8358-05f4bebe4c15';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', '07b14005-2d05-4845-8ef5-db7a9a126292'); -- web-development
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', 'd50c14b4-aa89-4558-949b-f720616fefce'); -- interactive
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', 'b104a5d6-5044-46e6-b1f8-8d4bc9464f77'); -- screencasts
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b05fe8b-6f44-47cb-8358-05f4bebe4c15', 'b739343e-a4d9-406c-837e-35fe4b5e5ef5'); -- practice

-- Sekolah Dato' Abdul Razak (SDAR)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '5afbf897-3e34-434f-8442-0254180db196',
  'Sekolah Dato'' Abdul Razak (SDAR)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Dato'' Abdul Razak (SDAR) in Seremban, Negeri Sembilan, is one of Malaysia''s most prestigious boys'' boarding schools, named after Tun Abdul Razak, the nation''s second Prime Minister. Established in 1963, SDAR has consistently maintained its position among the country''s top academic institutions. The school offers Form 1-5 education for boys aged 13-17, leading to SPM certification. As a government Sekolah Berasrama Penuh, fees are highly subsidized, making elite boarding education accessible to B40 and M40 families. SDAR''s curriculum emphasizes academic excellence across all streams while nurturing leadership qualities, critical thinking, and nation-building values. The school features modern facilities including well-equipped science laboratories, computer centers, extensive library, sports complexes, swimming pool, and comfortable dormitories. The boarding environment promotes discipline, independence, brotherhood, and lifelong friendships. SDAR is renowned for its strong co-curricular programs in sports, uniformed bodies, clubs, and societies, producing well-rounded students who excel beyond academics. Experienced teachers provide quality instruction and mentorship. Admission is highly competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessment. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SDAR alumni, known as ''Old Boys'', include prominent leaders in government, business, medicine, engineering, and various professional fields, creating a powerful support network that benefits current students and graduates.',
  'https://sdar.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '5afbf897-3e34-434f-8442-0254180db196';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '5afbf897-3e34-434f-8442-0254180db196';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '5afbf897-3e34-434f-8442-0254180db196';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', '69661814-6f02-4137-94f2-70ce7f5cdc47'); -- boys-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', '83466eed-22f2-4007-bfe1-ea8cbd2e088a'); -- top-ranked
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', '66d27815-be82-4712-892d-3dbd0a7a6f3b'); -- leadership
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', '4d342282-39e1-4640-aae3-aaf587a9e97b'); -- negeri-sembilan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5afbf897-3e34-434f-8442-0254180db196', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic

-- Sekolah Menengah Sains Batu Pahat (SEHEBAT)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '6685e65e-e351-46ac-8835-f50441ab41b3',
  'Sekolah Menengah Sains Batu Pahat (SEHEBAT)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Batu Pahat (SEHEBAT) in Batu Pahat, Johor, is a premier science-focused boarding school dedicated to cultivating Malaysia''s future generation of scientists, engineers, and medical professionals. SEHEBAT provides specialized STEM education in a fully residential environment. The school offers Form 1-5 education with curriculum emphasis on science, technology, engineering, and mathematics subjects, complemented by strong foundations in languages and humanities. As a government Sekolah Menengah Sains, fees are highly subsidized, making elite science education accessible to talented students from B40 and M40 families regardless of financial background. SEHEBAT features comprehensive facilities including well-equipped science laboratories for physics, chemistry, and biology experiments, modern computer centers with latest technology and educational software, mathematics learning centers, extensive library with scientific resources and journals, sports complexes for physical development, and comfortable boarding quarters. The STEM curriculum emphasizes inquiry-based learning, hands-on experimentation, scientific research methodology, critical analysis, and participation in science competitions at various levels. Experienced science educators with strong academic backgrounds provide rigorous instruction and personalized mentorship to develop students'' analytical thinking and problem-solving capabilities. The boarding environment promotes collaborative learning, academic discipline, peer support in understanding complex scientific concepts, and development of independence. Students actively engage in science clubs, innovation projects, robotics, mathematics olympiads, and research initiatives. SEHEBAT balances intensive academic programs with comprehensive co-curricular activities including sports, uniformed bodies, and leadership training. Admission is highly competitive, based on primary school academic performance with strong preference for students demonstrating exceptional aptitude in science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SEHEBAT graduates consistently excel in securing competitive placements in medicine, engineering, and pure science programs at top universities.',
  'https://sehebat.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '6685e65e-e351-46ac-8835-f50441ab41b3';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '6685e65e-e351-46ac-8835-f50441ab41b3';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '6685e65e-e351-46ac-8835-f50441ab41b3';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6685e65e-e351-46ac-8835-f50441ab41b3', '6f949d9f-568d-4ea4-a904-96f6c92f873d'); -- johor

-- Sekolah Menengah Sains Hulu Selangor (SEMASHUR)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '20192092-62ac-4936-b192-e71b6f4cd379',
  'Sekolah Menengah Sains Hulu Selangor (SEMASHUR)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Hulu Selangor (SEMASHUR) in Hulu Selangor, Selangor is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification with specialized focus on science and STEM education. As a fully residential science school, SEMASHUR provides comprehensive boarding facilities and structured environment promoting academic excellence, scientific inquiry, and innovation. The school is highly subsidized by the Malaysian government, with minimal fees making quality science boarding education accessible to B40 and M40 families, particularly benefiting students from rural and semi-urban areas of Hulu Selangor and surrounding districts. SEMASHUR specializes in developing future scientists, engineers, and STEM professionals through intensive science and mathematics curriculum emphasizing hands-on laboratory work, scientific research, problem-solving, and critical thinking. The school maintains well-equipped science laboratories, computer facilities, and research resources enabling students to conduct experiments and develop practical scientific skills. Advanced courses in Physics, Chemistry, Biology, Mathematics, and Additional Mathematics prepare students for STEM careers and university programs. The curriculum integrates theoretical knowledge with practical applications, encouraging innovation, creativity, and scientific reasoning. Located in Hulu Selangor, SEMASHUR serves as an educational hub providing quality science education to talented students from various backgrounds. Students benefit from experienced science teachers, modern facilities, and extensive co-curricular programs including science clubs, robotics, mathematics competitions, environmental projects, and research initiatives. Participation in science fairs and olympiads provides students opportunities to showcase their scientific talents. The boarding system instills discipline, time management, and collaborative skills essential for future success in scientific fields. SEMASHUR''s STEM-focused environment cultivates curiosity, analytical thinking, and passion for science. Admission is highly competitive, prioritizing students with strong aptitude and interest in science and mathematics, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SEMASHUR graduates consistently gain admission to top Form 6 science programs, matriculation, and foundation courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://semashur.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '20192092-62ac-4936-b192-e71b6f4cd379';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '20192092-62ac-4936-b192-e71b6f4cd379';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '20192092-62ac-4936-b192-e71b6f4cd379';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('20192092-62ac-4936-b192-e71b6f4cd379', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school

-- Sekolah Menengah Sains Rembau (SEMESRA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '8209a15b-4494-4e16-9b19-57909485896b',
  'Sekolah Menengah Sains Rembau (SEMESRA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Rembau (SEMESRA) in Rembau, Negeri Sembilan, is a science-focused boarding school dedicated to nurturing Malaysia''s future scientists, engineers, and medical professionals. SEMESRA provides specialized STEM education in a fully residential environment. The school offers Form 1-5 education with strong emphasis on science, technology, engineering, and mathematics subjects, complemented by comprehensive language and humanities programs. As a government Sekolah Menengah Sains, fees are highly subsidized, making elite science education accessible to talented students from B40 and M40 families. SEMESRA features well-equipped science laboratories for conducting experiments in physics, chemistry, and biology, modern computer facilities with latest educational software, mathematics learning centers, extensive library with scientific resources, sports complexes, and comfortable dormitories. The STEM curriculum emphasizes inquiry-based learning, hands-on experimentation, scientific research projects, and participation in science competitions at district, state, and national levels. Experienced science educators provide rigorous instruction and personalized mentorship to develop students'' analytical and problem-solving abilities. The boarding environment promotes collaborative learning, academic discipline, and peer support in tackling challenging STEM concepts. Students engage in science clubs, innovation projects, mathematics olympiads, and various co-curricular activities. SEMESRA balances intensive academic programs with sports, leadership training, and character development. Admission is competitive, based on primary school academic performance with strong preference for students demonstrating aptitude in science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SEMESRA graduates excel in gaining admission to competitive science, engineering, and medical programs at universities nationwide.',
  'https://semesra.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '8209a15b-4494-4e16-9b19-57909485896b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '8209a15b-4494-4e16-9b19-57909485896b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '8209a15b-4494-4e16-9b19-57909485896b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('8209a15b-4494-4e16-9b19-57909485896b', '4d342282-39e1-4640-aae3-aaf587a9e97b'); -- negeri-sembilan

-- Sekolah Menengah Sains Tengku Abdullah (SEMESTA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'd6b6daa7-a200-438f-b917-b928fca35a02',
  'Sekolah Menengah Sains Tengku Abdullah (SEMESTA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Tengku Abdullah, known as SEMESTA, is a premier science secondary school located in Raub, Pahang. Named after the Tengku Mahkota (Crown Prince) of Pahang, SEMESTA represents commitment to excellence in science education. As a Sekolah Berasrama Penuh (SBP), the school provides comprehensive residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) disciplines. SEMESTA offers an intensive science-focused curriculum leading to SPM certification, designed to nurture future scientists, engineers, medical professionals, and researchers. The school features modern science laboratories, advanced technology infrastructure, digital learning resources, and experienced educators passionate about scientific excellence. Students participate actively in research projects, science competitions, innovation challenges, and academic olympiads at various levels, developing strong foundations in scientific methodology and critical thinking. Beyond academics, SEMESTA emphasizes holistic student development through extensive co-curricular activities including science clubs, robotics teams, mathematics societies, sports programs, and uniformed bodies. The boarding environment cultivates discipline, independence, collaborative learning, and lasting friendships while maintaining rigorous academic standards. Students develop problem-solving abilities, analytical thinking, and scientific curiosity essential for success in higher education and STEM careers. As a government SBP, SEMESTA is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families throughout the region. Admission is competitive based on academic achievement, science aptitude assessments, and personal interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). SEMESTA graduates consistently excel in universities, particularly in medicine, engineering, and pure sciences, contributing to Malaysia''s scientific and technological development.',
  'https://semesta.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'd6b6daa7-a200-438f-b917-b928fca35a02';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'd6b6daa7-a200-438f-b917-b928fca35a02';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'd6b6daa7-a200-438f-b917-b928fca35a02';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', 'fdf04f88-f7b8-4a3f-982e-0311fd55b928'); -- pahang
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d6b6daa7-a200-438f-b917-b928fca35a02', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Teluk Intan (SEMESTI)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '3b31d0ac-baec-49af-8037-f838a172bbaf',
  'Sekolah Menengah Sains Teluk Intan (SEMESTI)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Teluk Intan in Teluk Intan, Perak is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SEMESTI provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics competitions, mathematics challenges, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located in Teluk Intan, Hilir Perak, SEMESTI serves students from southern Perak and provides quality science education in a boarding environment. The school emphasizes hands-on learning and scientific investigation to nurture critical thinking and problem-solving abilities essential for STEM careers. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SEMESTI graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://semesti.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '3b31d0ac-baec-49af-8037-f838a172bbaf';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '3b31d0ac-baec-49af-8037-f838a172bbaf';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '3b31d0ac-baec-49af-8037-f838a172bbaf';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('3b31d0ac-baec-49af-8037-f838a172bbaf', '22d012b0-6d32-4e9b-80fb-fc1928a6b04f'); -- perak

-- Sekolah Menengah Sains Sultan Haji Ahmad Shah (SEMSAS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '09d6b955-05be-468c-930d-be12df8e3fca',
  'Sekolah Menengah Sains Sultan Haji Ahmad Shah (SEMSAS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Sultan Haji Ahmad Shah, abbreviated as SEMSAS, is a distinguished science secondary school located in Kuantan, Pahang. Named in honor of the Sultan of Pahang, SEMSAS represents excellence in science education in the East Coast region. As a Sekolah Berasrama Penuh (SBP), the school provides fully residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) fields. SEMSAS offers an intensive science-focused curriculum leading to SPM certification, with particular emphasis on developing future scientists, engineers, and researchers. The school is equipped with advanced science laboratories, modern technology infrastructure, well-stocked libraries, and experienced teaching faculty dedicated to nurturing scientific excellence. Students engage in research projects, science fairs, innovation competitions, and STEM olympiads at district, state, and national levels. Beyond academics, SEMSAS promotes holistic development through comprehensive co-curricular programs including robotics clubs, mathematics societies, science associations, sports teams, and uniformed bodies. The boarding environment fosters discipline, teamwork, independent learning, and strong peer support networks. Students develop critical thinking, problem-solving skills, and scientific inquiry methods essential for higher education and professional careers. As a government SBP, SEMSAS is highly subsidized with minimal fees, ensuring quality science education remains accessible to talented students from B40 and M40 families. Admission is competitive based on academic merit, science aptitude, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). SEMSAS alumni have excelled in medical schools, engineering programs, and scientific research institutions, contributing significantly to Malaysia''s technological advancement.',
  'https://semsas.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '09d6b955-05be-468c-930d-be12df8e3fca';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '09d6b955-05be-468c-930d-be12df8e3fca';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '09d6b955-05be-468c-930d-be12df8e3fca';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', 'fdf04f88-f7b8-4a3f-982e-0311fd55b928'); -- pahang
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('09d6b955-05be-468c-930d-be12df8e3fca', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Berasrama Penuh Integrasi Rawang (SEPINTAR)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'abb5d7c9-d622-4dfa-8cff-9d1a3834545f',
  'Sekolah Berasrama Penuh Integrasi Rawang (SEPINTAR)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Rawang (SEPINTAR) in Rawang, Selangor is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SEPINTAR provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. As an integrated school, SEPINTAR offers a balanced curriculum combining academic rigor with co-curricular development, preparing students for diverse pathways in science, arts, and technical fields. The school emphasizes holistic education through its integrated approach, nurturing well-rounded individuals equipped with critical thinking, leadership, and collaborative skills. Students benefit from experienced teachers, modern facilities, and extensive co-curricular programs including sports, uniformed bodies, clubs, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. SEPINTAR''s integrated curriculum ensures students receive comprehensive exposure to various fields of study while maintaining strong academic foundations. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SEPINTAR graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities across diverse disciplines.',
  'https://sepintar.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'abb5d7c9-d622-4dfa-8cff-9d1a3834545f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'abb5d7c9-d622-4dfa-8cff-9d1a3834545f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'abb5d7c9-d622-4dfa-8cff-9d1a3834545f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('abb5d7c9-d622-4dfa-8cff-9d1a3834545f', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum

-- Sekolah Menengah Sains Raja Tun Azlan Shah (SERATAS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'c343941e-9024-496b-925d-08123ad619e9',
  'Sekolah Menengah Sains Raja Tun Azlan Shah (SERATAS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Raja Tun Azlan Shah in Taiping, Perak is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SERATAS provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics competitions, innovation fairs, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located in the historic town of Taiping, SERATAS is named after the late Sultan of Perak and provides students with a rich learning environment combining modern facilities with cultural heritage. The school has established a strong track record in producing excellent SPM results and nurturing future scientists and engineers. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SERATAS graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://seratas.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'c343941e-9024-496b-925d-08123ad619e9';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'c343941e-9024-496b-925d-08123ad619e9';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'c343941e-9024-496b-925d-08123ad619e9';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c343941e-9024-496b-925d-08123ad619e9', '22d012b0-6d32-4e9b-80fb-fc1928a6b04f'); -- perak

-- Sekolah Menengah Sains Seri Puteri, Sentul (SESERI)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '0fb6ef1d-54cb-4822-bb89-d6e9d61ea733',
  'Sekolah Menengah Sains Seri Puteri, Sentul (SESERI)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Seri Puteri (SESERI) in Sentul, Kuala Lumpur is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification with specialized focus on science and STEM education for girls. As a fully residential girls'' science school, SESERI provides comprehensive boarding facilities and structured environment promoting academic excellence, scientific inquiry, innovation, and female empowerment in STEM fields. The school is highly subsidized by the Malaysian government, with minimal fees making quality science boarding education accessible to B40 and M40 families. SESERI specializes in developing future female scientists, engineers, and STEM professionals through intensive science and mathematics curriculum emphasizing hands-on laboratory work, scientific research, problem-solving, and critical thinking. The school creates a supportive environment specifically designed to encourage and nurture girls'' interest and confidence in traditionally male-dominated STEM fields. Well-equipped science laboratories, computer facilities, and research resources enable students to conduct experiments and develop practical scientific skills. Advanced courses in Physics, Chemistry, Biology, Mathematics, and Additional Mathematics prepare students for competitive STEM careers and university programs. The curriculum integrates theoretical knowledge with practical applications, encouraging innovation, creativity, and scientific reasoning. Students benefit from experienced science teachers who serve as role models, modern facilities, and extensive co-curricular programs including science clubs, robotics, coding, mathematics competitions, and research projects tailored to empower young women in STEM. Participation in national and international science competitions provides opportunities to showcase scientific talents. The girls-only boarding environment fosters strong sisterhood bonds, leadership development, mutual support, and confidence-building. The boarding system instills discipline, time management, and collaborative skills essential for future success in scientific fields. SESERI''s STEM-focused environment cultivates scientific curiosity, analytical thinking, and passion for science among young women. Admission is highly competitive, prioritizing female students with strong aptitude and interest in science and mathematics, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SESERI graduates consistently gain admission to top Form 6 science programs, matriculation, A-Levels, and foundation courses, with many proceeding to prestigious Malaysian public universities in STEM fields including engineering, medicine, pharmacy, and pure sciences.',
  'https://seseri.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '0fb6ef1d-54cb-4822-bb89-d6e9d61ea733';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '0fb6ef1d-54cb-4822-bb89-d6e9d61ea733';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '0fb6ef1d-54cb-4822-bb89-d6e9d61ea733';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', '2290ab8a-b8da-413e-91a3-ce88147cbdb9'); -- kuala-lumpur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0fb6ef1d-54cb-4822-bb89-d6e9d61ea733', 'a3ecdefa-1996-4679-9013-9cae23da3ccc'); -- girls-school

-- Sekolah Menengah Sains Sultan Mahmud (SESMA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7',
  'Sekolah Menengah Sains Sultan Mahmud (SESMA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Sultan Mahmud, commonly known as SESMA, is a prestigious science secondary school located in Kuala Nerus, Terengganu. Named after the Sultan of Terengganu, SESMA exemplifies excellence in science education in the East Coast region. As a Sekolah Berasrama Penuh (SBP), the school provides fully residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) fields. SESMA offers an intensive science-focused curriculum leading to SPM certification, with strong emphasis on developing future scientists, engineers, medical professionals, and researchers. The school is equipped with state-of-the-art science laboratories, modern computer facilities, comprehensive library resources, and dedicated teaching staff committed to nurturing scientific talent. Students engage actively in research projects, science fairs, innovation competitions, and national STEM olympiads, developing strong foundations in scientific inquiry and methodology. Beyond academics, SESMA promotes holistic development through extensive co-curricular programs including robotics clubs, science societies, mathematics associations, sports teams, uniformed bodies, and cultural activities. The boarding environment fosters discipline, teamwork, self-management, and supportive peer relationships while maintaining high academic expectations. Students develop critical thinking, analytical skills, and scientific problem-solving abilities essential for higher education and professional success. As a government SBP, SESMA is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families throughout Terengganu. Admission is competitive based on academic merit, science aptitude tests, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). SESMA graduates have excelled in prestigious universities, particularly in medicine, engineering, and pure sciences, contributing significantly to Malaysia''s scientific advancement and technological innovation.',
  'https://sesma.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', '5e234c1b-253d-4b3d-9f7a-8adc97c344fb'); -- terengganu
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('697d8ef9-cc55-4800-a6b9-a25ce8cf9fc7', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Tapah (SESTA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'd999aaa2-dfe7-40b8-a9c3-10d2f204bebf',
  'Sekolah Menengah Sains Tapah (SESTA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Tapah in Tapah, Perak is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SESTA provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, mathematics olympiads, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located in Tapah, central Perak, SESTA serves students from various districts and provides access to quality science education in a peaceful, conducive learning environment. The school emphasizes inquiry-based learning and practical experimentation to develop scientific thinking and innovation skills. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SESTA graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://sesta.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'd999aaa2-dfe7-40b8-a9c3-10d2f204bebf';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'd999aaa2-dfe7-40b8-a9c3-10d2f204bebf';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'd999aaa2-dfe7-40b8-a9c3-10d2f204bebf';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('d999aaa2-dfe7-40b8-a9c3-10d2f204bebf', '22d012b0-6d32-4e9b-80fb-fc1928a6b04f'); -- perak

-- Sekolah Menengah Sains Kuala Terengganu (SESTER)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '23a43b99-ddfa-4fab-a706-30f2c7e35d7b',
  'Sekolah Menengah Sains Kuala Terengganu (SESTER)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Kuala Terengganu, widely known as SESTER, is a premier science secondary school located in the state capital of Kuala Terengganu. As a Sekolah Berasrama Penuh (SBP), SESTER provides fully residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) disciplines. The school offers an intensive science-focused curriculum leading to SPM certification, with strong emphasis on developing future scientists, engineers, researchers, and medical professionals. SESTER features advanced science laboratories, modern technology facilities, comprehensive library collections, and highly qualified teaching staff committed to excellence in science education. Students engage actively in research projects, science fairs, innovation competitions, and national academic olympiads, developing robust scientific knowledge and practical research skills. The school''s strategic location in the state capital provides additional opportunities for collaborations with universities, research institutions, and industry partners. Beyond academics, SESTER promotes holistic student development through extensive co-curricular programs including robotics teams, science clubs, mathematics societies, sports activities, uniformed bodies, and cultural programs. The boarding environment fosters discipline, self-reliance, collaborative learning, and strong peer support networks while maintaining high academic expectations. Students develop critical thinking, analytical reasoning, and scientific problem-solving abilities essential for university education and professional careers in STEM fields. As a government SBP, SESTER is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families throughout Terengganu and neighboring states. Admission is competitive based on academic merit, science aptitude tests, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). SESTER graduates have achieved remarkable success in prestigious universities, particularly in medicine, engineering, and pure sciences.',
  'https://sester.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '23a43b99-ddfa-4fab-a706-30f2c7e35d7b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '23a43b99-ddfa-4fab-a706-30f2c7e35d7b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '23a43b99-ddfa-4fab-a706-30f2c7e35d7b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', '5e234c1b-253d-4b3d-9f7a-8adc97c344fb'); -- terengganu
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('23a43b99-ddfa-4fab-a706-30f2c7e35d7b', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Tuanku Aishah Rohani (SGS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '10b04f2c-1d34-4090-b30f-e4f31d5ef7a4',
  'Sekolah Menengah Sains Tuanku Aishah Rohani (SGS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Tuanku Aishah Rohani (SGS) in Seremban, Negeri Sembilan, is a premier science-focused boarding school named after the late Tuanku Aishah Rohani, wife of Yang di-Pertuan Agong. SGS specializes in providing advanced STEM education for academically talented students. The school offers Form 1-5 education with curriculum emphasis on science, technology, engineering, and mathematics, preparing students for competitive placements in top technical and medical programs. As a government Sekolah Menengah Sains, fees are highly subsidized, enabling bright students from B40 and M40 families to access specialized science education regardless of financial background. SGS features state-of-the-art science laboratories for physics, chemistry, biology, and advanced sciences, modern computer centers with latest technology, mathematics resource rooms, well-equipped library, sports facilities, and comfortable boarding quarters. The STEM-focused curriculum includes hands-on experiments, research projects, science fairs, and participation in national and international science competitions. Experienced science teachers with strong academic backgrounds provide rigorous instruction and mentorship. The boarding environment fosters collaborative learning, peer tutoring, and development of scientific thinking and problem-solving skills. Students engage in science clubs, robotics, innovation projects, and academic competitions. Co-curricular activities balance academics with sports and leadership development. Admission is highly competitive, prioritizing students with exceptional aptitude in science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SGS graduates consistently secure placements in medicine, engineering, and science programs at top Malaysian and international universities.',
  'https://sgs.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '10b04f2c-1d34-4090-b30f-e4f31d5ef7a4';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '10b04f2c-1d34-4090-b30f-e4f31d5ef7a4';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '10b04f2c-1d34-4090-b30f-e4f31d5ef7a4';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('10b04f2c-1d34-4090-b30f-e4f31d5ef7a4', '4d342282-39e1-4640-aae3-aaf587a9e97b'); -- negeri-sembilan

-- Sekolah Sains Sultan Haji Ahmad Shah Pekan (SHAH Pekan)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '2d2836ce-3e1d-42d8-85df-43fdfad5df0d',
  'Sekolah Sains Sultan Haji Ahmad Shah Pekan (SHAH Pekan)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Sains Sultan Haji Ahmad Shah, commonly known as SHAH Pekan, is a premier science secondary school located in Pekan, Pahang. Named after the Sultan of Pahang, the school represents educational excellence in the East Coast region. As a Sekolah Berasrama Penuh (SBP), SHAH Pekan provides fully residential education for Forms 1-5 (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) education. The school offers a rigorous science-focused curriculum leading to SPM certification, with advanced laboratory facilities, modern teaching equipment, and experienced educators dedicated to nurturing future scientists and engineers. Students benefit from intensive academic programs, research projects, and STEM competitions at state and national levels. Beyond academics, SHAH Pekan emphasizes holistic development through extensive co-curricular activities including robotics clubs, science societies, sports, and uniformed bodies. The boarding environment fosters independence, discipline, and strong peer relationships. As a government SBP, the school is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families. Admission is competitive, based on primary school achievements, aptitude tests, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). SHAH Pekan alumni have pursued successful careers in medicine, engineering, research, and various scientific fields, contributing significantly to Malaysia''s development.',
  'https://shahpekan.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '2d2836ce-3e1d-42d8-85df-43fdfad5df0d';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '2d2836ce-3e1d-42d8-85df-43fdfad5df0d';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '2d2836ce-3e1d-42d8-85df-43fdfad5df0d';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', 'fdf04f88-f7b8-4a3f-982e-0311fd55b928'); -- pahang
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d2836ce-3e1d-42d8-85df-43fdfad5df0d', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Lahad Datu (SHIELD)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '4f723904-19cb-4c3f-8c7f-cd8c4bc550db',
  'Sekolah Menengah Sains Lahad Datu (SHIELD)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Lahad Datu, known as SHIELD, is a distinguished government Sekolah Berasrama Penuh (SBP) in Lahad Datu, Sabah, offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a specialized science boarding school in East Malaysia''s eastern corridor, SHIELD provides comprehensive residential facilities and structured academic programs promoting excellence in STEM education. The school is highly subsidized by the Malaysian government, ensuring minimal fees make quality boarding education accessible to B40 and M40 families throughout Sabah''s east coast region. Strategically located in Lahad Datu, SHIELD serves students from surrounding districts including Sandakan, Tawau, and Semporna, offering crucial educational opportunities to communities often challenged by distance from major urban centers. The school features modern science laboratories, well-equipped mathematics and ICT centers, and specialized facilities for practical work in physics, chemistry, and biology. Students benefit from dedicated science educators, innovative teaching approaches, and comprehensive co-curricular programs including science competitions, robotics, environmental clubs, sports, uniformed bodies, and cultural activities reflecting Sabah''s multicultural society. The boarding environment cultivates discipline, resilience, and collaborative learning essential for academic and personal success. SHIELD particularly emphasizes developing scientific literacy and environmental awareness, given Lahad Datu''s proximity to important ecological areas. Many students overcome geographical isolation and economic constraints to pursue their educational dreams at SHIELD. The school''s supportive community helps students adapt to boarding life while maintaining connections with their diverse cultural backgrounds. Admission is competitive, based on primary school academic performance, co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SHIELD graduates consistently achieve strong SPM results and gain admission to top Form 6 programs, matriculation courses, and diploma programs, with many continuing to Malaysian public universities in STEM, medical, and engineering fields.',
  'https://shield.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '4f723904-19cb-4c3f-8c7f-cd8c4bc550db';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '4f723904-19cb-4c3f-8c7f-cd8c4bc550db';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '4f723904-19cb-4c3f-8c7f-cd8c4bc550db';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', 'c560e3fd-abd1-40df-b3c8-1eaa3137b131'); -- sabah
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4f723904-19cb-4c3f-8c7f-cd8c4bc550db', '999da399-782f-4427-97fd-4e8ef77b4aeb'); -- east-malaysia

-- Sekolah Berasrama Penuh Integrasi Selandar (SISME)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '827fcfa0-cb4a-43b5-8697-ee56a0be5f7f',
  'Sekolah Berasrama Penuh Integrasi Selandar (SISME)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Berasrama Penuh Integrasi Selandar (SISME) in Melaka is an integrated boarding school offering comprehensive education that combines academic excellence with Islamic studies. SISME serves both boys and girls in a fully residential setting, providing balanced education in conventional subjects and Islamic knowledge. The school offers Form 1-5 education with an integrated curriculum covering mathematics, sciences, languages, humanities, alongside Quranic studies, Arabic language, Islamic jurisprudence (fiqh), and Islamic values education. As a government SBP Integrasi school, fees are highly subsidized, making quality integrated education accessible to B40 and M40 families seeking both academic achievement and Islamic education for their children. SISME features modern facilities including science laboratories, computer centers, Islamic studies rooms, well-stocked library with Islamic and academic resources, beautiful surau for daily prayers and religious activities, sports facilities, and separate comfortable boarding quarters for male and female students. The integrated approach ensures students develop strong academic foundations while deepening their understanding and practice of Islamic principles. Experienced teachers and religious educators provide instruction and guidance. The boarding environment promotes Islamic values, discipline, mutual respect, academic excellence, and spiritual growth. Students participate in diverse co-curricular activities including Quran recitation competitions, Islamic debates, academic competitions, sports, and uniformed bodies. SISME emphasizes character development, leadership skills, and preparation for higher education in both conventional and Islamic institutions. Admission is competitive, based on academic performance and demonstrated commitment to Islamic education. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SISME graduates are well-rounded individuals prepared for success in various academic and professional pathways.',
  'https://sisme.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '827fcfa0-cb4a-43b5-8697-ee56a0be5f7f';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '827fcfa0-cb4a-43b5-8697-ee56a0be5f7f';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '827fcfa0-cb4a-43b5-8697-ee56a0be5f7f';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', '389bcb5f-5e1f-4284-aff1-5133862c241c'); -- integrated-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', 'fe467450-a6fa-4016-adf5-4a770a197d3a'); -- islamic-education
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('827fcfa0-cb4a-43b5-8697-ee56a0be5f7f', 'e1fb11cb-d0d2-416f-ba7a-3f90d9c19f4e'); -- melaka

-- Sekolah Menengah Sains Machang (SMACH)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '33d9db5d-4621-4c83-bb09-f61428e734bf',
  'Sekolah Menengah Sains Machang (SMACH)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Machang, abbreviated as SMACH, is a distinguished science secondary school located in Machang, Kelantan. As a Sekolah Berasrama Penuh (SBP), SMACH provides comprehensive residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) education. The school offers an intensive science-focused curriculum leading to SPM certification, designed to nurture future scientists, engineers, medical professionals, and technology innovators from Kelantan and surrounding regions. SMACH features well-equipped science laboratories, modern technology infrastructure, digital learning resources, and dedicated teaching staff committed to excellence in science education. Students actively participate in research projects, science competitions, innovation challenges, and academic olympiads at district, state, and national levels, developing strong scientific foundations and practical research skills. The school emphasizes hands-on learning, experimental methodology, and inquiry-based education to foster genuine scientific understanding and curiosity. Beyond academics, SMACH promotes holistic development through diverse co-curricular activities including robotics clubs, science societies, mathematics associations, sports programs, uniformed bodies, and community service initiatives. The boarding environment cultivates discipline, independence, teamwork, and lasting friendships while maintaining rigorous academic standards. Students develop critical thinking, problem-solving abilities, and analytical skills essential for success in higher education and STEM careers. As a government SBP, SMACH is highly subsidized with minimal fees, ensuring quality science education remains accessible to talented students from B40 and M40 families in Kelantan, particularly those from rural areas. Admission is competitive based on academic achievement, science aptitude assessments, and personal interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). SMACH graduates consistently excel in universities, particularly in medicine, engineering, and pure sciences, contributing to Malaysia''s scientific community and bringing positive change to their home communities.',
  'https://smach.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '33d9db5d-4621-4c83-bb09-f61428e734bf';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '33d9db5d-4621-4c83-bb09-f61428e734bf';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '33d9db5d-4621-4c83-bb09-f61428e734bf';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', '459659e3-6f42-4e5c-82b7-c36ae26504ce'); -- kelantan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('33d9db5d-4621-4c83-bb09-f61428e734bf', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Agama Persekutuan Kajang (SMAPK)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '979a6547-ca0b-4f6b-9252-a5d1e3ecf08e',
  'Sekolah Menengah Agama Persekutuan Kajang (SMAPK)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Agama Persekutuan Kajang (SMAPK) in Kajang, Selangor is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification with a unique focus on Islamic education. As a fully residential Islamic school, SMAPK provides comprehensive boarding facilities and structured environment promoting academic excellence, spiritual development, strong moral character, and Islamic values. The school is highly subsidized by the Malaysian government, with minimal fees making quality Islamic boarding education accessible to B40 and M40 families. SMAPK offers a comprehensive curriculum integrating mainstream academic subjects (science, mathematics, languages, humanities) with extensive Islamic studies including Quran recitation and memorization (tahfiz), Islamic jurisprudence (fiqh), Arabic language, Islamic history, and theology. This dual-stream approach produces graduates who excel academically while possessing deep Islamic knowledge and strong Islamic character. The school emphasizes the cultivation of Islamic values, ethics, and practices in daily life, preparing students to become knowledgeable Muslims who contribute positively to society. Students benefit from experienced teachers including qualified ustaz and ustazah, modern facilities including prayer halls and tahfiz centers, and extensive co-curricular programs encompassing sports, uniformed bodies, Islamic societies, and Arabic language clubs. The boarding system instills discipline, time management, collaborative skills, and adherence to Islamic principles essential for future success. SMAPK''s Islamic environment provides a nurturing atmosphere for spiritual growth alongside academic achievement. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, interview assessments, and demonstrated commitment to Islamic education. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SMAPK graduates consistently gain admission to top Form 6 programs, matriculation, diploma courses, and Islamic studies programs, with many proceeding to Malaysian public universities and Islamic universities both locally and abroad.',
  'https://smapk.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '979a6547-ca0b-4f6b-9252-a5d1e3ecf08e';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '979a6547-ca0b-4f6b-9252-a5d1e3ecf08e';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '979a6547-ca0b-4f6b-9252-a5d1e3ecf08e';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('979a6547-ca0b-4f6b-9252-a5d1e3ecf08e', 'fe467450-a6fa-4016-adf5-4a770a197d3a'); -- islamic-education

-- Sekolah Menengah Agama Persekutuan Labu (SMAPL)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '4e921e37-2e44-4fd2-8f24-7d49b56b7b67',
  'Sekolah Menengah Agama Persekutuan Labu (SMAPL)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Agama Persekutuan Labu (SMAPL) in Labu, Negeri Sembilan, is a prestigious Islamic boarding school under the Ministry of Education''s religious school system. SMAPL provides comprehensive Islamic education alongside conventional academic subjects for both boys and girls aged 13-17. The school offers Form 1-5 education with a curriculum that integrates Islamic studies, Arabic language, Quranic memorization, and modern academic subjects including mathematics, sciences, and languages. As a government-funded Islamic boarding school, fees are highly subsidized, enabling B40 and M40 families to provide their children with quality Islamic education without financial burden. SMAPL features well-equipped facilities including Islamic studies centers, science laboratories, computer labs, extensive library with Islamic literature, beautiful surau, sports complexes, and separate comfortable dormitories for male and female students. The school emphasizes character development based on Islamic values, academic excellence, and preparation for both religious and secular higher education pathways. Experienced teachers, including ustaz and ustazah with strong Islamic credentials, provide guidance and mentorship. Students engage in Quran memorization programs, Islamic competitions, Arabic debates, and various co-curricular activities. The boarding environment nurtures Islamic brotherhood and sisterhood, discipline, and spiritual growth. Admission is competitive, prioritizing students with strong academic foundations and commitment to Islamic education. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SMAPL graduates pursue diverse pathways including Islamic universities, conventional universities, and professional careers, equipped with both Islamic knowledge and modern skills.',
  'https://smapl.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '4e921e37-2e44-4fd2-8f24-7d49b56b7b67';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '4e921e37-2e44-4fd2-8f24-7d49b56b7b67';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '4e921e37-2e44-4fd2-8f24-7d49b56b7b67';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', 'fe467450-a6fa-4016-adf5-4a770a197d3a'); -- islamic-education
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('4e921e37-2e44-4fd2-8f24-7d49b56b7b67', '4d342282-39e1-4640-aae3-aaf587a9e97b'); -- negeri-sembilan

-- Sekolah Menengah Sains Sabah (SMESH)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'ed301de7-0458-4f94-96c3-1a40619204e3',
  'Sekolah Menengah Sains Sabah (SMESH)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Sabah, located in Kota Kinabalu, is a premier government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As one of the flagship science schools in East Malaysia, SMESH provides comprehensive boarding facilities and a structured environment designed to nurture academic excellence and character development among Sabahan youth. The school is highly subsidized by the Malaysian government, with minimal fees ensuring quality boarding education remains accessible to B40 and M40 families across Sabah. Specializing in STEM education, SMESH features state-of-the-art science laboratories, modern technology centers, and specialized equipment for advanced practical work in physics, chemistry, biology, and computer science. Students benefit from experienced educators, innovative teaching methodologies, and extensive co-curricular programs including science olympiads, robotics, coding clubs, sports, uniformed bodies, and cultural activities celebrating Sabah''s diverse heritage. The boarding environment instills discipline, independence, and collaborative skills essential for success in higher education and careers. SMESH serves as a crucial educational hub for students from across Sabah, including rural and interior communities, providing equal access to quality science education despite geographical challenges unique to East Malaysia. The school emphasizes hands-on experimental learning and scientific inquiry to develop critical thinking and innovation. Many SMESH students overcome significant geographical and socioeconomic barriers to pursue their academic ambitions. Admission is highly competitive, based on primary school academic performance, co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SMESH graduates consistently achieve outstanding SPM results and gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities, particularly in STEM and medical fields.',
  'https://smesh.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'ed301de7-0458-4f94-96c3-1a40619204e3';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'ed301de7-0458-4f94-96c3-1a40619204e3';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'ed301de7-0458-4f94-96c3-1a40619204e3';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', 'c560e3fd-abd1-40df-b3c8-1eaa3137b131'); -- sabah
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ed301de7-0458-4f94-96c3-1a40619204e3', '999da399-782f-4427-97fd-4e8ef77b4aeb'); -- east-malaysia

-- Sekolah Menengah Sains Labuan (SMEXCEL)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '6cfd621a-32fc-4020-b3b6-8067b5418fbb',
  'Sekolah Menengah Sains Labuan (SMEXCEL)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Labuan, known as SMEXCEL, is a distinguished government Sekolah Berasrama Penuh (SBP) on Labuan island, offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As the premier science boarding school in this Federal Territory, SMEXCEL provides comprehensive residential facilities and structured academic programs promoting STEM excellence in a unique island setting. The school is highly subsidized by the Malaysian government, with minimal fees ensuring quality boarding education remains accessible to B40 and M40 families from Labuan and surrounding regions. Strategically located on Labuan, a duty-free island and international offshore financial center, SMEXCEL offers students distinctive opportunities shaped by the island''s maritime economy, port facilities, and strategic position in Southeast Asian trade routes. The school features modern science laboratories, well-equipped technology centers, and specialized facilities for practical work in physics, chemistry, biology, and mathematics, with particular emphasis on maritime science and environmental studies relevant to island ecosystems. Students benefit from experienced educators, innovative teaching approaches, and comprehensive co-curricular programs including science competitions, robotics, coding clubs, maritime activities, sports, uniformed bodies, and cultural activities reflecting Labuan''s diverse community. The island environment provides unique learning opportunities in marine biology, coastal ecology, and maritime industries that distinguish SMEXCEL from mainland schools. The boarding system instills discipline, independence, and collaborative skills while fostering strong community bonds among students living on the island. SMEXCEL particularly emphasizes developing scientific literacy with awareness of maritime industries, international trade, and island sustainability challenges. Students gain exposure to Labuan''s unique duty-free economic zone and offshore business environment, opening perspectives on careers in maritime, logistics, and international commerce alongside traditional STEM fields. Admission is competitive, based on primary school academic performance, co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SMEXCEL graduates consistently achieve strong SPM results and gain admission to top Form 6 programs, matriculation courses, and diploma programs, with many proceeding to Malaysian public universities in STEM, maritime studies, engineering, and business fields.',
  'https://smexcel.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '6cfd621a-32fc-4020-b3b6-8067b5418fbb';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '6cfd621a-32fc-4020-b3b6-8067b5418fbb';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '6cfd621a-32fc-4020-b3b6-8067b5418fbb';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('6cfd621a-32fc-4020-b3b6-8067b5418fbb', 'bd0a618c-e66d-428c-9a22-984debd9cc5a'); -- labuan

-- Sekolah Menengah Sultan Abdul Halim (SMSAH)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '308631d7-835f-498f-b1ca-8c0531c95ca1',
  'Sekolah Menengah Sultan Abdul Halim (SMSAH)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sultan Abdul Halim in Jitra, Kedah is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SMSAH provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Students benefit from experienced teachers, modern facilities, and extensive co-curricular programs including sports, uniformed bodies, clubs, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. As one of Kedah''s established SBP schools, SMSAH has built a strong reputation for academic achievement and holistic student development. The school provides a nurturing environment where students from diverse backgrounds live and learn together, fostering national unity and cultural understanding. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SMSAH graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities.',
  'https://www.smsah.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '308631d7-835f-498f-b1ca-8c0531c95ca1';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '308631d7-835f-498f-b1ca-8c0531c95ca1';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '308631d7-835f-498f-b1ca-8c0531c95ca1';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('308631d7-835f-498f-b1ca-8c0531c95ca1', '2648da4e-491d-438f-94f1-ef25b6cc1907'); -- kedah

-- Sekolah Menengah Sains Dungun (SMSD)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '877eac60-a62a-48d8-adf7-349a513948cc',
  'Sekolah Menengah Sains Dungun (SMSD)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Dungun, abbreviated as SMSD, is a distinguished science secondary school located in Dungun, Terengganu. As a Sekolah Berasrama Penuh (SBP), SMSD provides comprehensive residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) education. The school offers an intensive science-focused curriculum leading to SPM certification, designed to develop future scientists, engineers, medical professionals, and technology innovators. SMSD features well-equipped science laboratories, modern technology infrastructure, digital learning resources, and experienced educators dedicated to excellence in science education. Students actively participate in research projects, science competitions, innovation challenges, and academic olympiads at district, state, and national levels, developing strong scientific foundations and research skills. The school emphasizes hands-on learning, experimental methodology, and inquiry-based education to foster genuine scientific understanding and curiosity. Beyond academics, SMSD promotes holistic development through diverse co-curricular activities including robotics clubs, science societies, mathematics associations, sports programs, uniformed bodies, and community service initiatives. The boarding environment cultivates discipline, independence, teamwork, and lasting friendships while maintaining rigorous academic standards. Students develop critical thinking, problem-solving abilities, and analytical skills essential for success in higher education and STEM careers. As a government SBP, SMSD is highly subsidized with minimal fees, ensuring quality science education remains accessible to talented students from B40 and M40 families in Terengganu and beyond. Admission is competitive based on academic achievement, science aptitude assessments, and personal interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). SMSD graduates consistently excel in universities, particularly in medicine, engineering, and pure sciences, contributing to Malaysia''s scientific community and technological progress.',
  'https://smsd.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '877eac60-a62a-48d8-adf7-349a513948cc';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '877eac60-a62a-48d8-adf7-349a513948cc';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '877eac60-a62a-48d8-adf7-349a513948cc';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', '5e234c1b-253d-4b3d-9f7a-8adc97c344fb'); -- terengganu
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('877eac60-a62a-48d8-adf7-349a513948cc', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Johor (SMSJ)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '77a05ccb-a9f1-4613-ba34-659c9984a091',
  'Sekolah Menengah Sains Johor (SMSJ)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Johor (SMSJ) in Kluang, Johor, is one of the state''s premier science-focused boarding schools, established to nurture academically talented students with strong aptitude in STEM fields. SMSJ provides specialized science education in a fully residential environment, preparing students for higher education in technical and scientific disciplines. The school offers Form 1-5 education with strong curriculum emphasis on science, technology, engineering, and mathematics, while maintaining comprehensive coverage of languages and humanities. As a government Sekolah Menengah Sains, fees are highly subsidized, enabling bright students from B40 and M40 families to access quality science education without financial constraints. SMSJ features state-of-the-art facilities including advanced science laboratories for conducting experiments in physics, chemistry, biology, and specialized scientific disciplines, modern computer centers equipped with latest technology, mathematics resource centers, well-stocked library with extensive scientific literature and research materials, sports complexes, and comfortable boarding facilities. The STEM-focused curriculum emphasizes hands-on learning, scientific inquiry, research methodology, analytical thinking, and active participation in science fairs, competitions, and olympiads at district, state, and national levels. Experienced science teachers with strong academic credentials and passion for STEM education provide rigorous instruction, guidance, and mentorship. The boarding environment fosters collaborative learning, academic excellence, peer tutoring, and development of critical thinking and innovation skills. Students engage in diverse activities including science clubs, robotics teams, innovation projects, mathematics competitions, and research initiatives. SMSJ maintains balance between intensive academics and co-curricular programs including sports, uniformed bodies, and leadership development. Admission is highly competitive, prioritizing students with exceptional performance and demonstrated passion for science and mathematics. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SMSJ graduates consistently achieve excellent results and secure placements in competitive medicine, engineering, and science programs at top universities.',
  'https://smsj.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '77a05ccb-a9f1-4613-ba34-659c9984a091';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '77a05ccb-a9f1-4613-ba34-659c9984a091';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '77a05ccb-a9f1-4613-ba34-659c9984a091';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('77a05ccb-a9f1-4613-ba34-659c9984a091', '6f949d9f-568d-4ea4-a904-96f6c92f873d'); -- johor

-- Sekolah Menengah Sains Pasir Puteh (SMSPP)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'a9763339-91cc-41b9-af49-01e4d258f88e',
  'Sekolah Menengah Sains Pasir Puteh (SMSPP)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Pasir Puteh, known as SMSPP, is a premier science secondary school located in Pasir Puteh, Kelantan. As a Sekolah Berasrama Penuh (SBP), SMSPP provides fully residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) disciplines. The school offers an intensive science-focused curriculum leading to SPM certification, with strong emphasis on developing future scientists, engineers, medical professionals, and researchers. SMSPP features advanced science laboratories, modern technology facilities, comprehensive library collections, and experienced teaching staff passionate about science education excellence. Students engage actively in research projects, science fairs, innovation competitions, and national academic olympiads, developing robust scientific knowledge and practical research skills. The school''s coastal location provides unique opportunities for environmental and marine science exploration. Beyond academics, SMSPP promotes holistic student development through extensive co-curricular programs including robotics teams, science clubs, mathematics societies, sports activities, uniformed bodies, and cultural programs. The boarding environment fosters discipline, self-reliance, collaborative learning, and strong peer support networks while maintaining high academic expectations. Students develop critical thinking, analytical reasoning, and scientific problem-solving abilities essential for university education and professional careers in STEM fields. As a government SBP, SMSPP is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families throughout Kelantan and neighboring areas. The school serves as an important educational institution for students from rural and coastal communities, providing opportunities that might otherwise be unavailable. Admission is competitive based on academic merit, science aptitude tests, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). SMSPP graduates have achieved remarkable success in prestigious universities, particularly in medicine, engineering, pure sciences, and environmental studies, contributing to Malaysia''s scientific advancement.',
  'https://smspp.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'a9763339-91cc-41b9-af49-01e4d258f88e';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'a9763339-91cc-41b9-af49-01e4d258f88e';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'a9763339-91cc-41b9-af49-01e4d258f88e';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', '459659e3-6f42-4e5c-82b7-c36ae26504ce'); -- kelantan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('a9763339-91cc-41b9-af49-01e4d258f88e', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- Sekolah Menengah Sains Selangor, Cheras (SMSS)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'eb59dac7-d357-4fdb-8196-a6eca40cc98a',
  'Sekolah Menengah Sains Selangor, Cheras (SMSS)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Selangor (SMSS) in Cheras, Kuala Lumpur is a prestigious government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification with specialized focus on science and STEM education. As a fully residential science school, SMSS provides comprehensive boarding facilities and structured environment promoting academic excellence, scientific inquiry, and innovation. The school is highly subsidized by the Malaysian government, with minimal fees making quality science boarding education accessible to B40 and M40 families. SMSS specializes in developing future scientists, engineers, and STEM professionals through intensive science and mathematics curriculum emphasizing hands-on laboratory work, scientific research, problem-solving, and critical thinking. With a strong reputation for academic excellence, SMSS maintains well-equipped science laboratories, computer facilities, and research resources enabling students to conduct advanced experiments and develop practical scientific skills. Advanced courses in Physics, Chemistry, Biology, Mathematics, and Additional Mathematics prepare students for competitive STEM careers and university programs. The curriculum integrates theoretical knowledge with practical applications, encouraging innovation, creativity, and scientific reasoning essential for 21st-century STEM fields. Students benefit from highly experienced science teachers, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, coding workshops, mathematics olympiad preparation, and research projects. Active participation in national and international science competitions, olympiads, and STEM challenges provides students opportunities to showcase their talents and compete at the highest levels. The boarding system instills discipline, time management, and collaborative skills essential for future success in scientific and engineering fields. SMSS''s STEM-focused environment, combined with its strategic location in Kuala Lumpur, cultivates scientific curiosity, analytical thinking, and passion for excellence. The school''s strong alumni network and connections with research institutions and universities provide additional opportunities for mentorship and exposure to cutting-edge science. Admission is highly competitive, prioritizing students with exceptional aptitude and genuine interest in science and mathematics, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SMSS graduates consistently gain admission to top Form 6 science programs, matriculation colleges, A-Levels, and foundation courses, with many proceeding to prestigious Malaysian public universities in STEM fields including engineering, medicine, pharmacy, biotechnology, and pure sciences.',
  'https://smss.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'eb59dac7-d357-4fdb-8196-a6eca40cc98a';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'eb59dac7-d357-4fdb-8196-a6eca40cc98a';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'eb59dac7-d357-4fdb-8196-a6eca40cc98a';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', '2290ab8a-b8da-413e-91a3-ce88147cbdb9'); -- kuala-lumpur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('eb59dac7-d357-4fdb-8196-a6eca40cc98a', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school

-- Sekolah Menengah Sains Sultan Mohamad Jiwa (SMSSMJ)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '773db4a8-63c1-476f-bfcc-eb131fd86a1e',
  'Sekolah Menengah Sains Sultan Mohamad Jiwa (SMSSMJ)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Sultan Mohamad Jiwa in Sungai Petani, Kedah is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SMSSMJ provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, innovation competitions, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located in Sungai Petani, Kedah''s second-largest town, SMSSMJ serves as a premier science education institution in southern Kedah. The school maintains strong partnerships with universities and industry for STEM enrichment programs and mentorship opportunities. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SMSSMJ graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://smssmj.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '773db4a8-63c1-476f-bfcc-eb131fd86a1e';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '773db4a8-63c1-476f-bfcc-eb131fd86a1e';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '773db4a8-63c1-476f-bfcc-eb131fd86a1e';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('773db4a8-63c1-476f-bfcc-eb131fd86a1e', '2648da4e-491d-438f-94f1-ef25b6cc1907'); -- kedah

-- Sekolah Menengah Sains Tengku Muhammad Faris Petra (SMSTMFP)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '724a1af6-4f4f-4fb1-970e-218e8ce6af93',
  'Sekolah Menengah Sains Tengku Muhammad Faris Petra (SMSTMFP)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Tengku Muhammad Faris Petra, commonly known as SMSTMFP, is a prestigious science secondary school located in Pengkalan Chepa, Kota Bharu, Kelantan. Named after the Crown Prince of Kelantan, SMSTMFP represents excellence in science education in the state. As a Sekolah Berasrama Penuh (SBP), the school provides fully residential education for Forms 1-5 students (ages 13-17), specializing in Science, Technology, Engineering, and Mathematics (STEM) fields. SMSTMFP offers an intensive science-focused curriculum leading to SPM certification, with strong emphasis on developing future scientists, engineers, medical professionals, and researchers. The school features state-of-the-art science laboratories, modern computer facilities, comprehensive library resources, and highly qualified teaching staff dedicated to nurturing scientific talent. Students engage actively in research projects, science fairs, innovation competitions, and national STEM olympiads, developing strong foundations in scientific methodology and critical thinking. The school''s proximity to Kota Bharu provides opportunities for collaborations with universities and research institutions. Beyond academics, SMSTMFP promotes holistic development through extensive co-curricular programs including robotics clubs, science societies, mathematics associations, sports teams, uniformed bodies, and cultural activities. The boarding environment fosters discipline, teamwork, independence, and strong peer relationships while maintaining high academic standards. Students develop analytical thinking, problem-solving skills, and scientific inquiry abilities essential for higher education and professional success. As a government SBP, SMSTMFP is highly subsidized with minimal fees, making quality science education accessible to talented students from B40 and M40 families throughout Kelantan. Admission is competitive based on academic merit, science aptitude assessments, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 entry). SMSTMFP graduates have excelled in prestigious universities, particularly in medicine, engineering, and pure sciences.',
  'https://smstmfp.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '724a1af6-4f4f-4fb1-970e-218e8ce6af93';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '724a1af6-4f4f-4fb1-970e-218e8ce6af93';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '724a1af6-4f4f-4fb1-970e-218e8ce6af93';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', '459659e3-6f42-4e5c-82b7-c36ae26504ce'); -- kelantan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('724a1af6-4f4f-4fb1-970e-218e8ce6af93', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem

-- SOLS 24/7 Foundation
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '04ca5056-4423-4e37-97fd-76d88386b86a',
  'SOLS 24/7 Foundation',
  '57cba752-792a-4ce2-a8af-ee7fe262c563',
  'SOLS 24/7',
  'Free education programs and skills training for underprivileged youth in Malaysia.',
  'https://sols247.org/',
  false
);
-- Link to category: community
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'community') WHERE id = '04ca5056-4423-4e37-97fd-76d88386b86a';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '04ca5056-4423-4e37-97fd-76d88386b86a';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '04ca5056-4423-4e37-97fd-76d88386b86a';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', 'f4c03ce1-c7cc-4efb-90d7-571ced8a768a'); -- ngo
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', '821de224-e76b-49d8-a61b-3ea6e37a26fd'); -- skills
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', '9fd18beb-2593-422a-a439-65c524dfc968'); -- youth
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('04ca5056-4423-4e37-97fd-76d88386b86a', '6033a862-9fa2-4529-80eb-db0247d02392'); -- free-education

-- Sekolah Seri Puteri (SSP)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '75bf566a-4652-4e9b-a966-ca00b7fc6689',
  'Sekolah Seri Puteri (SSP)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Seri Puteri (SSP) in Cyberjaya is an elite girls'' boarding school established in 1994, originally in Kuala Lumpur before relocating to Malaysia''s technology hub. SSP is unique among SBP schools, originally established for daughters of senior government servants but now admitting students based on academic merit and potential. The school offers Form 1-5 education for girls aged 13-17, emphasizing academic excellence, leadership, and technology integration. Located in Cyberjaya, students benefit from proximity to Malaysia''s leading tech companies and innovation centers. As a government boarding school, fees are subsidized, though SSP maintains higher facilities standards compared to typical SBP schools. The school features state-of-the-art facilities including advanced ICT labs, science laboratories, multimedia centers, sports complex, arts facilities, and excellent dormitories. SSP''s curriculum emphasizes STEM education, languages, and leadership development, preparing students for top university placements. The boarding environment fosters independence, critical thinking, and collaborative skills. Small class sizes and experienced teachers ensure personalized attention. Admission is highly competitive, based on exceptional academic performance (formerly top UPSR results), co-curricular excellence, and leadership potential demonstrated through interviews. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). SSP consistently produces outstanding graduates who gain admission to top Malaysian and international universities, with many pursuing STEM careers.',
  'https://www.ssp.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '75bf566a-4652-4e9b-a966-ca00b7fc6689';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '75bf566a-4652-4e9b-a966-ca00b7fc6689';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '75bf566a-4652-4e9b-a966-ca00b7fc6689';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', 'a3ecdefa-1996-4679-9013-9cae23da3ccc'); -- girls-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', 'fffce20f-d2d5-46a7-968e-0fcab5f5b588'); -- elite
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', '0e395b9f-c37e-4b65-9b45-22840242495e'); -- technology
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', '66d27815-be82-4712-892d-3dbd0a7a6f3b'); -- leadership
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('75bf566a-4652-4e9b-a966-ca00b7fc6689', '2ab386ae-bc17-400d-b1f2-2b2c985b7b1c'); -- selangor

-- Stanford University
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '0241ddd0-c735-4bf4-9cd2-80ca5b9b2716',
  'Stanford University',
  'f81e4072-9c93-4052-a051-3e2ecf42676b',
  'Stanford University',
  'Stanford University, founded in 1885, is one of the world''s premier research universities located in Silicon Valley, California. Annual costs total approximately $84,000 USD including tuition ($62,484), fees, room, and board. Stanford''s financial aid program is exceptionally generous—families earning under $150,000 pay no tuition, and those under $100,000 also receive free room and board. International students receive the same need-blind consideration as US students. The average need-based grant exceeds $75,000. Stanford enrolls approximately 7,600 undergraduates from 90+ countries. With a 5:1 student-faculty ratio and acceptance rate under 4%, Stanford offers intimate learning at a world-class institution. The university excels in engineering, computer science, business, and virtually all disciplines. Located in the heart of Silicon Valley, students access unparalleled entrepreneurship and tech industry opportunities—many startups, including Google and Instagram, were founded by Stanford students. Malaysian students form a notable part of the international community. The 8,180-acre campus features Spanish Colonial architecture and year-round sunshine. Graduates achieve exceptional outcomes with high placement at top tech companies and graduate schools.',
  'https://www.stanford.edu',
  true
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '0241ddd0-c735-4bf4-9cd2-80ca5b9b2716';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '0241ddd0-c735-4bf4-9cd2-80ca5b9b2716';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '0241ddd0-c735-4bf4-9cd2-80ca5b9b2716';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', '577475cb-6dcc-4b50-9586-36da0eed01a4'); -- silicon-valley
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', '301d600b-425c-4a5a-afcf-a83d5b5c3ca6'); -- stem
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', 'd102ec3e-4ab9-4c11-a4df-8e564352511c'); -- entrepreneurship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0241ddd0-c735-4bf4-9cd2-80ca5b9b2716', '518b6db4-9ec4-421c-b2c7-5e52ac132f91'); -- research

-- Sekolah Tuanku Abdul Rahman (STAR)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '1f9ce2e0-82a7-4ae9-9a97-ee16ef370091',
  'Sekolah Tuanku Abdul Rahman (STAR)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Tuanku Abdul Rahman in Ipoh, Perak is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, STAR provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Students benefit from experienced teachers, modern facilities, and extensive co-curricular programs including sports, uniformed bodies, clubs, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. As one of Perak''s premier SBP schools located in the state capital, STAR has a long-standing tradition of academic excellence and holistic student development. The school provides a nurturing environment where students from diverse backgrounds live and learn together, fostering national unity and cultural understanding. STAR''s strategic location in Ipoh provides students with access to cultural and educational resources in the city. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). STAR graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities.',
  'https://www.star.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '1f9ce2e0-82a7-4ae9-9a97-ee16ef370091';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '1f9ce2e0-82a7-4ae9-9a97-ee16ef370091';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '1f9ce2e0-82a7-4ae9-9a97-ee16ef370091';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1f9ce2e0-82a7-4ae9-9a97-ee16ef370091', '22d012b0-6d32-4e9b-80fb-fc1928a6b04f'); -- perak

-- Sekolah Tun Fatimah (STF)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '568e6744-276d-4803-8014-7462104f19a6',
  'Sekolah Tun Fatimah (STF)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Tun Fatimah (STF) in Johor Bahru is one of Malaysia''s premier girls'' boarding schools, named after the legendary Malaccan queen. With a GPS of 1.04 in SPM 2024, STF ranks among the top SBP schools nationally. Established in 1987, the school has built a reputation for academic excellence combined with strong emphasis on leadership development and women''s empowerment. STF offers Form 1-5 education for girls aged 13-17, leading to SPM certification. As a government Sekolah Berasrama Penuh, fees are highly subsidized, making elite boarding education accessible to B40 and M40 families. The school features modern facilities including science laboratories, computer labs, sports complexes, and comfortable dormitories. STF emphasizes balanced development through rigorous academics, extensive co-curricular activities, and character-building programs. Students benefit from experienced teachers, peer learning in a boarding environment, and opportunities to develop independence and self-discipline. Admission is competitive, based on primary school performance (formerly UPSR), co-curricular achievements, and interviews. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). STF alumnae have excelled in various fields including medicine, engineering, law, education, and public service, forming a strong support network for current students.',
  'https://www.stf.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '568e6744-276d-4803-8014-7462104f19a6';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '568e6744-276d-4803-8014-7462104f19a6';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '568e6744-276d-4803-8014-7462104f19a6';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', 'a3ecdefa-1996-4679-9013-9cae23da3ccc'); -- girls-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', '83466eed-22f2-4007-bfe1-ea8cbd2e088a'); -- top-ranked
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', '66d27815-be82-4712-892d-3dbd0a7a6f3b'); -- leadership
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', '6f949d9f-568d-4ea4-a904-96f6c92f873d'); -- johor
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('568e6744-276d-4803-8014-7462104f19a6', '1713db3e-fe0d-4824-ba1d-474313b453c6'); -- gps-104

-- Sekolah Menengah Agama Persekutuan Bentong (SUPERB)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '2d4896e7-55be-43f9-b216-7039313c37b5',
  'Sekolah Menengah Agama Persekutuan Bentong (SUPERB)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Agama Persekutuan Bentong, known as SUPERB, is a prestigious federal religious secondary school located in Bentong, Pahang. As part of the Sekolah Berasrama Penuh (SBP) network, SUPERB provides fully residential education that integrates Islamic studies with mainstream academic subjects. The school serves Forms 1-5 students (ages 13-17) leading to SPM certification, offering a unique curriculum that balances religious education with science, mathematics, languages, and humanities. SUPERB''s educational philosophy emphasizes producing students who excel academically while being firmly grounded in Islamic values, ethics, and practices. Students receive comprehensive religious instruction including Quran studies, Islamic jurisprudence, Arabic language, and Islamic civilization, alongside the national curriculum. The school features modern facilities including equipped classrooms, science laboratories, computer labs, prayer halls, library resources, sports facilities, and comfortable boarding accommodations. Beyond academics, students participate in diverse co-curricular activities including religious societies, academic clubs, sports, arts, and community service, fostering holistic development. The boarding environment promotes Islamic character, discipline, brotherhood, and spiritual growth while maintaining high academic standards. As a government-funded institution, SUPERB is highly subsidized with minimal fees, making quality Islamic education accessible to students from B40 and M40 families. Admission is competitive based on academic achievement, religious knowledge assessments, and interviews. Applications open annually through the SPM portal at https://spskt1.moe.gov.my (typically January-February for Form 1 intake). SUPERB graduates are recognized for their balanced excellence in both religious and secular knowledge, successfully pursuing higher education in Islamic studies, science, and various professional fields.',
  'https://superb.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '2d4896e7-55be-43f9-b216-7039313c37b5';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '2d4896e7-55be-43f9-b216-7039313c37b5';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '2d4896e7-55be-43f9-b216-7039313c37b5';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', 'fe467450-a6fa-4016-adf5-4a770a197d3a'); -- islamic-education
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', 'fdf04f88-f7b8-4a3f-982e-0311fd55b928'); -- pahang
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('2d4896e7-55be-43f9-b216-7039313c37b5', '988379ee-9847-4ab6-bc26-ab45bf6dea41'); -- zon-timur

-- Sekolah Menengah Sains Tuanku Syed Putra (SYED PUTRA)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0',
  'Sekolah Menengah Sains Tuanku Syed Putra (SYED PUTRA)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Tuanku Syed Putra in Kangar, Perlis is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, SYED PUTRA provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics teams, mathematics olympiads, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. As Perlis''s premier science boarding school, SYED PUTRA has established a strong track record of producing outstanding SPM results and sending graduates to top universities. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). SYED PUTRA graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://syedputra.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('c5ae8ed0-b6bd-4de2-a24b-f2806ebaa5c0', 'e6361bb1-7547-4ada-acaa-bb92ea36d47a'); -- perlis

-- TASIS England
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'ec20d870-d8fa-4764-b667-549dd330872c',
  'TASIS England',
  'a20a22c5-5f6c-476e-848d-1137a26c45dc',
  'TASIS The American School in England',
  'TASIS The American School in England, located in the village of Thorpe near Surrey, is a leading American international boarding school founded in 1976. Serving students aged 3-18 with boarding from grade 9, the school offers American High School Diploma, AP courses, and IB Diploma programs. Annual boarding fees range from $65,000-$75,000 USD. The school maintains a diverse student body of approximately 750 students from 50+ countries. Situated just 30 minutes from central London, students benefit from easy access to world-class museums, theaters, and cultural experiences while enjoying a safe campus environment. TASIS England provides need-based financial aid and merit scholarships, with awards ranging from 10-50% of tuition for qualified international students. The school emphasizes American educational values combined with global perspectives. Strong performing arts, athletics, and outdoor education programs complement rigorous academics. Graduates gain admission to top universities in the US, UK, and worldwide, with dedicated university counseling supporting the application process. The school maintains particularly strong placement records at American universities.',
  'https://www.tasisengland.org',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'ec20d870-d8fa-4764-b667-549dd330872c';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'ec20d870-d8fa-4764-b667-549dd330872c';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'ec20d870-d8fa-4764-b667-549dd330872c';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', 'cf46a197-8de8-4991-9a5d-991a208e5add'); -- uk
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', 'adaf1d62-7905-4b22-98d6-d81fed236c15'); -- american
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', '2172ad01-b39d-44e6-9e25-7686b1ff7613'); -- international
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('ec20d870-d8fa-4764-b667-549dd330872c', 'ad8083ca-2cc0-41ee-b9a0-78496f6fd570'); -- london

-- TASIS Switzerland
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '5e22faf8-c2e2-4d30-be6c-0174dfff8ad6',
  'TASIS Switzerland',
  'ad55b4b5-df24-4008-a89a-4d47c5a57608',
  'The American School in Switzerland',
  'The American School in Switzerland (TASIS) in Lugano is the oldest American boarding school in Europe, founded in 1956. Serving students aged 3-18 with boarding from grade 7, TASIS offers American High School Diploma, AP courses, and IB Diploma programs. Annual boarding fees range from $90,000-$105,000 USD including tuition, accommodation, and activities. The school enrolls approximately 700 students from 60+ nationalities, creating a truly international environment. Located on a hillside overlooking Lugano and Lake Lugano, the campus provides stunning views and proximity to Italian culture. TASIS emphasizes arts, academics, and global citizenship, with extensive fine arts and performing arts programs. The school offers need-based financial aid, with scholarships available covering up to 50% of costs for qualified students. Students benefit from TASIS''s Academic Travel Program, exploring European culture through educational trips. Graduates gain admission to top American universities including Ivy League schools, as well as leading European and UK institutions. The school maintains strong university counseling with personalized guidance.',
  'https://www.tasis.ch',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '5e22faf8-c2e2-4d30-be6c-0174dfff8ad6';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '5e22faf8-c2e2-4d30-be6c-0174dfff8ad6';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '5e22faf8-c2e2-4d30-be6c-0174dfff8ad6';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', '0d98943a-4d47-434b-b847-5f9422cde685'); -- switzerland
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', 'adaf1d62-7905-4b22-98d6-d81fed236c15'); -- american
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', '2172ad01-b39d-44e6-9e25-7686b1ff7613'); -- international
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', '74bef0e3-ee64-47f6-9ab2-2c09d9e0fed4'); -- ib-curriculum
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('5e22faf8-c2e2-4d30-be6c-0174dfff8ad6', '8b0e9f7e-f4b7-4939-a63d-f548d3d1ba35'); -- arts

-- Teach Yourself Computer Science
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '0a0befaf-790b-4819-86a4-d4b421517f6b',
  'Teach Yourself Computer Science',
  '0d34064d-4585-4bb1-8d2c-7fc6b99f846d',
  'Oz Nova & Myles Byrne',
  'Self-study guide for computer science fundamentals with recommended resources and books.',
  'https://teachyourselfcs.com/',
  false
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = '0a0befaf-790b-4819-86a4-d4b421517f6b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '0a0befaf-790b-4819-86a4-d4b421517f6b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '0a0befaf-790b-4819-86a4-d4b421517f6b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', 'd4d30c02-7041-4b30-ad4f-56b70cd55aaf'); -- computer-science
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', 'd38006d2-5311-4456-9d2e-f0de88153ec7'); -- self-study
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', 'c89902d0-fcad-4e7a-9892-4e3cf7298b61'); -- fundamentals
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('0a0befaf-790b-4819-86a4-d4b421517f6b', 'c41ccd9d-bd3e-41f9-9ec2-bfa2235ecf36'); -- resources

-- Kolej Tunku Kurshiah (TKC)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '1fef4fda-1e6c-475c-b8b8-a0764e82a67b',
  'Kolej Tunku Kurshiah (TKC)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Kolej Tunku Kurshiah (TKC) in Seremban, Negeri Sembilan, is Malaysia''s oldest girls'' boarding school, established in 1956. With a GPS of 1.05 in SPM 2024, TKC maintains its position among the nation''s top academic institutions. Named after the Tunku Ampuan of Negeri Sembilan, the school has a distinguished history of nurturing female leaders across various sectors. TKC offers Form 1-5 education for girls aged 13-17 in a fully residential setting. As a government SBP school, tuition and boarding are highly subsidized, making elite education accessible to B40 and M40 families regardless of background. The school''s curriculum emphasizes academic excellence, particularly in STEM subjects, while fostering leadership skills, critical thinking, and social responsibility. TKC''s historic campus combines colonial-era buildings with modern facilities including advanced science labs, computer centers, library, sports complex, and comfortable dormitories. The boarding environment promotes independence, time management, and lifelong friendships. Admission is highly competitive, based on primary school academic achievement (formerly UPSR), co-curricular records, and interview performance. Applications for Form 1 admission: https://spskt1.moe.gov.my (typically January-February). TKC alumnae, known as ''Old Girls'', include prominent figures in medicine, law, education, business, and public service, creating a powerful support network for current students and graduates.',
  'https://www.tkc.edu.my',
  true
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = '1fef4fda-1e6c-475c-b8b8-a0764e82a67b';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '1fef4fda-1e6c-475c-b8b8-a0764e82a67b';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '1fef4fda-1e6c-475c-b8b8-a0764e82a67b';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', 'a3ecdefa-1996-4679-9013-9cae23da3ccc'); -- girls-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', '83466eed-22f2-4007-bfe1-ea8cbd2e088a'); -- top-ranked
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', 'a060f67e-953d-4a1b-912f-c4fac22aa473'); -- historic
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', '66d27815-be82-4712-892d-3dbd0a7a6f3b'); -- leadership
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', '4d342282-39e1-4640-aae3-aaf587a9e97b'); -- negeri-sembilan
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('1fef4fda-1e6c-475c-b8b8-a0764e82a67b', 'f8a4d798-d32f-429a-9ca8-74e5e30d150c'); -- gps-105

-- TNB Scholarship
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '82ec262a-1419-46fc-a1a7-e2e2f68a6820',
  'TNB Scholarship',
  '42dca451-0804-4e3f-b424-db9e9310456f',
  'Tenaga Nasional Berhad',
  'Scholarship for students pursuing engineering and technical fields.',
  'https://www.tnb.com.my/',
  false
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = '82ec262a-1419-46fc-a1a7-e2e2f68a6820';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '82ec262a-1419-46fc-a1a7-e2e2f68a6820';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'hybrid') WHERE id = '82ec262a-1419-46fc-a1a7-e2e2f68a6820';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', 'd87e3036-d212-4f9b-b7c0-9dad4e25ecd3'); -- engineering
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', 'aa8dfaa8-7910-4851-ab96-d1c144fda6a5'); -- technical
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('82ec262a-1419-46fc-a1a7-e2e2f68a6820', '698f7507-9e94-4225-9929-3a1d577cde3a'); -- corporate

-- Sekolah Menengah Sains Tun Syed Sheh Shahabudin (TUN SYED)
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'bcabf633-48bf-4edb-bc77-37fbdb3fbeb4',
  'Sekolah Menengah Sains Tun Syed Sheh Shahabudin (TUN SYED)',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Sekolah Menengah Sains Tun Syed Sheh Shahabudin in Bukit Mertajam, Pulau Pinang is a government Sekolah Berasrama Penuh (SBP) offering Form 1-5 secondary education (ages 13-17) leading to SPM certification. As a fully residential school, TUN SYED provides comprehensive boarding facilities and structured environment promoting academic excellence, character development, and independence. The school is highly subsidized by the Malaysian government, with minimal fees making quality boarding education accessible to B40 and M40 families. Specializing in STEM education, the school features advanced science laboratories, mathematics resource centers, and specialized equipment for physics, chemistry, and biology practical work. Students benefit from experienced science educators, modern facilities, and extensive co-curricular programs including science clubs, robotics competitions, mathematics olympiads, sports, uniformed bodies, and cultural activities. The boarding system instills discipline, time management, and collaborative skills essential for future success. Located in Bukit Mertajam, Penang''s second-largest town, TUN SYED has established a strong reputation for academic excellence and STEM achievement. The school provides a conducive learning environment with access to industrial and technological centers in the region for enrichment activities. Admission is competitive, based on primary school academic performance (formerly UPSR), co-curricular achievements, and interview assessments. Applications for Form 1 admission open annually through https://spskt1.moe.gov.my (typically January-February). TUN SYED graduates consistently gain admission to top Form 6 programs, matriculation, and diploma courses, with many proceeding to Malaysian public universities in STEM fields.',
  'https://tunsyed.edu.my',
  false
);
-- Link to category: secondary-education
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'secondary-education') WHERE id = 'bcabf633-48bf-4edb-bc77-37fbdb3fbeb4';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = 'bcabf633-48bf-4edb-bc77-37fbdb3fbeb4';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'bcabf633-48bf-4edb-bc77-37fbdb3fbeb4';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', 'cecd33b6-ba6b-4ab4-8a41-a78ceff23933'); -- boarding-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', 'b0a4c8c6-36fb-4b4d-b6b8-ee991351b616'); -- sbp
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', 'e714bd4d-0ce2-450d-b88b-bbe7b74d48f1'); -- science-school
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('bcabf633-48bf-4edb-bc77-37fbdb3fbeb4', '69ffb3ae-86b1-41a5-b797-dccd5ab0bfca'); -- pulau-pinang

-- TVET Malaysia Programs
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '22c43b03-6ac9-4a5c-a523-6276cd00c317',
  'TVET Malaysia Programs',
  '417996bd-1f1a-4de9-9e41-e49ced92fdb4',
  'Ministry of Education Malaysia',
  'Technical and Vocational Education and Training programs across Malaysia.',
  'https://www.moe.gov.my/',
  true
);
-- Link to category: tvet
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'tvet') WHERE id = '22c43b03-6ac9-4a5c-a523-6276cd00c317';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'subsidized') WHERE id = '22c43b03-6ac9-4a5c-a523-6276cd00c317';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '22c43b03-6ac9-4a5c-a523-6276cd00c317';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', '7eb21c6b-fd17-4193-8792-da27c2681065'); -- vocational
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', 'aa8dfaa8-7910-4851-ab96-d1c144fda6a5'); -- technical
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', '106eae2c-4ebf-4760-91f7-c38cc02eb7cc'); -- government
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22c43b03-6ac9-4a5c-a523-6276cd00c317', '821de224-e76b-49d8-a61b-3ea6e37a26fd'); -- skills

-- Udemy Free Courses
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '22e2da78-fbcb-4327-bdbe-f0a84f395cdd',
  'Udemy Free Courses',
  'b8e9bbf8-7c33-493d-8922-619d6add1e9c',
  'Udemy',
  'Thousands of free online courses on various topics including tech, business, and personal development.',
  'https://www.udemy.com/courses/free/',
  false
);
-- Link to category: mooc
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'mooc') WHERE id = '22e2da78-fbcb-4327-bdbe-f0a84f395cdd';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '22e2da78-fbcb-4327-bdbe-f0a84f395cdd';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = '22e2da78-fbcb-4327-bdbe-f0a84f395cdd';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', (SELECT id FROM education_levels WHERE slug = 'all-levels'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', 'edd375b9-75cc-42e2-9cc9-8d550c653a07'); -- courses
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', '821de224-e76b-49d8-a61b-3ea6e37a26fd'); -- skills
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', 'd0523523-605b-4acb-8729-1da16eb1bde8'); -- tech
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('22e2da78-fbcb-4327-bdbe-f0a84f395cdd', '920bda5b-000e-4064-a9ee-488ec8721452'); -- business

-- University of Chicago
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'e896e865-fa03-430a-9dd2-386ae2219eb0',
  'University of Chicago',
  '841e274b-98f9-4f48-9e1c-2d781cba7d61',
  'University of Chicago',
  'The University of Chicago is a prestigious private research university founded in 1890, consistently ranked among the top 10 universities globally. Annual costs total approximately $89,000-$92,000 USD including tuition ($65,619), fees, room, and board. The university is need-blind for US applicants and meets 100% of demonstrated financial need—international students also receive substantial aid, with the average grant covering 70% of costs. With 94 Nobel laureates affiliated, UChicago excels in economics, physical sciences, social sciences, and humanities. The distinctive Core Curriculum ensures all undergraduates receive broad liberal arts education. Approximately 7,500 undergraduates from 50+ states and 100+ countries create a diverse intellectual community. Malaysian students have historically enrolled at UChicago, particularly in STEM and economics programs. The 217-acre Hyde Park campus in Chicago provides urban opportunities with Gothic architecture. Acceptance rate is highly selective at approximately 5%. Graduates achieve strong outcomes with median starting salaries exceeding $70,000 and admission to top graduate schools.',
  'https://www.uchicago.edu',
  false
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = 'e896e865-fa03-430a-9dd2-386ae2219eb0';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = 'e896e865-fa03-430a-9dd2-386ae2219eb0';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = 'e896e865-fa03-430a-9dd2-386ae2219eb0';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', '518b6db4-9ec4-421c-b2c7-5e52ac132f91'); -- research
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', 'bf1b5ab7-06d0-49b6-936a-81e7210431db'); -- expensive
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', 'fc00e5de-4f51-4dd0-945d-d9b4d388275b'); -- economics
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('e896e865-fa03-430a-9dd2-386ae2219eb0', '035af851-81dd-4b35-aba2-0f92497638b2'); -- nobel-laureates

-- University of Pennsylvania
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '843c1fe1-6945-4fe0-8f84-e0dc96096f33',
  'University of Pennsylvania',
  '4f15bce8-6b2d-48de-8ea9-58540e9d4bd1',
  'University of Pennsylvania',
  'The University of Pennsylvania (Penn), founded in 1740 by Benjamin Franklin, is an Ivy League institution in Philadelphia. Annual costs total approximately $87,860 USD including tuition ($66,104), fees, and living expenses. Penn is need-blind for US applicants and meets 100% of demonstrated financial need, with average grants of $62,000. International students receive need-aware financial aid with substantial resources available. Penn enrolls approximately 10,000 undergraduates from 100+ countries. The university uniquely combines liberal arts with pre-professional education, home to the prestigious Wharton School of Business (undergraduate), as well as top programs in engineering, nursing, and arts & sciences. Penn''s interdisciplinary approach encourages students to take courses across schools. Located in University City, Philadelphia, students access urban opportunities while enjoying a cohesive campus. Acceptance rate is approximately 6%. Notable alumni include Elon Musk, numerous Fortune 500 CEOs, and political leaders. Malaysian students have strong representation, particularly in Wharton and engineering. Graduates achieve exceptional career outcomes with median starting salaries exceeding $85,000.',
  'https://www.upenn.edu',
  true
);
-- Link to category: elite-institutions
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'elite-institutions') WHERE id = '843c1fe1-6945-4fe0-8f84-e0dc96096f33';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'paid') WHERE id = '843c1fe1-6945-4fe0-8f84-e0dc96096f33';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '843c1fe1-6945-4fe0-8f84-e0dc96096f33';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', 'a643424e-f0c7-4a89-b3c6-db6868b68b92'); -- university
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', 'dbe63875-5bd2-42b5-a3c8-4c8c4b1a9be2'); -- usa
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', '902be6ab-3b69-4a15-8863-d5caab3190d8'); -- ivy-league
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', '920bda5b-000e-4064-a9ee-488ec8721452'); -- business
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', '1339d8ba-96c6-4d34-9cf3-fdeef4244346'); -- wharton
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('843c1fe1-6945-4fe0-8f84-e0dc96096f33', 'd87e3036-d212-4f9b-b7c0-9dad4e25ecd3'); -- engineering

-- W3Schools
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  'b03b4284-af56-4f22-bb16-cf3624b714e6',
  'W3Schools',
  'eaf3448c-1747-468d-a911-7e33942dc3c0',
  'W3Schools',
  'Free web development tutorials and references on HTML, CSS, JavaScript, and more.',
  'https://www.w3schools.com/',
  false
);
-- Link to category: digital-skills
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'digital-skills') WHERE id = 'b03b4284-af56-4f22-bb16-cf3624b714e6';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = 'b03b4284-af56-4f22-bb16-cf3624b714e6';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'online') WHERE id = 'b03b4284-af56-4f22-bb16-cf3624b714e6';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', (SELECT id FROM income_groups WHERE slug = 't20'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', (SELECT id FROM education_levels WHERE slug = 'secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', (SELECT id FROM education_levels WHERE slug = 'post-secondary'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', '07b14005-2d05-4845-8ef5-db7a9a126292'); -- web-development
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', '3f678772-4f7c-4193-8954-c529bbbc4f8e'); -- tutorials
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', '8b3fc2d9-5a0e-4ec5-a9d3-9abf99b2fb8e'); -- html
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', '3988639b-11e0-4e5c-a4b2-9813dd44ca63'); -- css
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('b03b4284-af56-4f22-bb16-cf3624b714e6', 'acee2463-6167-48d6-a0dd-0a017c9326e2'); -- javascript

-- Yayasan Khind Scholarship
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '653214de-8f3e-452d-8c27-0c0d3582d044',
  'Yayasan Khind Scholarship',
  '4739f9a8-ab19-4ec7-b171-e43b6fd224be',
  'Yayasan Khind',
  'Scholarship for underprivileged students pursuing tertiary education.',
  'https://www.yayasankhind.com.my/',
  false
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = '653214de-8f3e-452d-8c27-0c0d3582d044';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '653214de-8f3e-452d-8c27-0c0d3582d044';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'in-person') WHERE id = '653214de-8f3e-452d-8c27-0c0d3582d044';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', 'c1cf9119-2a8b-4b62-bb45-55a1b3831b3f'); -- b40
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', '706ad109-dcd8-4fdb-917c-e37f4bc6c83b'); -- tertiary
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('653214de-8f3e-452d-8c27-0c0d3582d044', 'a2cf9b09-db26-4c48-a68f-1d31bf100ca9'); -- foundation

-- Yayasan Peneraju Scholarship
INSERT INTO resources (id, name, provider_id, provider_name, description, url, is_featured) VALUES (
  '102b29ec-227a-4a69-8b91-d8c2172c5608',
  'Yayasan Peneraju Scholarship',
  '028d9e34-a875-4ca9-ab55-ef7c10392b78',
  'Yayasan Peneraju Pendidikan Bumiputera',
  'Scholarship for Bumiputera students to pursue degree programs at top universities locally and internationally.',
  'https://www.yayasanpeneraju.org.my/',
  false
);
-- Link to category: scholarship
UPDATE resources SET category_id = (SELECT id FROM categories WHERE slug = 'scholarship') WHERE id = '102b29ec-227a-4a69-8b91-d8c2172c5608';
UPDATE resources SET cost_type_id = (SELECT id FROM cost_types WHERE slug = 'free') WHERE id = '102b29ec-227a-4a69-8b91-d8c2172c5608';
UPDATE resources SET mode_id = (SELECT id FROM delivery_modes WHERE slug = 'hybrid') WHERE id = '102b29ec-227a-4a69-8b91-d8c2172c5608';
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', (SELECT id FROM income_groups WHERE slug = 'b40'));
INSERT INTO resource_income_groups (resource_id, income_group_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', (SELECT id FROM income_groups WHERE slug = 'm40'));
INSERT INTO resource_education_levels (resource_id, education_level_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', (SELECT id FROM education_levels WHERE slug = 'tertiary'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', (SELECT id FROM languages WHERE code = 'ms'));
INSERT INTO resource_languages (resource_id, language_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', (SELECT id FROM languages WHERE code = 'en'));
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', '7eed99f9-e972-40da-b0fe-5cd41320cb7d'); -- scholarship
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', '388c3b8e-8d57-424e-8fb5-90e75731db07'); -- bumiputera
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', '8e70e8ad-c342-4c5e-9770-bce785322dda'); -- top-universities
INSERT INTO resource_tags (resource_id, tag_id) VALUES ('102b29ec-227a-4a69-8b91-d8c2172c5608', '2172ad01-b39d-44e6-9e25-7686b1ff7613'); -- international

-- Seed data complete!
-- Total resources: 138
-- Total providers: 68
-- Total tags: 170