package cn.erp.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.erp.pojo.User;
import cn.erp.service.UserService;

/**
 * �����û������Ŀ�����
 * @author lindy
 * @����ʱ�� 2020��5��12������11:36:16
 */
//@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    
    // ����ķ���
    @RequestMapping(value="/dologin",method=RequestMethod.POST)
    public String doLogin(@RequestParam("userName") String userName,
        @RequestParam("userPassword") String userPassword,
        @RequestParam("code") String code,
        HttpSession session) {
        // �ж���֤���ֵ�Ƿ��뱣����session�е�ֵ��ͬ
        if(!((String)session.getAttribute("yzm")).equals(code)) {
            return "login";
        }
        User user = userService.loginValider(userName, userPassword);
        if(user != null) {
            session.setAttribute("loginUser", user);
            return "redirect:index.jsp";
        }
        return "login";
    }
    
    @RequestMapping("/index")
    public String index(Model model) {
        //List<User> list = userService.getUserList();
        //model.addAttribute("list", list);
        return "index";
    }
    
    // �˳�������
    @RequestMapping(value="/loginOut",method=RequestMethod.GET)
    public String loginout(HttpSession session) {
        session.invalidate();
        return "login";
    }
    
    // ����һ�������֤�������
    @RequestMapping(value="/CodeImg",method=RequestMethod.GET)
    public void getCode(HttpServletRequest req,HttpServletResponse resp) throws Exception {
     // ������Ӧ�ĸ�ʽ����
        resp.setHeader("Content-Type", "image/jpeg");
        // ����ͼƬ�Ŀ�͸�
        int w = 80;
        int h = 30;
        // ����һ��RGB��ʽ���ڴ��е�ͼƬ
        BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        // ����һ������ͼ��Ķ���
        Graphics g = img.getGraphics();
        // �ѱ������ɫ
        g.setColor(Color.white);
        g.fillRect(0, 0, w, h);
        // ��������
        g.setFont(new Font("aa", Font.BOLD, 18));
        // ������draw��4���������
        Random r = new Random();
        // ����һ�����������ĸ������ַ���
        String yzm = "";
        for (int i = 0; i < 4; i++) {
            int a = r.nextInt(10);// ����0~9֮����������
            int y = 15 + r.nextInt(10);// ��������Ĵ�ֱλ��
            // ���������ɫ
            Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
            g.setColor(c);
            g.drawString("" + a, i * 15, y);
            // ����֤��ת��Ϊ�ַ���׷�ӵ�yzm��
            yzm += a;
        }
        // ��yzm����session
        req.getSession().setAttribute("yzm", yzm);
        // ������������
        for (int i = 0; i < 10; i++) {
            // ���������ɫ
            Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
            g.setColor(c);
            g.drawLine(r.nextInt(60), r.nextInt(30), r.nextInt(60), r.nextInt(30));
        }
        g.dispose();// ������IO�е�flush(),��ͼ������ˢ��img��
        // ���ڴ�ͼƬ img ���󱣴浽һ�� jpg �ļ�
        ImageIO.write(img, "JPEG", resp.getOutputStream());
    }
    
    
    
    @RequestMapping(value = "/userList", method = RequestMethod.GET,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String userList(HttpServletResponse response) throws Exception {
        //List<User> list = userService.getUserList();
        //return JSON.toJSONString(list);
        /*PrintWriter out = response.getWriter();
        out.write("<script>window.parent.location.href='';</script>");
        out.flush();*/
        return "/user";
    }
	 @RequestMapping(value="/upword",method=RequestMethod.POST)
	    public String update(HttpServletRequest request,HttpSession session) {
		
	      int userId=Integer.parseInt(request.getParameter("userId"));
	       String repassword=request.getParameter("repassword");
	       User user1=new User();
	       user1.setUserPassword(repassword);
	      user1.setUserId(userId);
	        int list = userService.Update(user1);
	        session.setAttribute("list", list);
	    	   return "updatePwd";
	     
	       
	        
	        
	    }
}
