public static void main(String[] args) {
    Blade.create().get("/user", ctx -> {
        Integer age = ctx.fromInt("age");
        System.out.println("age is:" + age);
    }).start();
