package com.ssafy.happyhouse.model;

import java.sql.Timestamp;

public class AttentionDto {
   private int no;
   private String title;
   private Timestamp time;
   private String writer;
   private String content;
   
   public AttentionDto() {}
   public AttentionDto(String title, String writer, String content) {
      this.title = title;
      this.writer = writer;
      this.content = content;
   }

   public AttentionDto(int no, String title, Timestamp time, String writer, String content) {
      this(title, writer, content);
      this.no = no;
      this.time = time;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public Timestamp getTime() {
      return time;
   }

   public void setTime(Timestamp time) {
      this.time = time;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }
   
   
}