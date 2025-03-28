; ==============================================================================
; AutoHotkey v2 CapsLock Remapping Script (Revised)
; AutoHotkey v2 CapsLock 重映射脚本 (修订版)
; ==============================================================================
; Purpose: Remap CapsLock to act as a modifier key for navigation, editing,
;          function keys, numpad simulation, etc., while retaining the ability
;          to toggle CapsLock state via CapsLock+Tab and send Esc on standalone press.
; 目的: 将 CapsLock 重映射为一个修饰键，用于导航、编辑、功能键、小键盘模拟等，
;       同时保留通过 CapsLock+Tab 切换 CapsLock 状态以及单独按下时发送 Esc 的能力。
; ==============================================================================

; === Script Configuration ===
; === 脚本配置 ===
#Requires AutoHotkey v2.0      ; Ensure v2 compatibility / 确保 v2 兼容性
#SingleInstance Force          ; Allow only one instance / 只允许一个实例运行
SetCapsLockState "AlwaysOff"   ; Disable built-in CapsLock toggle functionality / 禁用内置的 CapsLock 切换功能


; === Standalone CapsLock Behavior (Send Esc) ===
; === 单独按下 CapsLock 的行为 (发送 Esc) ===
~CapsLock::
{
    if KeyWait("CapsLock", "T0.2") && A_PriorKey == "CapsLock"
        Send "{Esc}"
    KeyWait("CapsLock")
}


; ==============================================================================
; === CapsLock Modifier Hotkeys ===
; === CapsLock 修饰键热键 ===
; ==============================================================================
; {Blind}: Prevents Send from releasing physical modifiers (Shift, Ctrl, Alt).
;          Ensures combinations like Shift+Caps+W send Shift+Up.
; {Blind}: 防止 Send 命令释放物理按下的修饰键 (Shift, Ctrl, Alt)。
;          确保像 Shift+Caps+W 这样的组合能发送 Shift+Up。
; Down/Up Separation: Allows holding the key (e.g., Caps+W behaves like holding Up).
; Down/Up 分离: 允许按住按键 (例如 Caps+W 的行为像按住 Up 键)。

; --- Navigation --- (Needs Blind + Down/Up for holding and modifiers)
; --- 导航 --- (需要 Blind + Down/Up 以支持按住和修饰键)
CapsLock & w::SendInput "{Blind}{Up Down}"
CapsLock & w Up::SendInput "{Blind}{Up Up}"
CapsLock & s::SendInput "{Blind}{Down Down}"
CapsLock & s Up::SendInput "{Blind}{Down Up}"
CapsLock & a::SendInput "{Blind}{Left Down}"
CapsLock & a Up::SendInput "{Blind}{Left Up}"
CapsLock & d::SendInput "{Blind}{Right Down}"
CapsLock & d Up::SendInput "{Blind}{Right Up}"
CapsLock & [::SendInput "{Blind}{Home Down}"
CapsLock & [ Up::SendInput "{Blind}{Home Up}"
CapsLock & ]::SendInput "{Blind}{End Down}"
CapsLock & ] Up::SendInput "{Blind}{End Up}"


; --- Editing & Programming Keys ---
; --- 编辑与编程键 ---
; Delete needs Blind + Down/Up for holding and modifiers
; Delete 需要 Blind + Down/Up 以支持按住和修饰键
CapsLock & /::SendInput "{Blind}{Delete Down}"
CapsLock & / Up::SendInput "{Blind}{Delete Up}"

; Insert usually needs a tap; Blind is needed for Shift/Ctrl+Insert combinations
; Insert 通常只需要敲击；需要 Blind 来支持 Shift/Ctrl+Insert 组合
CapsLock & `;::SendInput "{Blind}{Insert}"


; --- Function Keys (F1-F12) --- (Need Blind for modifiers, usually no Down/Up)
; --- 功能键 (F1-F12) --- (需要 Blind 以支持修饰键，通常不需要 Down/Up)
CapsLock & 1::Send "{Blind}{F1}"
CapsLock & 2::Send "{Blind}{F2}"
CapsLock & 3::Send "{Blind}{F3}"
CapsLock & 4::Send "{Blind}{F4}"
CapsLock & 5::Send "{Blind}{F5}"
CapsLock & 6::Send "{Blind}{F6}"
CapsLock & 7::Send "{Blind}{F7}"
CapsLock & 8::Send "{Blind}{F8}"
CapsLock & 9::Send "{Blind}{F9}"
CapsLock & 0::Send "{Blind}{F10}"
CapsLock & -::Send "{Blind}{F11}" ; Hyphen/Minus key / 连字符/减号键
CapsLock & =::Send "{Blind}{F12}" ; Equals key / 等号键


; --- Numpad Simulation ---
; --- 模拟小键盘 ---
; Simple Send is usually sufficient here. Add {Blind} if Shift/Ctrl combos are needed.
; 这里简单的 Send 通常足够。如果需要 Shift/Ctrl 组合，则添加 {Blind}。
; Example: CapsLock & n::Send "{Blind}1" if Shift+Caps+n should send !
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


; --- Utility Keys ---
; --- 功能/工具键 ---
; PrintScreen kept with Blind + Down/Up for max compatibility (e.g., Alt+PrtSc)
; PrintScreen 保留 Blind + Down/Up 以获得最大兼容性 (例如 Alt+PrtSc)
CapsLock & p::SendInput "{Blind}{PrintScreen Down}"
CapsLock & p Up::SendInput "{Blind}{PrintScreen Up}"


; --- CapsLock State Control ---
; --- CapsLock 状态控制 ---
CapsLock & Tab::
{
    if GetKeyState("CapsLock", "T")
        SetCapsLockState "AlwaysOff"
    else
        SetCapsLockState "AlwaysOn"
}


; ==============================================================================
; === Script Management ===
; === 脚本管理 ===
; ==============================================================================
^+`::ExitApp() ; Ctrl + Shift + Grave Accent (`) to exit the script

; ==============================================================================
; === End of Script ===
; === 脚本结束 ===
; ==============================================================================