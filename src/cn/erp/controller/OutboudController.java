package cn.erp.controller;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.erp.pojo.Blog;
import cn.erp.service.OutboudService;

@Controller
@RequestMapping("/boud")
public class OutboudController {
	@Autowired 
	private OutboudService outboudService;
	@RequestMapping(value = "/getOutboudList", method = RequestMethod.GET)
	public String getOutboudList(@RequestParam(name="currpage",defaultValue = "1",required=false)int currpage,
			Model model) {
		PageHelper.startPage(currpage, 4);
		List<Blog> list = outboudService.getOutboudList();
		PageInfo pageInfo = new PageInfo(list, 4);
		model.addAttribute("pageInfo", pageInfo);
		return "/outBoud";
	}
	//����
	@RequestMapping(value="/addOutboud",method=RequestMethod.POST)
 
    public Object addOutboud(HttpSession session,HttpServletRequest request) {
//        Map<String, Integer> map = new HashMap<String, Integer>();
        // �����������ݵķ���
//        int uid = ((User)session.getAttribute("loginUser")).getUserId();
//        boud.setCreateBy(uid);
//        boud.setBoudDate(new Date());
        String blogTitle = request.getParameter("blogTitle");
        
        String blogComment = request.getParameter("blogComment");
        
        String blogCommentPhoto = request.getParameter("blogCommentPhoto");
       int userId=Integer.parseInt(request.getParameter("userId"));
       
        Blog boud=new Blog();
        boud.setBlogTitle(blogTitle);
        boud.setBlogComment(blogComment);
        boud.setBlogCommentPhoto(blogCommentPhoto);
       boud.setUserId(userId);
        boud.setCreateTime(new Date());
        boolean isOk = outboudService.addOutboud(boud);
        
        if (isOk) {
            return "redirect:getOutboudList";
        }else {
            return "outBoud";
        }
    }
	//ɾ��
	
	   
	@RequestMapping(value="/delOutboud",method=RequestMethod.GET)
    @ResponseBody
    public Object delOutboud(@RequestParam("id") int blogId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        boolean isOk = outboudService.delOutboud(blogId);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
	
	 //��ѯ
    @RequestMapping(value="/findById",method=RequestMethod.GET)
    @ResponseBody
    public Object findById(@RequestParam("id") int bolgId) {
        // ����ͨ��id����ʵ��ķ���
    	Blog boud = outboudService.findById(bolgId);
        return JSON.toJSONString(boud);
    }
    //�޸�
    @RequestMapping(value="/updateOutboud",method=RequestMethod.POST)
    @ResponseBody
    public Object updateOutboud(Blog boud,HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        // �����������ݵķ���
//        int uid = ((User)session.getAttribute("loginUser")).getUserId();
//        boud.setModifyBy(uid);
//        boud.setModifyTime(new Date());
        boolean isOk = outboudService.updateOutboud(boud);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
}
