package main

test_delete_is_denied if {
	deny["aws_s3_bucket.old: deleting resources is not allowed"] with input as {"resource_changes": [{
		"address": "aws_s3_bucket.old",
		"mode": "managed",
		"type": "aws_s3_bucket",
		"change": {"actions": ["delete"], "after": null},
	}]}
}
