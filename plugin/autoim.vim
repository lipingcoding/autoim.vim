"""""""""""""""""""""""""""
"AutoIM
"""""""""""""""""""""""""""
let g:lv_restore_last_im = 0

function! AutoIM(event)
	let s:is_abc_path = expand('%:p:h') . "/is_abc"
	let s:toggle_input_method_path = expand('%:p:h') . "/cmd_space.scpt"
	let s:toggle_input_method_command = 'osascript ' . s:toggle_input_method_path

	let is_abc = system(s:is_abc_path)!= ''

	let need_switch_im = 0
	if a:event == 'leave'
		if !is_abc
			let g:lv_restore_last_im = 1
			let need_switch_im = 1
		else
			let g:lv_restore_last_im = 0
		end
	else " a:event == 'enter'
		if is_abc && g:lv_restore_last_im
			let need_switch_im = 1
		end
	end

	if need_switch_im 
		let tmp=system(s:toggle_input_method_command)
	end
endfunction

autocmd InsertEnter * call AutoIM("enter")
autocmd InsertLeave * call AutoIM("leave")
