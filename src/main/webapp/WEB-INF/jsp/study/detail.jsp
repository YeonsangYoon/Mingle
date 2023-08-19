<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
  <!-- 부제목 -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row" style="text-align: center;">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>스터디 상세보기</h4>
                        <div class="breadcrumb__links">
                            <a href="#">스터디 홈</a>
                            <span>스터디 상세보기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 프로그램 정보 -->
	<section class="shop spad">
	 <div class="container" id="sdetail">
	  <h2>{{vo.title}}</h2>
	  <div style="height: 20px"></div>
	  <div class="row">
        <div class="col-sm-6">
          <table class="table">
            <tr>
		      <th width="20%">진행방식</th>
		      <td width="80%">{{vo.onoff}}</td>
            </tr>
            <tr>
		      <th width="20%">시작예정일</th>
		      <td width="80%">{{vo.deadline}}</td>
            </tr>
            <tr>
		      <th width="20%">진행기간</th>
		      <td width="80%">{{vo.period}}</td>
            </tr>
          </table>
        </div>
        <div class="col-sm-6">
          <table class="table">
            <tr>
		      <th width="20%">모집인원</th>
		      <td width="80%">{{vo.recruit}}</td>
            </tr>
            <tr>
		      <th width="20%">기술스택</th>
		      <td width="80%">{{vo.techs}}</td>
            </tr>
            <tr>
		      <th width="20%">연락방법</th>
		      <td width="80%">{{vo.contact_type}}&nbsp;{{vo.contact_link}}</td>
            </tr>
          </table>
        </div>
      </div>
      
      <div class="container">
      	<table class="table">
      		<tr>
      			<td>
      				{{vo.content}}
      			</td>
      		</tr>
      	</table>
      </div>
      
		  <!-- 댓글(미완성) -->
		  <div style="height: 20px"></div>
		  <table class="table">
		    <tr>
		      <td>
		      	<table class="table" v-for="re in reply_data">
		      	  <tr>
		      	    <td class="text-left">
		      	      ◎<span style="color: blue;">{{re.name}}</span>&nbsp;{{re.dbday}}
		      	    </td>
		      	    <td class="text-right">
		      	      <span v-if="re.id==study_detail.sessionId">
		      	        <input type="button" class="btn btn-xs btn-danger" value="수정" @click="replyUpdateForm(re.no)" :id="'up'+re.no">
		      	        <input type="button" class="btn btn-xs btn-info" value="삭제" @click="replyDelete(re.no)">
		      	      </span>
		      	    </td>
		      	  </tr>
		      	  <tr>
		      	    <td colspan="2" class="text-left" valign="top">
		      	      <pre style="white-space: pre-wrap; background-color: white; border: none;">{{re.msg}}</pre>
		      	    </td>
		      	  </tr>
		      	  <tr style="display: none" :id="'reply'+re.no" class="updates">
		      	    <td colspan="2">
			          <textarea rows="3" cols="70" style="float: left" ref="msg" :id="'msg'+re.no">{{re.msg}}</textarea>
			          <input type="button" value="댓글수정" style="height: 65px; background-color: orange; color: white" @click="replyUpdate(re.no)">
		      	    </td>
		      	  </tr>
		      	</table>
		      </td>
		    </tr>
		  </table>
		  <table class="table" v-if="study_detail.sessionId!=null">
		    <tr>
		      <td>
		        <textarea rows="3" cols="72" style="float: left" ref="msg" v-model="msg"></textarea>
		        <input type="button" value="댓글쓰기" style="height: 65px; background-color: pink; color: white" @click="replyWrite()">
		      </td>
		    </tr>
		  </table>
      
     </div>
	</section>
	
	<script>
	new Vue({
		el:'#sdetail',
		data:{
			study_id:${study_id},
			study_detail:{}
		},
		mounted:function(){
			// 상세정보
			axios.get('../study/study_detail_vue.do',{
				params:{
					study_id:this.study_id
				}
			}).then(res=>{
				console.log(res.data)
				this.study_detail=res.data
			}).catch(error=>{
				console.log(error.res)
			})
		},
		methods:{
			
		}
	})
	</script>
</body>
</html>