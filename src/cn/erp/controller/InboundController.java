package cn.erp.controller;
/**
 * �����Ƶ�controller
 * @author lindy
 * @����ʱ�� 2020��5��19������4:15:22
 */

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


import cn.erp.pojo.Product;
import cn.erp.pojo.Producttype;
import cn.erp.pojo.User;
import cn.erp.service.InboundService;
import cn.erp.service.TypeService;
@Controller
@RequestMapping("/inbound")
public class InboundController {
    // ��������ҵ���ӿڶ���
    @Autowired
    private InboundService inboundService;
    // ���������ҵ���ӿڶ���
    @Autowired
    private TypeService typeService;
    
    // ������е�����
    @RequestMapping(value="/getAllList",method=RequestMethod.GET)
    public String getAllList(
        @RequestParam(name="currpage",defaultValue="1") int currpage
        ,Model model) {
        PageHelper.startPage(currpage, 4);
        List<Product> list = inboundService.getList();
        PageInfo pageInfo = new PageInfo(list, 4);
        // ����ҳʵ�屣�浽����ģ����
        model.addAttribute(pageInfo);
        return "inbound";
    }
    
    // ���������Ϣ�ķ���
    @RequestMapping(value="/saveInbound",method=RequestMethod.POST)
   
    public String saveInbound(HttpServletRequest request,HttpSession session) {
    	
        String proName = request.getParameter("proName");
        int yid =Integer.parseInt(request.getParameter("yid"));
        String proDescrible = request.getParameter("proDescrible");
        Double proPrice = Double.parseDouble(request.getParameter("proPrice"));
        String proPhoto = request.getParameter("proPhoto");
        int proNumber = Integer.parseInt(request.getParameter("proNumber"));
        String proType = request.getParameter("proType");
       
//        int uid = ((User)session.getAttribute("loginUser")).getUserId();
        // ����һ�������Ԥ������
        Product inbo = new Product();
      
       
        inbo.setProName(proName);
       inbo.setYid(yid);
        inbo.setProDescrible(proDescrible);
        inbo.setProPrice(proPrice);
        inbo.setProPhoto(proPhoto);
        inbo.setProNumber(proNumber);
        inbo.setProType(proType);
        boolean isOk = inboundService.addInbound(inbo);
        if (isOk) {
            return "redirect:getAllList";
        }else {
            return "inbound";
        }
    }
    
    // ������еķ�����Ϣ,��Ϊ������Ҫ��ҳ��һ�򿪵�ʱ�����Ҫȥ��ã�
    // ��������ʹ��ajax������
    @RequestMapping(value="/getTypeList",method=RequestMethod.GET)
    @ResponseBody
    public Object getTypeList() {
        List<Producttype> list = typeService.getTypeList();
        return JSON.toJSONString(list);
    }
    
    // ɾ�����ݵ�����
    @RequestMapping(value="/delInbound",method=RequestMethod.GET)
    @ResponseBody
    public Object delInbound(@RequestParam("id") int id) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        boolean isOk = inboundService.deleteInbound(id);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
    
    // ����id��ѯʵ���������
    @RequestMapping(value="/findInbound",method=RequestMethod.GET)
    @ResponseBody
    public Object findInbound(@RequestParam("pid") int pid) {
    	Product bound = inboundService.findInbound(pid);
        return JSON.toJSONString(bound);
    }
    
    // �����޸ĵ�����
    @RequestMapping(value="/updateInbound",method=RequestMethod.POST)
    @ResponseBody
    public Object changeInbound(Product bound,Producttype producttype,HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
		/* int uid = ((User)session.getAttribute("loginUser")).getUserId(); */
     
        boolean isOk = inboundService.updateInbound(bound);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/deleteInbound",method=RequestMethod.POST)
    @ResponseBody
    public Object deleteInbound(@RequestParam("id") int pid) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        boolean isOk = inboundService.deleteInbound(pid);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
}
