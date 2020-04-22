package org.adt.domain;

import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

   private int rn;
   private String b_Type;
   private String bType_Name;
   private int member_No;
   private int bno;
   private String title;
   private String b_content;
   private String nick_Name;
   private String email;
   private int b_clickNum;
   private int b_Like;
   private String regdate;
   private String updatedate;
   private Boolean planner_OX; // 플래너 유무 Y,N

   private Long reply_Cnt; // 댓글개수
   private List<AttachVO> attachList;

   private Long blike_No;
   private int like_Check;
}
