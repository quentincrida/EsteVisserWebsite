import Vue from "vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#app",
    data: {
      title: "ToDo's",
      todos: [
        {name: "Buy shopping", priority: "high", complete: true},
        {name: "Clean bathroom", priority: "low", complete: false},
        {name: "Car's MOT", priority: "high", complete: false}
      ],
      newTodo: {
        name: "",
        priority: null,
        complete: false
      },
    },
    methods: {
      saveNewTodo: function(){
				this.todos.push(this.newTodo);
				this.newTodo = {
          name: "",
          priority: null,
          complete: false
        };
			},
      toggleComplete: function(index){
        let myTodo = this.todos[index];
        myTodo.complete = !myTodo.complete;
      }
    }

  });
});
