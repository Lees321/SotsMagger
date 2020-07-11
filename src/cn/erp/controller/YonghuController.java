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
import cn.erp.pojo.User;
import cn.erp.service.OutboudService;
import cn.erp.service.YonghuService;
@Controller
@RequestMapping("/Yonghu")
public class YonghuController {
	@Autowired 
	private YonghuService yonghuService;
	@RequestMapping(value = "/getUserList", method = RequestMethod.GET)
	public String getOutboudList(@RequestParam(name="currpage",defaultValue = "1",required=false)int currpage,
			Model model) {
		PageHelper.startPage(currpage, 4);
		List<User> list = yonghuService.getOutboudList();
		PageInfo pageInfo = new PageInfo(list, 4);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin";
	}
	//����
	@RequestMapping(value="/addOutboud",method=RequestMethod.POST)
 
    public Object addOutboud(HttpSession session,HttpServletRequest request) {
//        Map<String, Integer> map = new HashMap<String, Integer>();
        // �����������ݵķ���
//        int uid = ((User)session.getAttribute("loginUser")).getUserId();
//        boud.setCreateBy(uid);
//        boud.setBoudDate(new Date());
        String userName = request.getParameter("userName");
        
        String userPassword = request.getParameter("userPassword");
        
        String userGender = request.getParameter("userGender");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");
        String userPhoto = request.getParameter("userPhoto");
      
       
       User boud=new User();
//        boud.setBolgTitle(bolgTitle);
//        boud.setBlogComment(blogComment);
//        boud.setBlogCommentPhoto(blogCommentPhoto);
       boud.setUserName(userName);
       boud.setUserPassword(userPassword);
       boud.setUserGender(userGender);
       boud.setUserEmail(userEmail);
       boud.setUserPhone(userPhone);
       boud.setUserPhoto(userPhoto);
        boud.setCreateTime(new Date());
        boolean isOk = yonghuService.addOutboud(boud);
        
        if (isOk) {
            return "redirect:getUserList";
        }else {
            return "admin";
        }
    }
	//ɾ��
	
	   
	@RequestMapping(value="/delUser",method=RequestMethod.GET)
    @ResponseBody
    public Object delOutboud(@RequestParam("id") int userId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        boolean isOk = yonghuService.delOutboud(userId);
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
    public Object findById(@RequestParam("id") int userId) {
        // ����ͨ��id����ʵ��ķ���
    	User boud = yonghuService.findById(userId);
        return JSON.toJSONString(boud);
    }
    //�޸�
    @RequestMapping(value="/updateOutboud",method=RequestMethod.POST)
    @ResponseBody
    public Object updateOutboud(User boud,HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        // �����������ݵķ���
//        int uid = ((User)session.getAttribute("loginUser")).getUserId();
//        boud.setModifyBy(uid);
//        boud.setModifyTime(new Date());
        boolean isOk = yonghuService.updateOutboud(boud);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
}
