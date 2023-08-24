<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 부제목 -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>스터디 삭제</h4>
                    <div class="breadcrumb__links">
                        <a href="#">스터디 상세보기</a>
                        <span>스터디 삭제</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
  
<section class="shop spad">  
  <div class="wrapper row3">
   <main class="container clear" id="sdelete">
        <div class="row-study">
            <div class="css-goiz5j" id="headlessui-popover-panel-3" tabindex="-1" data-headlessui-state="open">
                <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">스터디 삭제</li>
                </ul>
            </div>
        </div>
    <div class="row">
      <table class="table">
       <tr>
        <td class="inline text-center">
          비밀번호&nbsp;:&nbsp;<input type=password class="input-sm" ref="pwd" v-model="pwd" size=15>
        </td>
       </tr>
       <tr>
         <td class="text-center">
          <input type=button value="삭제" class="btn btn-sm btn-danger" @click="del">
          <input type=button value="취소" class="btn btn-sm btn-success" onclick="javascript:history.back()">
         </td>
       </tr>
      </table>
    </div>
   </main>
 </div>
</section>
 <script>
   new Vue({
	   el:'#sdelete',
	   data:{
		   study_id:${param.study_id},
		   pwd:''
	   },
	   methods:{
		   del:function(){
			   if(this.pwd==="")
			   {
				   this.$refs.pwd.focus()
				   return
			   }
			   axios.get('../study/delete_ok_vue.do',{
				   params:{
					   study_id:this.study_id,
					   pwd:this.pwd
				   }
			   }).then(res=>{
				   console.log(res.data)
				   let result=res.data
				   if(result==='yes')
				   {
					   location.href="../study/list.do"
				   }
				   else
				   {
					   alert("비밀번호가 틀립니다")
					   this.pwd=""
					   this.$refs.pwd.focus()
				   }
			   }).catch(error=>{
				   console.log(error.res)
			   })
		   }
	   }
   })
 </script>