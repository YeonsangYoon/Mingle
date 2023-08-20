new Vue({
    el:'#vue-area',
    data:{ // 명시적 초기화
        study_list:[],
        curpage:1,
        totalpage:0,
        startpage:0,
        endpage:0
    },
    mounted:function(){
        this.send()
    },
    methods:{
        send:function(){
            axios.get("/mingle/study/list_vue.do",{
                params:{ // 전송할 데이터
                    page:this.curpage
                }
            }).then(response => {
                console.log(response.data);
                this.curpage = response.data.curpage;
                this.totalpage = response.data.totalpage;
                this.study_list = response.data.list;
                this.startpage = (Math.trunc((this.curpage-1)/5)*5) + 1;
                this.endpage = (this.startpage+4 > this.totalpage) ? this.totalpage : this.startpage+4;
            })
        },
        range:function(start,end){
            let arr=[]
            let length=end-start
            for(let i=0;i<=length;i++)
            {
                arr[i]=start;
                start++;
            }
            return arr
        },
        prev:function(){
            this.curpage=this.startpage-1
            this.send()
        },
        next:function(){
            this.curpage=this.endpage+1
            this.send()
        },
        selectpage:function(page){
            this.curpage=page
            this.send()
        }
    }
})