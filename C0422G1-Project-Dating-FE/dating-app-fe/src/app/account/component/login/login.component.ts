import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {AuthenticationService} from "../../../service/authentication/authentication.service";
import {Router} from "@angular/router";
import {TokenStorageService} from "../../../service/authentication/token-storage.service";
import {User} from "../../../user/model/user";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup = new FormGroup({
    username: new FormControl('', [Validators.required, Validators.minLength(12), Validators.maxLength(40)]),
    password: new FormControl('', [Validators.required, Validators.minLength(6), Validators.maxLength(40)]),
    remember: new FormControl()
  });
  username: string;
  roles: string[] = [];
  messageError: string;
  checkLogin: boolean = false;

  constructor(private authenticationService: AuthenticationService,
              private tokenStorageService: TokenStorageService,
              private router: Router,
              private toast: ToastrService) {


  }

  ngOnInit(): void {
    if (this.tokenStorageService.getToken()) {
      this.authenticationService.isLoggedIn = true;
      this.checkLogin = true;
      this.roles = this.tokenStorageService.getUser().roles;
      this.username = this.tokenStorageService.getUser().username;
    }
    if (this.checkLogin) {
      this.router.navigateByUrl('/user/newFeed')
    }
  }

  loginAccount() {
    if (this.loginForm.valid) {
      let username = this.loginForm.value.username;
      let password = this.loginForm.value.password;
      this.authenticationService.login(username, password).subscribe(next => {
        if (this.loginForm.value.remember) {
          this.tokenStorageService.saveTokenLocal(next.accessToken);
          this.tokenStorageService.saveUserLocal(next);
        } else {
          this.tokenStorageService.saveTokenSession(next.accessToken);
          this.tokenStorageService.saveUserSession(next);
        }

        this.authenticationService.isLoggedIn = true;
        this.checkLogin = true;
        this.username = this.tokenStorageService.getUser().username;
        this.roles = this.tokenStorageService.getUser().roles;
        this.authenticationService.getUserByEmail(this.tokenStorageService.getUser().email).subscribe(data => {
          console.log(data)
          if(data.status == 0) {
            this.router.navigate(['/user/create-user', data.user.idUser]);
          } else if(data.status == 14) {
            this.router.navigateByUrl('/share/error')
            this.toast.error("T??i kho???n c???a b???n b??? kho?? 1 tu???n", "Th??ng b??o")
          } else if(data.status == 15) {
            this.router.navigateByUrl('/share/error')
            this.toast.error("T??i kho???n c???a b???n b??? kho?? 1 th??ng", "Th??ng b??o")
          } else if(data.status == 16) {
            this.router.navigateByUrl('/share/error')
            this.toast.error("T??i kho???n c???a b???n b??? kho?? 1000 n??m", "Th??ng b??o")
          } else {
            this.loginForm.reset();
            this.router.navigateByUrl('');
          }

        });

      }, error => {
        this.authenticationService.isLoggedIn = false;
        this.messageError = 'T??n ????ng nh???p kh??ng t???n t???i ho???c sai m???t kh???u. Vui l??ng nh???p l???i!!!'
      })
    }
  }

}
