function! StartTask()
	normal! dd
	normal! gg
	exec "normal /^# Started\<CR>"
	normal! jp
	normal! A (started:
	call InsertDate()
	normal! kJ
	exec "normal A)\<Esc>2\<C-o>"
endfunction

function! CompleteTask()
	normal! ^lix
	normal! A (completed:
	call InsertDate()
	normal! kJ
	exec "normal A)\<Esc>dd/^# Completed\<CR>"
	normal! p
endfunction

function! NextActionTask()
	normal! dd
	normal! gg
	exec "normal /^# Next actions\<CR>"
	normal! }kp
endfunction

function! AddNewTask()
	normal! gg
	exec "normal /^# Inbox\<CR>"
	normal! }O[]
	startinsert!
endfunction

function! InsertDate()
	exec "r !date ".shellescape("+%d/%m/%Y %H:%M", 1)."\<CR>"
endfunction

nmap <leader>id :call InsertDate()<CR>
nmap <leader>wd :call CompleteTask()<CR>
"nmap <leader>ws :call StartTask()<CR>
nmap <leader>wn :call NextActionTask()<CR>
nmap <leader>wa :call AddNewTask()<CR>
