				function sendDelete(url) {
					console.log(url);
					fetch(url, {method: 'DELETE'})
				    .then(res => {
				    	if (res.status == 200) {
				    		window.location = window.location.pathname;
                        } else {
                            window.location.search = '?error=""';
                        }
				    });
				}
			    function sendPut(url) {
			    	console.log("update baby")
			    }