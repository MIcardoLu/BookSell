/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/12/2 9:15:57                            */
/*==============================================================*/


drop table if exists Admin_Info;

drop table if exists Book_Belong_List;

drop table if exists Book_Belong_Variety;

drop table if exists Book_Comment;

drop table if exists Book_Info;

drop table if exists Book_List;

drop table if exists Book_Sell;

drop table if exists Book_Variety;

drop table if exists Order_Info;

drop table if exists Orders_Have_Books;

drop table if exists Sell_Have_Books;

drop table if exists Shopping_Cart;

drop table if exists User_Address;

drop table if exists User_Info;

drop table if exists Writer_Info;

/*==============================================================*/
/* Table: Admin_Info                                            */
/*==============================================================*/
create table Admin_Info
(
   admin_id             int not null auto_increment,
   admin_name           varchar(30),
   admin_pwd            varchar(10),
   primary key (admin_id)
);

/*==============================================================*/
/* Table: Book_Belong_List                                      */
/*==============================================================*/
create table Book_Belong_List
(
   book_id              int not null,
   list_id              int not null,
   primary key (book_id, list_id)
);

/*==============================================================*/
/* Table: Book_Belong_Variety                                   */
/*==============================================================*/
create table Book_Belong_Variety
(
   variety_id           int not null,
   book_id              int not null,
   primary key (variety_id, book_id)
);

/*==============================================================*/
/* Table: Book_Comment                                          */
/*==============================================================*/
create table Book_Comment
(
   book_id              int not null,
   user_id              int not null,
   comment_content      varchar(500),
   comment_star         int,
   comment_date         datetime,
   primary key (book_id, user_id)
);

/*==============================================================*/
/* Table: Book_Info                                             */
/*==============================================================*/
create table Book_Info
(
   book_id              int not null auto_increment,
   writer_id            int,
   book_name            varchar(30),
   book_num             int,
   book_price           double,
   book_discountPirce   double,
   book_description     varchar(500),
   book_picture         longblob,
   book_condition       varchar(30),
   primary key (book_id)
);

/*==============================================================*/
/* Table: Book_List                                             */
/*==============================================================*/
create table Book_List
(
   list_id              int not null auto_increment,
   list_name            varchar(30),
   list_description     varchar(500),
   list_picture         longblob,
   primary key (list_id)
);

/*==============================================================*/
/* Table: Book_Sell                                             */
/*==============================================================*/
create table Book_Sell
(
   sell_id              int not null auto_increment,
   admin_id             int,
   user_id              int,
   primary key (sell_id)
);

/*==============================================================*/
/* Table: Book_Variety                                          */
/*==============================================================*/
create table Book_Variety
(
   variety_id           int not null auto_increment,
   variety_name         varchar(30),
   variety_description  varchar(500),
   primary key (variety_id)
);

/*==============================================================*/
/* Table: Order_Info                                            */
/*==============================================================*/
create table Order_Info
(
   order_id             int not null auto_increment,
   user_id              int,
   order_price          double,
   order_state          varchar(20),
   order_beginTime      datetime,
   order_endTime        datetime,
   primary key (order_id)
);

/*==============================================================*/
/* Table: Orders_Have_Books                                     */
/*==============================================================*/
create table Orders_Have_Books
(
   order_id             int not null,
   book_id              int not null,
   primary key (order_id, book_id)
);

/*==============================================================*/
/* Table: Sell_Have_Books                                       */
/*==============================================================*/
create table Sell_Have_Books
(
   sell_id              int not null,
   book_id              int not null,
   sell_price           double,
   primary key (sell_id, book_id)
);

/*==============================================================*/
/* Table: Shopping_Cart                                         */
/*==============================================================*/
create table Shopping_Cart
(
   user_id              int not null,
   book_id              int not null,
   cart_num             int,
   cart_allPrice        double,
   primary key (user_id, book_id)
);

/*==============================================================*/
/* Table: User_Address                                          */
/*==============================================================*/
create table User_Address
(
   address_id           int not null auto_increment,
   user_id              int,
   address_province     varchar(30),
   address_city         varchar(30),
   address_town         varchar(30),
   primary key (address_id)
);

/*==============================================================*/
/* Table: User_Info                                             */
/*==============================================================*/
create table User_Info
(
   user_id              int not null auto_increment,
   user_name            varchar(30),
   user_pwd             varchar(10),
   user_address         varchar(50),
   user_city            varchar(50),
   user_signTime        datetime,
   primary key (user_id)
);

/*==============================================================*/
/* Table: Writer_Info                                           */
/*==============================================================*/
create table Writer_Info
(
   writer_id            int not null auto_increment,
   writer_name          varchar(20),
   writer_description   varchar(500),
   primary key (writer_id)
);

alter table Book_Belong_List add constraint FK_Book_Belong_List foreign key (book_id)
      references Book_Info (book_id) on delete restrict on update restrict;

alter table Book_Belong_List add constraint FK_Book_Belong_List2 foreign key (list_id)
      references Book_List (list_id) on delete restrict on update restrict;

alter table Book_Belong_Variety add constraint FK_Book_Belong_Variety foreign key (variety_id)
      references Book_Variety (variety_id) on delete restrict on update restrict;

alter table Book_Belong_Variety add constraint FK_Book_Belong_Variety2 foreign key (book_id)
      references Book_Info (book_id) on delete restrict on update restrict;

alter table Book_Comment add constraint FK_Book_Comment foreign key (book_id)
      references Book_Info (book_id) on delete restrict on update restrict;

alter table Book_Comment add constraint FK_Book_Comment2 foreign key (user_id)
      references User_Info (user_id) on delete restrict on update restrict;

alter table Book_Info add constraint FK_Writer_write_Books foreign key (writer_id)
      references Writer_Info (writer_id) on delete restrict on update restrict;

alter table Book_Sell add constraint FK_Admin_Buy_Books foreign key (admin_id)
      references Admin_Info (admin_id) on delete restrict on update restrict;

alter table Book_Sell add constraint FK_User_Sell_Books foreign key (user_id)
      references User_Info (user_id) on delete restrict on update restrict;

alter table Order_Info add constraint FK_User_Have_Orders foreign key (user_id)
      references User_Info (user_id) on delete restrict on update restrict;

alter table Orders_Have_Books add constraint FK_Orders_Have_Books foreign key (order_id)
      references Order_Info (order_id) on delete restrict on update restrict;

alter table Orders_Have_Books add constraint FK_Orders_Have_Books2 foreign key (book_id)
      references Book_Info (book_id) on delete restrict on update restrict;

alter table Sell_Have_Books add constraint FK_Sell_Have_Books foreign key (sell_id)
      references Book_Sell (sell_id) on delete restrict on update restrict;

alter table Sell_Have_Books add constraint FK_Sell_Have_Books2 foreign key (book_id)
      references Book_Info (book_id) on delete restrict on update restrict;

alter table Shopping_Cart add constraint FK_Shopping_Cart foreign key (user_id)
      references User_Info (user_id) on delete restrict on update restrict;

alter table Shopping_Cart add constraint FK_Shopping_Cart2 foreign key (book_id)
      references Book_Info (book_id) on delete restrict on update restrict;

alter table User_Address add constraint FK_User_Have_Address foreign key (user_id)
      references User_Info (user_id) on delete restrict on update restrict;

