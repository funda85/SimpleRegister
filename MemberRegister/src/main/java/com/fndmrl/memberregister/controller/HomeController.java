package com.fndmrl.memberregister.controller;

import com.fndmrl.memberregister.model.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

import static com.fndmrl.memberregister.dao.MemberDao.INSTANCE;

@Controller
public class HomeController {
    private HttpServletRequest m_request;

    public HomeController(HttpServletRequest request) {
        m_request = request;

    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){

        return "index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register(){

        return new ModelAndView("register", "member", new Member());
    }

    @RequestMapping(value = "/addmember", method = RequestMethod.POST)
    public String addMember(@Valid Member model, BindingResult bindingResult, ModelMap modelMap){

        if(bindingResult.hasErrors()) {
            return "register";
        }
        else {
            INSTANCE.insert(model);

            modelMap.addAttribute("id", model.getId());
            modelMap.addAttribute("name", model.getName());
            modelMap.addAttribute("surname", model.getSurname());
            modelMap.addAttribute("email", model.getEmail());
            modelMap.addAttribute("phone", model.getPhone());
            modelMap.addAttribute("registertime", model.getRegistertime());
            modelMap.addAttribute("gender", model.getGender());

            return "result";
        }
    }

    @RequestMapping(value = "/members", method = RequestMethod.GET)
    public String getMembers(ModelMap modelMap){

        List<Member> members = INSTANCE.getAll();

        if(members.isEmpty())
            return "nomember";

        modelMap.addAttribute("members", members);

        return "members";
    }

    @RequestMapping(value = "/memberdetails", method = RequestMethod.POST)
    public String getMemberDetails(@RequestParam("id") int id, ModelMap modelMap) {

        var opt = INSTANCE.getMemberById(id);

        if (opt.isPresent()) {
            var member = opt.get();

            modelMap.addAttribute("member", member);
        }
        return "details";
    }

    @RequestMapping(value = "/findmember", method = RequestMethod.GET)
    public ModelAndView findFighter()
    {
        return new ModelAndView("findmember", "command", new Member());
    }

    @RequestMapping(value = "/searchmember", method = RequestMethod.POST)
    public String searchMember(@ModelAttribute("command")Member model, ModelMap modelMap)
    {
        var text = m_request.getParameter("search_text");

        if(text.isBlank()){
             return "findmember";
        }
        var members = INSTANCE.searchMember(text.trim().toLowerCase());

        var result = "notfound";

        if (!members.isEmpty()) {

           modelMap.addAttribute("members", members);

            result = "foundmember";
        }

        return result;
    }


    @RequestMapping(value = "/editmember/{id}", method = RequestMethod.GET)
    public String editMember(@PathVariable ("id") int id, Model model)
    {
        var opt = INSTANCE.getMemberById(id);

        if (opt.isPresent()) {
            var member = opt.get();

            model.addAttribute("command", member);
        }
        return "editform";
    }

    @RequestMapping(value="/editsave", method = RequestMethod.POST)
    public String editSave(@Valid @ModelAttribute ("command") Member member, BindingResult bindingResult, ModelMap modelMap){

        if(bindingResult.hasErrors()) {
            return "editform";
        }
        else {
            INSTANCE.update(member);

            modelMap.addAttribute("id", member.getId());
            modelMap.addAttribute("name", member.getName());
            modelMap.addAttribute("surname", member.getSurname());
            modelMap.addAttribute("email", member.getEmail());
            modelMap.addAttribute("phone", member.getPhone());
            modelMap.addAttribute("registertime", member.getRegistertime());
            modelMap.addAttribute("gender", member.getGender());

            return "edited";
        }
    }

    @RequestMapping(value="/deletemember/{id}", method = RequestMethod.GET)
    public String deleteMember(@PathVariable int id){

        INSTANCE.delete(id);

        return "deleted";
    }
}
