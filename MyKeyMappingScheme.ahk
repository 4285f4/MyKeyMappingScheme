; AutoHotkey v2 Capslock Remapping Script
#Requires AutoHotkey v2.0  ; 明确指定需要 v2 版本
#SingleInstance Force      ; 确保只有一个脚本实例在运行

; 永久关闭大写锁定状态的切换功能，仅允许通过脚本控制
; 注意：这使得 CapsLock 键本身不再切换大小写，除非通过下面的 Capslock & Tab 热键
SetCapsLockState "AlwaysOff"

; --- 导航 ---
; WASD 映射为方向键
CapsLock & w::Send "{Up}"
CapsLock & s::Send "{Down}"
CapsLock & a::Send "{Left}"
CapsLock & d::Send "{Right}"

; Home End
CapsLock & [::SendInput "{Home}"
CapsLock & ]::SendInput "{End}"

; --- CapsLock 状态切换 ---
; Capslock + Tab 切换实际的大小写状态
CapsLock & Tab::
{
    if GetKeyState("CapsLock", "T")  ; 检查 CapsLock 状态是否为 On (Toggled)
        SetCapsLockState "AlwaysOff" ; 如果是 On，则关闭
    else
        SetCapsLockState "AlwaysOn"  ; 如果是 Off，则开启
}

; --- 单独按下 CapsLock ---
; 如果 CapsLock 被按下并释放，且没有与其他键组合触发热键，则发送 Esc
CapsLock::Send "{Esc}"

; --- 编程常用键 ---
CapsLock & /::Send "{Delete}"
CapsLock & `;::Send "{Insert}"

; --- 功能键 F1-F12 ---
CapsLock & 1::Send "{F1}"
CapsLock & 2::Send "{F2}"
CapsLock & 3::Send "{F3}"
CapsLock & 4::Send "{F4}"
CapsLock & 5::Send "{F5}"
CapsLock & 6::Send "{F6}"
CapsLock & 7::Send "{F7}"
CapsLock & 8::Send "{F8}"
CapsLock & 9::Send "{F9}"
CapsLock & 0::Send "{F10}"
CapsLock & -::Send "{F11}"
CapsLock & =::Send "{F12}"

; --- 模拟小键盘 ---
CapsLock & n::Send "1"
CapsLock & m::Send "2"
CapsLock & ,::Send "3"
CapsLock & h::Send "4"
CapsLock & j::Send "5"
CapsLock & k::Send "6"
CapsLock & y::Send "7"
CapsLock & u::Send "8"
CapsLock & i::Send "9"
CapsLock & Space::Send "0"

; --- 截图 ---
CapsLock & p::Send "{PrintScreen}"

; --- 退出脚本热键 ---
^+`::ExitApp() ; 按 Ctrl + Shift + 反引号 退出脚本